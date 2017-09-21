//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYAppUtil.h"

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

+ (void)fy_openURL:(NSString *)scheme completionHandler:(void (^ __nullable)(BOOL success))completion {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL
                     options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@ : %d", scheme, success);
               if (completion) {
                   completion(success);
               }
           }];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        BOOL success = [application openURL:URL];
#pragma clang diagnostic pop
        NSLog(@"Open %@ : %d", scheme, success);
        if (completion) {
            completion(success);
        }
    }
}

+ (void)fy_openSettingsPage {
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
        [FYAppUtil fy_openURL:UIApplicationOpenSettingsURLString completionHandler:NULL];
    }
}

+ (void)fy_appraiseInAppStoreWithAppId:(NSString *)appId {
    NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8", appId];
    [self.class fy_openURL:url completionHandler:NULL];
}

+ (void)fy_downloadInAppStoreWithAppId:(NSString *)appId {
    NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/%@", appId];
    [self.class fy_openURL:url completionHandler:NULL];
}

@end
