//
//  SABRequestManager.m
//  SensorsABTest
//
//  Created by 彭远洋 on 2021/11/23.
//  Copyright © 2021 Sensors Data Inc. All rights reserved.
//

#import "SABRequestManager.h"
#import "SensorsABTestExperiment+Private.h"


@interface SABRequestTask : NSObject

@property (nonatomic, strong) SABExperimentRequest *request;
@property (nonatomic, strong) NSMutableArray<SensorsABTestExperiment*>  *experiments;

@end

@implementation SABRequestTask

- (instancetype)initWithRequest:(SABExperimentRequest *)request {
    self = [super init];
    if (self) {
        _request = request;
        _experiments = [NSMutableArray array];
    }
    return self;
}

@end

@interface SABRequestManager ()

@property (nonatomic, strong) NSMutableArray<SABRequestTask *> *tasks;
@end

@implementation SABRequestManager

- (NSMutableArray<SABRequestTask *> *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableArray array];
    }
    return _tasks;
}

- (SABRequestTask *)requestTask:(SABExperimentRequest *)request {
    __block SABRequestTask *task;
    [self.tasks enumerateObjectsUsingBlock:^(SABRequestTask * obj, NSUInteger idx, BOOL * stop) {
        // 当有相同任务时，将当前获取试验相关信息关联至相同任务上
        if ([obj.request isEqualToRequest:request]) {
            task = obj;
            *stop = YES;
        }
    }];
    return task;
}

- (BOOL)containsRequest:(SABExperimentRequest *)request {
    SABRequestTask *task = [self requestTask:request];
    // 当前只针对 Fast 模式开启合并接口逻辑，后续针对 Async 模式也开启时，只需要修改此处逻辑即可
    return task.experiments.firstObject.modeType == SABFetchABTestModeTypeFast;
}

- (void)mergeExperimentWithRequest:(SABExperimentRequest *)request experiment:(SensorsABTestExperiment *)experiment {
    SABRequestTask *task = [self requestTask:request];
    [task.experiments addObject:experiment];
}

- (void)addRequestTask:(SABExperimentRequest *)request experiment:(SensorsABTestExperiment *)experiment {
    SABRequestTask *task = [[SABRequestTask alloc] initWithRequest:request];
    [task.experiments addObject:experiment];
    [self.tasks addObject:task];
}

- (void)excuteExperimentsWithRequest:(SABExperimentRequest *)request completion:(void(^)(SensorsABTestExperiment *))completion {
    SABRequestTask *task = [self requestTask:request];
    // 当存在当前任务时，直接移除任务。防止在遍历过程中有新的任务合并进当前任务
    [self.tasks removeObject:task];

    if (task.experiments.count == 0) {
        return;
    }
    [task.experiments enumerateObjectsUsingBlock:^(SensorsABTestExperiment * obj, NSUInteger idx, BOOL * stop) {
        completion(obj);
    }];
}

@end
