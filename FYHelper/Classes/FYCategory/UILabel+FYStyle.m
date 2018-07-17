//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UILabel+FYStyle.h"
#import <objc/runtime.h>


static inline void fy_swizzledSelector(Class aClass, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
    if (class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


static char kFYStyleEdgeInsetsKey;

@implementation UILabel (FYStyle)

@dynamic fy_edgeInsets;

#pragma mark -

+ (void)load {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        fy_swizzledSelector(self.class, @selector(textRectForBounds:limitedToNumberOfLines:), @selector(fy_textRectForBounds:limitedToNumberOfLines:));
        fy_swizzledSelector(self.class, @selector(drawTextInRect:), @selector(fy_drawTextInRect:));
    });
}

#pragma mark -

#pragma clang diagnostic push
#pragma ide diagnostic ignored "InfiniteRecursion"

- (CGRect)fy_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [self fy_textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.fy_edgeInsets) limitedToNumberOfLines:numberOfLines];
    return textRect;
}

- (void)fy_drawTextInRect:(CGRect)rect {
    [self fy_drawTextInRect:UIEdgeInsetsInsetRect(rect, self.fy_edgeInsets)];
}

#pragma clang diagnostic pop


#pragma mark - edge insets

- (UIEdgeInsets)fy_edgeInsets {
    NSValue *valueEdgeInsets = objc_getAssociatedObject(self, &kFYStyleEdgeInsetsKey);
    if (valueEdgeInsets) {
        return valueEdgeInsets.UIEdgeInsetsValue;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (void)setFy_edgeInsets:(UIEdgeInsets)edgeInsets {
    objc_setAssociatedObject(self, &kFYStyleEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
