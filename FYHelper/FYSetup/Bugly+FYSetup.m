//
// Created by efeng on 2017/7/3.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

#import "Bugly+FYSetup.h"
#import "FYAppUtil.h"


@implementation Bugly (FYSetup)

+ (void)fy_setupWithAppId:(NSString *)appId {
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.blockMonitorEnable = YES;
    config.channel = [FYAppUtil fy_appChannelName];

    [Bugly startWithAppId:appId
#ifdef DEBUG
        developmentDevice:YES
#endif
                   config:config];
}


@end