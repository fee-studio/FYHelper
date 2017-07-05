//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYMacroDefinition.h"


@implementation FYMacroDefinition {

}

+ (UIApplication *)fy_application; {
    return mApplication;
}

+ (id)fy_appDelegate; {
    return mAppDelegate;
}

+ (UIWindow *)fy_window; {
    return mKeyWindow;
}

+ (NSUserDefaults *)fy_userDefaults; {
    return mUserDefaults;
}

+ (NSNotificationCenter *)fy_notificationCenter; {
    return mNotificationCenter;
}

+ (CGRect)fy_screenBounds; {
    return mScreenBounds;
}

+ (CGFloat)fy_screenWidth; {
    return mScreenWidth;
}

+ (CGFloat)fy_screenHeight; {
    return mScreenHeight;
}


@end