//
//  UIImage+FYCorner.m
//  Fred
//
//  Created by efeng on 2017/2/20.
//  Copyright © 2017年 weiboyi. All rights reserved.
//

#import "UIImage+FYCorner.h"

@implementation UIImage (FYCorner)


- (UIImage *)fy_imageWithCornerRadius:(CGFloat)radius {
    CGRect rect = (CGRect) {0.f, 0.f, self.size};

    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
            [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());

    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}


@end
