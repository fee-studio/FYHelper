//
//  UIView+FYBorder.m
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import "UIView+FYBorder.h"

@implementation UIView (FYBorder)


- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)radius {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
}

- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    self.layer.cornerRadius = self.bounds.size.height / 2.0f;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
}


@end
