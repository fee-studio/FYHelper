//
// Created by efeng on 2017/7/3.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

#import "Bugly+FYSetup.h"
#import "FYAppUtil.h"

static NSString *const BUGLY_APP_ID = @"23c3fe70a3"; // TODO: modify here

@implementation Bugly (FYSetup)

+ (void)fy_setup {
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.blockMonitorEnable = YES;
    config.channel = [FYAppUtil fy_appChannelName];

    [Bugly startWithAppId:BUGLY_APP_ID
#ifdef DEBUG
        developmentDevice:YES
#endif
                   config:config];
}


@end