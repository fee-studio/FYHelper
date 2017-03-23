//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (FYFrame)

@property(nonatomic, assign) CGPoint fy_origin;
@property(nonatomic, assign) CGSize fy_size;

@property(nonatomic) CGFloat fy_centerX;
@property(nonatomic) CGFloat fy_centerY;

@property(nonatomic) CGFloat fy_top;
@property(nonatomic) CGFloat fy_bottom;
@property(nonatomic) CGFloat fy_right;
@property(nonatomic) CGFloat fy_left;

@property(nonatomic) CGFloat fy_width;
@property(nonatomic) CGFloat fy_height;

@end