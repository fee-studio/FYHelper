//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYAppUtil.h"
#import "FYDeviceUtil.h"
#import <CoreTelephony/CTCellularData.h>

@implementation FYAppUtil {

}

+ (NSString *)fy_appName {
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return appName;
}

+ (NSString *)fy_appBundleId; {
    NSString *appBundleId = [[NSBundle mainBundle] infoDictionary][(__bridge NSString *) kCFBundleIdentifierKey];
    return appBundleId;
}

+ (UIImage *)fy_appIconImage; {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage *image = [UIImage imageNamed:icon];
    return image;
}

+ (void)fy_appSuspendAndExit {
    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    //exit app when app is in background
    exit(0);
}

+ (BOOL)fy_isRegisteredRemoteNotification {
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        return [application isRegisteredForRemoteNotifications];
    } else {
        return application.enabledRemoteNotificationTypes != UIRemoteNotificationTypeNone;
    }
}

+ (NSString *)fy_appVersion {
    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)fy_appTimestamp {
    NSDate *date = [NSDate date];
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%li", (long) timestamp];
}

+ (NSString *)fy_appChannelName {
    NSString *chName = [[NSBundle mainBundle] infoDictionary][@"Channel"];
    if (chName && [[chName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return chName;
    } else {
        return @"AppStore";
    }
}

/**
检测网络权限

@return 是否有权限 0 关闭 1 仅wifi 2 流量+wifi
*/
+ (int)checkNetWorkPermission {
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    return state;
}

+ (void)fy_openURL:(NSString *)url completionHandler:(void (^ __nullable)(BOOL success))completion {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:url];
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {

#pragma clang diagnostic push
#pragma ide diagnostic ignored "UnavailableInDeploymentTarget"
        [application openURL:URL
                     options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@ : %d", url, success);
               if (completion) {
                   completion(success);
               }
           }];
#pragma clang diagnostic pop

    } else {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        BOOL success = [application openURL:URL];
        NSLog(@"Open %@ : %d", url, success);
        if (completion) {
            completion(success);
        }
#pragma clang diagnostic pop
    }
}

+ (void)fy_openSettingsPage {
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
        [FYAppUtil fy_openURL:UIApplicationOpenSettingsURLString completionHandler:NULL];
    }
}

+ (void)fy_appraiseInAppStoreWithAppId:(NSString *)appId {
    // http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8
    // NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8", appId];
    /*
    NSString *url;
    if ([FYDeviceUtil fy_systemVersionCode] >= 11.0) {
        url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/twitter/id%@?mt=8&action=write-review ", appId];
    } else {
        url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appId];
    }
    [self fy_openURL:url completionHandler:NULL];
    */

    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/us/app/itunes-u/id%@?action=write-review&mt=8", appId];
    [self fy_openURL:url completionHandler:NULL];
}

+ (void)fy_downloadInAppStoreWithAppId:(NSString *)appId {
    NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/%@", appId];
    [self.class fy_openURL:url completionHandler:NULL];
}

// 番茄工作法
// https://itunes.apple.com/cn/app/%E7%95%AA%E8%8C%84%E5%B7%A5%E4%BD%9C%E6%B3%95-%E4%B8%93%E6%B3%A8%E5%B7%A5%E4%BD%9C%E5%AD%A6%E4%B9%A0%E5%91%8A%E5%88%AB%E6%8B%96%E5%BB%B6%E7%9A%84%E5%88%A9%E5%99%A8/id1238739036?mt=8
// https://itunes.apple.com/cn/app/id1238739036?mt=8
@end
