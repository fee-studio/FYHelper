//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYAppInfo.h"
#import "NSString+Addition.h"

@implementation FYAppInfo {

}

+ (NSString *)appName {
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return appName;
}

+ (NSString *)appBundleId; {
    NSString *appBundleId = [[NSBundle mainBundle] infoDictionary][(__bridge NSString *) kCFBundleIdentifierKey];
    return appBundleId;
}

+ (UIImage *)appIconImage; {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage *image = [UIImage imageNamed:icon];
    return image;
}

+ (void)suspendAppAndExit {
    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    //exit app when app is in background
    exit(0);
}

+ (BOOL)isRegisteredRemoteNotification {
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        return [application isRegisteredForRemoteNotifications];
    } else {
        return application.enabledRemoteNotificationTypes != UIRemoteNotificationTypeNone;
    }
}

+ (NSString *)appVersion {
    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)unixTimestamp {
    NSDate *date = [NSDate date];
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%li", (long) timestamp];
}

+ (NSString *)channelName {
    NSString *chName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Channel"];
    if (chName.isReality) {
        return chName;
    } else {
        return @"AppStore";
    }
}

@end
