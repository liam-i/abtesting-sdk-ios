//
// SABManager.h
// SensorsABTest
//
// Created by 储强盛 on 2020/9/29.
// Copyright © 2020-2022 Sensors Data Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import "SensorsABTestConfigOptions.h"
#import "SensorsABTestExperiment.h"

NS_ASSUME_NONNULL_BEGIN

/// 试验结果数据管理
@interface SABManager : NSObject

- (instancetype)init NS_UNAVAILABLE;

/// SABManager 初始化
/// @param configOptions configOptions 参数配置
/// @return SABManager 实例对象
- (instancetype)initWithConfigOptions:(SensorsABTestConfigOptions *)configOptions NS_DESIGNATED_INITIALIZER;

/// 获取试验结果
/// @param experiment 试验实例对象
- (void)fetchABTestWithExperiment:(SensorsABTestExperiment *)experiment;

@end

NS_ASSUME_NONNULL_END
