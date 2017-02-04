//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define mApplication        [UIApplication sharedApplication]
#define mAppDelegate        [[UIApplication sharedApplication] delegate]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]

#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

// 页面设计相关
#define mNavBarHeight       44
#define mTabBarHeight       49
#define mStatusBarHeight    20
#define mToolbarHeight      44
#define mTopBarHeight       (mStatusBarHeight + mNavBarHeight)

#define mScreenBounds       ([UIScreen mainScreen].bounds)
#define mScreenWidth        ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight       ([UIScreen mainScreen].bounds.size.height)


#ifdef DEBUG
#define FYString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define FYLog(...)  printf("%s 第%d行: %s\n\n", [FYString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define FYLog(...)
#endif

/**
 以下的改造,增加的方法主要为了给swift来使用.
 https://medium.com/@YogevSitton/from-objective-c-to-swift-use-complex-define-macros-in-swift-28cdff464fc7#.9ynd5vdw0
 */
@interface FYMacroDefinition : NSObject

+ (UIApplication *)fy_Application;

+ (id)fy_AppDelegate;

+ (UIWindow *)fy_Window;

+ (NSUserDefaults *)fy_UserDefaults;

+ (NSNotificationCenter *)fy_NotificationCenter;

+ (CGRect)fy_ScreenBounds;

+ (CGFloat)fy_ScreenWidth;

+ (CGFloat)fy_ScreenHeight;

@end
