//
//  ViewController.m
//  Example-macOS
//
//  Created by 储强盛 on 2021/6/18.
//  Copyright © 2021 Sensors Data Inc. All rights reserved.
//

#import "ViewController.h"
#import <SensorsABTest.h>
#import <SensorsAnalyticsSDK.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

#pragma mark - fetchABTest
#pragma mark STRING
- (IBAction)stringFetchCache:(NSButton *)sender {
   NSString *result = [SensorsABTest.sharedInstance fetchCacheABTestWithParamName:@"sringId" defaultValue:@"默认值"];
    NSLog(@"fetchCacheABTest STRING experiment，paramName：%@ - result:%@\n", @"sringId", result);
}

- (IBAction)stringAsyncFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance asyncFetchABTestWithParamName:@"sringId" defaultValue:@"默认值" completionHandler:^(id  _Nullable result) {
        NSLog(@"asyncFetchABTest STRING experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

- (IBAction)stringFastFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance fastFetchABTestWithParamName:@"sringId" defaultValue:@"默认值" completionHandler:^(id  _Nullable result) {
        NSLog(@"fastFetchABTest STRING experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

#pragma mark INTEGER
- (IBAction)intFetchCache:(NSButton *)sender {
   NSString *result = [SensorsABTest.sharedInstance fetchCacheABTestWithParamName:@"tst" defaultValue:@(100)];
    NSLog(@"fetchCacheABTest INTEGER experiment，paramName：%@ - result:%@\n", @"tst", result);
}

- (IBAction)intAsyncFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance asyncFetchABTestWithParamName:@"tst" defaultValue:@(100) completionHandler:^(id  _Nullable result) {
        NSLog(@"asyncFetchABTest INTEGER experiment，paramName：%@ - result:%@\n", @"tst", result);
    }];
}

- (IBAction)intFastFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance fastFetchABTestWithParamName:@"tst" defaultValue:@(100) completionHandler:^(id  _Nullable result) {
        NSLog(@"fastFetchABTest INTEGER experiment，paramName：%@ - result:%@\n", @"tst", result);
    }];
}

#pragma mark BOOLEAN
- (IBAction)boolFetchCache:(NSButton *)sender {
   NSString *result = [SensorsABTest.sharedInstance fetchCacheABTestWithParamName:@"sringId" defaultValue:@(NO)];
    NSLog(@"fetchCacheABTest BOOLEAN experiment，paramName：%@ - result:%@\n", @"sringId", result);
}

- (IBAction)boolAsyncFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance asyncFetchABTestWithParamName:@"sringId" defaultValue:@(NO) completionHandler:^(id  _Nullable result) {
        NSLog(@"asyncFetchABTest BOOLEAN experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

- (IBAction)boolFastFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance fastFetchABTestWithParamName:@"sringId" defaultValue:@(NO) completionHandler:^(id  _Nullable result) {
        NSLog(@"fastFetchABTest BOOLEAN experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

#pragma mark JSON
- (IBAction)jsonFetchCache:(NSButton *)sender {
    NSString *result = [SensorsABTest.sharedInstance fetchCacheABTestWithParamName:@"sringId" defaultValue:@{@"name": @"默认值"}];
    NSLog(@"fetchCacheABTest JSON experiment，paramName：%@ - result:%@\n", @"sringId", result);
}

- (IBAction)jsonAsyncFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance asyncFetchABTestWithParamName:@"sringId" defaultValue:@{@"name": @"默认值"} completionHandler:^(id  _Nullable result) {
        NSLog(@"asyncFetchABTest JSON experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

- (IBAction)jsonFastFetch:(NSButton *)sender {
    [SensorsABTest.sharedInstance fastFetchABTestWithParamName:@"sringId" defaultValue:@{@"name": @"默认值"} completionHandler:^(id  _Nullable result) {
        NSLog(@"fastFetchABTest JSON experiment，paramName：%@ - result:%@\n", @"sringId", result);
    }];
}

#pragma mark - login

- (IBAction)loginAction:(NSButton *)sender {
    [SensorsAnalyticsSDK.sharedInstance login:@"macOS_login_202107141549" withProperties:@{@"name": @"macOS 测试登录"}];
}

- (IBAction)identifyAction:(NSButton *)sender {
    [SensorsAnalyticsSDK.sharedInstance identify:@"identify_123654"];
}

- (IBAction)logoutAction:(NSButton *)sender {
    [SensorsAnalyticsSDK.sharedInstance logout];
}

- (IBAction)resetAnonymousIdAction:(NSButton *)sender {
    [SensorsAnalyticsSDK.sharedInstance resetAnonymousId];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
