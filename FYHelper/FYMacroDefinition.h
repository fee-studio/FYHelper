//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mAppDelegate        [[UIApplication sharedApplication] delegate]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]
#define mApplication        [UIApplication sharedApplication]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]

// 页面设计相关
#define mNavBarHeight        44
#define mTabBarHeight        49
#define mStatusBarHeight    20
#define mToolbarHeight        44
#define mTopBarHeight        (mToolbarHeight + mStatusBarHeight + mNavBarHeight)

#define mScreenBounds        ([UIScreen mainScreen].bounds)
#define mScreenWidth        ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight       ([UIScreen mainScreen].bounds.size.height)

@interface FYMacroDefinition : NSObject

@end
