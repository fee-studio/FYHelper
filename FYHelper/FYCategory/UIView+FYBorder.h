//
//  UIView+FYBorder.h
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYBorder)

- (void)fy_cornerStyleWithRadius:(CGFloat)radius;

- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)radius;

- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width;

@end
