//
// Created by fengyiyi on 2018/7/16.
// Copyright (c) 2018 ___FULLUSERNAME___. All rights reserved.
//

#import "FYInstall+Bugly.h"
#import "FYAppUtil.h"
#import <Bugly/Bugly.h>

@implementation FYInstall (Bugly)

+ (void)fy_installBuglyWithAppId:(NSString *)appId {
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