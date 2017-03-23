//
//  UIView+FYBorder.h
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, FYExcludePoint) {
    FYExcludeStartPoint = 1 << 0,
    FYExcludeEndPoint = 1 << 1,
    FYExcludeAllPoint = ~0UL
};

@interface UIView (FYBorder)
// todo 性能优化
- (void)fy_cornerStyleWithRadius:(CGFloat)radius;

- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width cornerRadius:(CGFloat)radius;

- (void)fy_borderStyleWithColor:(UIColor *)color width:(CGFloat)width;

- (void)fy_setCornerWithRadius:(CGFloat)radius;
/////////////////////////////////////////////

- (void)fy_addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)fy_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)fy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)fy_addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)fy_removeTopBorder;

- (void)fy_removeLeftBorder;

- (void)fy_removeBottomBorder;

- (void)fy_removeRightBorder;


- (void)fy_addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge;

- (void)fy_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge;

- (void)fy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge;

- (void)fy_addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge;


@end
