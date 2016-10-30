//
//  UINavigationController+Addition.m
//  Dobby
//
//  Created by efeng on 14/10/30.
//  Copyright (c) 2014年 weiboyi. All rights reserved.
//
#import "UINavigationController+FY.h"
#import "FYViewController.h"

@implementation UINavigationController (FY)

- (void)fy_pushTo:(Class)classVc {
    [self fy_pushTo:classVc animated:YES];
}

- (void)fy_pushTo:(Class)classVc animated:(BOOL)animated {
    NSAssert([classVc isSubclassOfClass:UIViewController.class], @"必须是UIViewController的子类");

    UIViewController *vc = (UIViewController *) [[classVc alloc] init];
    [self pushViewController:vc animated:animated];
}

- (void)fy_pushTo:(Class)classVc withParameter:(NSDictionary *)parameter; {
    NSAssert([classVc isSubclassOfClass:FYViewController.class], @"必须是UIViewController的子类");

    FYViewController *vc = (FYViewController *) [[classVc alloc] init];
    vc.fyParameter = parameter;
    [self pushViewController:vc animated:YES];
}

- (NSArray *)fy_popToBackLevel:(NSUInteger)level animated:(BOOL)animated {
    NSMutableArray *vcs = [NSMutableArray arrayWithArray:self.viewControllers];
    NSUInteger count = vcs.count;
    if (level <= count - 1) {
        UIViewController *targetVC = vcs[count - 1 - level];
        return [self popToViewController:targetVC animated:animated];
    } else {
        return [self popToRootViewControllerAnimated:animated];
    }
}

// Ps. level 从前面数 从0开始代表第一个
- (NSArray *)fy_popToFrontLevel:(NSInteger)level animated:(BOOL)animated {

    NSMutableArray *vcs = [NSMutableArray arrayWithArray:self.viewControllers];
    NSUInteger count = vcs.count;
    if (level < count && level >= 0) {
        UIViewController *targetVC = vcs[level];
        return [self popToViewController:targetVC animated:animated];
    } else {
        return [self popToRootViewControllerAnimated:animated];
    }
}


@end
