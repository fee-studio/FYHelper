//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface UIWindow (FYVcStack)
/*!
 @method topMostController

 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController *)fy_topMostController;

/*!
 @method currentViewController

 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController *)fy_currentViewController;
@end