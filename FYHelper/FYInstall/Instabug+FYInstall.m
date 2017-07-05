//
// Created by efeng on 2017/7/5.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

#import "Instabug+FYInstall.h"


@implementation Instabug (FYInstall)

+ (void)fy_installWithToken:(NSString *)token {
    [Instabug startWithToken:token invocationEvent:IBGInvocationEventShake];
}

+ (void)fy_uninstallWithToken:(NSString *)token {
    [Instabug startWithToken:token invocationEvent:IBGInvocationEventNone];
}


@end