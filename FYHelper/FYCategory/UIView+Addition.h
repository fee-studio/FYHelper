//
//  UIView+Addition.h
//  Line0New
//
//  Created by line0 on 13-5-17.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)


- (UIView *)fy_subViewWithTag:(int)tag;

+ (UIView *)loadNibView:(NSString *)viewName;

+ (UIView *)loadNibView:(NSString *)viewName index:(NSUInteger)index;

- (UIImage *)toImage;

/**
 * 给所有的子View都填充上随机的颜色
 * 方便看View的布局
 */
- (void)fy_randomColor4Subviews;


@end
