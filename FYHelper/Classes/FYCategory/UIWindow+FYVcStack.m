//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIWindow+FYVcStack.h"


@implementation UIWindow (FYVcStack)
- (UIViewController *)fy_topMostController {
    UIViewController *topController = [self rootViewController];

    //  Getting topMost ViewController
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
    }

    //  Returning topMost ViewController
    return topController;
}

- (UIViewController *)fy_currentViewController; {
    UIViewController *currentViewController = [self fy_topMostController];

    if ([currentViewController isKindOfClass:[UITabBarController class]]) {
        currentViewController = [(UITabBarController *) currentViewController selectedViewController];
    }

    while ([currentViewController isKindOfClass:[UINavigationController class]]
            && [(UINavigationController *) currentViewController topViewController]) {
        currentViewController = [(UINavigationController *) currentViewController topViewController];
    }

    return currentViewController;
}
@end