//
// Created by efeng on 2017/3/7.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^FYGestureBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (FYBlockGesture)


/**
 * 增加手势
 * @param block
 */
- (void)fy_tapBlock:(FYGestureBlock)block;

@end