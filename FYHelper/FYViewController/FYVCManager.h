//
//  FYVCManager.h
//  Emma
//
//  Created by efeng on 16/4/9.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FYNavigationController;

#define VC_MANAGER ([FYVCManager instance])

@interface FYVCManager : NSObject

@property(nonatomic, strong) FYNavigationController *baseNavigationController;

+ (FYVCManager *)instance;

#pragma mark - top vc

- (UIViewController *)appTopViewController;

#pragma mark - push vc

- (void)pushViewController:(UIViewController *)viewController;

#pragma mark - push

- (void)pushTo:(NSString *)viewController;

- (void)pushTo:(NSString *)viewController
 withParameter:(NSDictionary *)parameter;

#pragma mark - present

- (void)presentTo:(NSString *)viewController;

- (void)presentTo:(NSString *)viewController
    withParameter:(NSDictionary *)parameter;

- (void)presentTo:(NSString *)viewController
   withNavigation:(BOOL)navi;

- (void)presentTo:(NSString *)viewController
    withParameter:(NSDictionary *)parameter
   withNavigation:(BOOL)navi;

#pragma mark - dismiss

- (void)dismissAnimated:(BOOL)animated
             completion:(void (^ __nullable)(void))completion;

@end
