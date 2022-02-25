//
// SABTestTriggerIdentifier.h
// SensorsABTest
//
// Created by  储强盛 on 2022/2/15.
// Copyright © 2015-2022 Sensors Data Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 事件标识，用户区分是否触发过 $ABTestTrigger 事件
@interface SABTestTriggerIdentifier : NSObject

/// 自定义主体 ID
@property (nonatomic, copy) NSDictionary <NSString*, NSString*> *customIDs;

- (instancetype)init NS_UNAVAILABLE;

/// 指定初始化方法
- (instancetype)initWithExperimentId:(NSString *)experimentId distinctId:(NSString *)distinctId NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END