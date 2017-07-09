//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYAppUtil.h"
//#import "NSString+FYHelper.h"

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
               completion(success);
           }];
    } else {
        BOOL success = [application openURL:URL];
        NSLog(@"Open %@ : %d", scheme, success);
        completion(success);
    }
}

@end
