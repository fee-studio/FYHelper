//
// Created by xiaojia on 03/04/2017.
// Copyright (c) 2017 xiaojia. All rights reserved.
//

#import "DDLog+FYSetup.h"
#import <CocoaLumberjack/CocoaLumberjack.h>


@implementation DDLog (FYSetup)


+ (void)fy_setup {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];

    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}


@end