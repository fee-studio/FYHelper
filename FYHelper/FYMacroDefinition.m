//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYMacroDefinition.h"


@implementation FYMacroDefinition {

}

+ (UIApplication *)fy_Application; {
    return mApplication;
}

+ (id)fy_AppDelegate; {
    return mAppDelegate;
}

+ (UIWindow *)fy_Window; {
    return mKeyWindow;
}

+ (NSUserDefaults *)fy_UserDefaults; {
    return mUserDefaults;
}

+ (NSNotificationCenter *)fy_NotificationCenter; {
    return mNotificationCenter;
}

+ (CGRect)fy_ScreenBounds; {
    return mScreenBounds;
}

+ (CGFloat)fy_ScreenWidth; {
    return mScreenWidth;
}

+ (CGFloat)fy_ScreenHeight; {
    return mScreenHeight;
}


@end