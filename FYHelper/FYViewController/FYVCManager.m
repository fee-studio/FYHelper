//
//  FYVCManager.m
//  Emma
//
//  Created by efeng on 16/4/9.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import "FYVCManager.h"
#import "FYHelper.h"
#import "FYNavigationController.h"

@interface FYVCManager ()

@end

@implementation FYVCManager

+ (FYVCManager *)instance {
    static FYVCManager *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}

#pragma mark - app top vc

/*
 * 此app最顶级的vc,不是navigationcontroller,也不是MMDrawerController
 */
- (UIViewController *)appTopViewController {
    UIViewController *topController = [[mAppDelegate window] rootViewController];
    //  Getting topMost ViewController
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
    }
    //  Returning topMost ViewController
    return topController;
}

#pragma mark - push vc instance

- (void)pushViewController:(UIViewController *)viewController {
    UINavigationController *navigationController = [[self appTopViewController] navigationController];
    if (navigationController) {
        [navigationController pushViewController:viewController animated:YES];
    } else {
        NSAssert(_baseNavigationController, @"错误: 请先设置 baseNavigationController ");
        [_baseNavigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - push

- (void)pushTo:(Class)classVc; {
    [self pushTo:classVc withParameter:nil];
}

- (void)pushTo:(Class)classVc withParameter:(NSDictionary *)parameter; {
    // 初始化
    FYViewController *controller = (FYViewController *) [[classVc alloc] init];
    NSAssert(controller, @"错误: 目标页不存在!");
    // 传参
    controller.parameter = parameter;
    // 跳转
    FYNavigationController *nc = (FYNavigationController *) controller.navigationController;
    if (nc) {
        [nc pushViewController:controller animated:YES];
    } else {
        UIViewController *topVc = [self appTopViewController];
        if (topVc.navigationController) {
            [topVc.navigationController pushViewController:controller animated:YES];
        } else {
            [self pushViewController:controller];
        }
    }
}

#pragma mark - present

- (void)presentTo:(NSString *)viewController {
    [self presentTo:viewController withParameter:nil];
}

- (void)presentTo:(NSString *)viewController withParameter:(NSDictionary *)parameter; {
    [self presentTo:viewController withParameter:parameter withNavigation:YES];
}

- (void)presentTo:(NSString *)viewController withNavigation:(BOOL)navi {
    [self presentTo:viewController withParameter:nil withNavigation:navi];
}

- (void)presentTo:(NSString *)viewController withParameter:(NSDictionary *)parameter withNavigation:(BOOL)navi {
    FYViewController *controller = (FYViewController *) [[NSClassFromString(viewController) alloc] init];
    NSAssert(controller, @"错误: 目标页不存在!");
    controller.parameter = parameter;

    UIViewController *topVc = [self appTopViewController];
    if (navi) {
        FYNavigationController *bnc = [[FYNavigationController alloc] initWithRootViewController:controller];
        [topVc presentViewController:bnc
                            animated:YES
                          completion:NULL];
    } else {
        [topVc presentViewController:controller
                            animated:YES
                          completion:NULL];
    }
}

#pragma mark - dismiss {

- (void)dismissAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    UIViewController *topVc = [self appTopViewController];
    [topVc dismissViewControllerAnimated:animated completion:completion];
}

#pragma mark -


@end
