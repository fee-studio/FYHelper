//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYAppUtil : NSObject

+ (NSString *)fy_appName;

+ (NSString *)fy_appBundleId;

+ (NSString *)fy_appVersion;

+ (UIImage *)fy_appIconImage;

/**
 * 暂停、推出
 */
+ (void)fy_appSuspendAndExit;

/**
 * 是否同意打开远程推送
 */
+ (BOOL)fy_isRegisteredRemoteNotification;

/**
 *  App的时间戳
 */
+ (NSString *)fy_appTimestamp;

/**
 * App的渠道名,默认为AppStore
 * 注意，请在app的info.plist文件中增加Channel项，如下：
 * 	<key>Channel</key>
 * 	<string>default_channel</string>
 * @return channel name
 */
+ (NSString *)fy_appChannelName;

/**
 * fy open url
 */
+ (void)fy_openURL:(NSString *)scheme completionHandler:(void (^ __nullable)(BOOL success))completion;

/**
 * 打开系统的设置页面
 */
+ (void)fy_openSettingsPage;

/**
 * 去AppStore评分
 * @param appId App在AppStore中的ID号
 */
+ (void)fy_appraiseInAppStoreWithAppId:(NSString *_Nonnull)appId;

/**
 * 去AppStore下载
 */
+ (void)fy_downloadInAppStoreWithAppId:(NSString *_Nonnull)appId;

@end
