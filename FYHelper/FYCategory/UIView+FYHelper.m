//
//  UIView+Addition.m
//  Line0New
//
//  Created by line0 on 13-5-17.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//
#import "UIView+FYHelper.h"
#import "FYHelper.h"

@implementation UIView (FYHelper)

- (UIView *)fy_subViewWithTag:(int)tag {
    for (UIView *v in self.subviews) {
        if (v.tag == tag) {
            return v;
        }
    }
    return nil;
}

+ (UIView *)loadNibView:(NSString *)viewName {
    return [[NSBundle mainBundle] loadNibNamed:viewName owner:self options:nil][0];
}

+ (UIView *)loadNibView:(NSString *)viewName index:(NSUInteger)index {

    NSArray *views = [[NSBundle mainBundle] loadNibNamed:viewName owner:self options:nil];

    if (views.count > index) {
        return views[index];
    }

    return nil;
}

- (UIImage *)toImage {
    UIImage *snapshotImage;
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    } else {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:YES];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return snapshotImage;
}

- (void)fy_randomColor4Subviews; {
    for (UIView *view in self.subviews) {
        view.backgroundColor = [UIColor fy_randomColor];
    }
}

@end
