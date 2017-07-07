//
//  UINavigationController+Addition.h
//  Dobby
//
//  Created by efeng on 14/10/30.
//  Copyright (c) 2014年 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (FYPushPop)

- (void)fy_pushTo:(Class)classVc;

- (void)fy_pushTo:(Class)classVc animated:(BOOL)animated;

- (void)fy_pushTo:(Class)classVc withParameter:(NSDictionary *)parameter;

- (NSArray *)fy_popToBackLevel:(NSUInteger)level animated:(BOOL)animated;

- (NSArray *)fy_popToFrontLevel:(NSInteger)level animated:(BOOL)animated;

@end
