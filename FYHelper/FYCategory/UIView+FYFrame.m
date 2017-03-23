//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIView+FYFrame.h"


@implementation UIView (FYFrame)
- (CGFloat)fy_top {
    return self.frame.origin.y;
}

- (void)setFy_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)fy_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setFy_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)fy_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)fy_left {
    return self.frame.origin.x;
}

- (void)setFy_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)fy_width {
    return self.frame.size.width;
}

- (void)setFy_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)fy_height {
    return self.frame.size.height;
}

- (void)setFy_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)fy_origin {
    return self.frame.origin;
}

- (void)setFy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)fy_size {
    return self.frame.size;
}

- (void)setFy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - Shortcuts for positions

- (CGFloat)fy_centerX {
    return self.center.x;
}

- (void)setFy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)fy_centerY {
    return self.center.y;
}

- (void)setFy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
@end