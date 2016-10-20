//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYAppInfo : NSObject

+ (NSString *)appName;

+ (NSString *)appBundleId;

// 应用的版本号
+ (NSString *)appVersion;

+ (UIImage *)appIconImage;

+ (void)suspendAppAndExit;

+ (BOOL)isRegisteredRemoteNotification;

// unix时间戳
+ (NSString *)unixTimestamp;

+ (NSString *)channelName;
@end