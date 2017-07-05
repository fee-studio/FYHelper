//
// Created by xiaojia on 03/04/2017.
// Copyright (c) 2017 xiaojia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"



#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_OFF;
#endif


#define FYLogError(frmt, ...)   DDLogError(frmt, ##__VA_ARGS__)
#define FYLogWarn(frmt, ...)    DDLogWarn(frmt, ##__VA_ARGS__)
#define FYLogInfo(frmt, ...)    DDLogInfo(frmt, ##__VA_ARGS__)
#define FYLogDebug(frmt, ...)   DDLogDebug(frmt, ##__VA_ARGS__)
#define FYLogVerbose(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)


@interface DDLog (FYInstall)

+ (void)fy_install;

@end