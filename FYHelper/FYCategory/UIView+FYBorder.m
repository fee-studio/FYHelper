//
//  UIView+FYBorder.m
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import "UIView+FYBorder.h"

typedef NS_ENUM(NSInteger, EdgeType) {
    TopBorder = 10000,
    LeftBorder = 20000,
    BottomBorder = 30000,
    RightBorder = 40000
};

@implementation UIView (FYBorder)


- (void)fy_cornerStyleWithRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
}

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
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
}

// todo 优化，iOS9以上用以上的方法反而更好。iOS9对以上的方法有优化。
- (void)fy_setCornerWithRadius:(CGFloat)radius {
    CGRect rect = self.bounds;

    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(radius, radius)];

    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;

    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

#pragma mark - custom border

- (void)fy_removeTopBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == TopBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)fy_removeLeftBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == LeftBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)fy_removeBottomBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == BottomBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)fy_removeRightBorder {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == RightBorder) {
            [subView removeFromSuperview];
        }
    }];
}

- (void)fy_addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self fy_addTopBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)fy_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self fy_addLeftBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)fy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self fy_addBottomBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)fy_addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth {
    [self fy_addRightBorderWithColor:color width:borderWidth excludePoint:0 edgeType:0];
}


- (void)fy_addTopBorderWithColor:(UIColor *)color
                           width:(CGFloat)borderWidth
                    excludePoint:(CGFloat)point
                        edgeType:(FYExcludePoint)edge {
    [self fy_removeTopBorder];

    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }

    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = TopBorder;

    [self addSubview:border];

    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & FYExcludeStartPoint) {
        startPoint += point;
    }

    if (edge & FYExcludeEndPoint) {
        endPoint += point;
    }

    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLenght = self.bounds.size.width - endPoint - startPoint;
        border.frame = CGRectMake(startPoint, 0.0, borderLenght, borderWidth);
        return;
    }

    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}


- (void)fy_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge {
    [self fy_removeLeftBorder];

    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }

    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = LeftBorder;
    [self addSubview:border];

    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & FYExcludeStartPoint) {
        startPoint += point;
    }

    if (edge & FYExcludeEndPoint) {
        endPoint += point;
    }

    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(0.0, startPoint, borderWidth, borderLength);
        return;
    }

    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];

}


- (void)fy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge {
    [self fy_removeBottomBorder];

    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = BottomBorder;
    [self addSubview:border];

    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & FYExcludeStartPoint) {
        startPoint += point;
    }

    if (edge & FYExcludeEndPoint) {
        endPoint += point;
    }


    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.width - startPoint - endPoint;
        border.frame = CGRectMake(startPoint, self.bounds.size.height - borderWidth, borderLength, borderWidth);
        return;
    }

    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}

- (void)fy_addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(FYExcludePoint)edge {
    [self fy_removeRightBorder];

    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = RightBorder;
    [self addSubview:border];

    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (edge & FYExcludeStartPoint) {
        startPoint += point;
    }

    if (edge & FYExcludeEndPoint) {
        endPoint += point;
    }

    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(self.bounds.size.width - borderWidth, startPoint, borderWidth, borderLength);
        return;
    }

    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}



@end
