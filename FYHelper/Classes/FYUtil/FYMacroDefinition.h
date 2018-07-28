//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 弱引用
 */
#define FYWeakSelf            __weak __typeof(self) weakSelf = self;

/**
 常用的简写
 */
#define mApplication        [UIApplication sharedApplication]
#define mAppDelegate        [[UIApplication sharedApplication] delegate]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]

#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

/**
 页面设计相关
 */
#define mStatusBarHeight    ([UIScreen is58InchesScreen] ? 44 : 20)
#define mNavBarHeight       44
#define mTopBarHeight       (mStatusBarHeight + mNavBarHeight)
#define mTabBarHeight       49
#define mToolbarHeight      44

#define mScreenBounds       ([UIScreen mainScreen].bounds)
#define mScreenWidth        ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight       ([UIScreen mainScreen].bounds.size.height)

/**
 NSLog not printing to console
 
 This is a bug of Xcode8 + iOS10, we can solve it in this way:
 https://stackoverflow.com/questions/7856508/nslog-not-printing-to-console
 */
#ifdef DEBUG
#define FYSourceFileName [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define FYLog(...) printf("\n%s 第%d行: %s\n\n", [FYSourceFileName UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define FYLog(...)
#define NSLog(...) (void)0
#endif

/**
 以下的改造,增加的方法主要为了给swift来使用.
 https://medium.com/@YogevSitton/from-objective-c-to-swift-use-complex-define-macros-in-swift-28cdff464fc7#.9ynd5vdw0
 */
@interface FYMacroDefinition : NSObject

+ (UIApplication *)fy_application;

+ (id)fy_appDelegate;

+ (UIWindow *)fy_window;

+ (NSUserDefaults *)fy_userDefaults;

+ (NSNotificationCenter *)fy_notificationCenter;

+ (CGRect)fy_screenBounds;

+ (CGFloat)fy_screenWidth;

+ (CGFloat)fy_screenHeight;

@end
