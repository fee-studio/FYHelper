//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIScreen+FYFrame.h"


@implementation UIScreen (FYFrame)
+ (CGSize)fy_size {
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGSize)fy_DPISize {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}

+ (CGFloat)fy_width {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)fy_height {
    return [[UIScreen mainScreen] bounds].size.height;
}

// iPhone 4 4s
+ (BOOL)is35InchesScreen {
    static int is35Inch = 0;
    if (is35Inch == 0)
        is35Inch = ([[UIScreen mainScreen] bounds].size.height == 480) ? 1 : -1;
    return is35Inch > 0;
}

// iPhone5 5s 5c se
+ (BOOL)is4InchesScreen {
    static int is4Inch = 0;
    if (is4Inch == 0)
        is4Inch = ([[UIScreen mainScreen] bounds].size.height == 568) ? 1 : -1;
    return is4Inch > 0;
}

// iPhone6 6s 7 8
+ (BOOL)is47InchesScreen {
    static int is47Inch = 0;
    if (is47Inch == 0)
        is47Inch = ([[UIScreen mainScreen] bounds].size.height == 667) ? 1 : -1;
    return is47Inch > 0;
}

// iPhone6+ 6s+ 7+ 8+
+ (BOOL)is55InchesScreen {
    static int is55Inch = 0;
    if (is55Inch == 0)
        is55Inch = ([[UIScreen mainScreen] bounds].size.height == 736) ? 1 : -1;
    return is55Inch > 0;
}

// iPhoneX
+ (BOOL)is58InchesScreen {
    static int is58Inch = 0;
    if (is58Inch == 0)
        is58Inch = ([[UIScreen mainScreen] bounds].size.height == 812) ? 1 : -1;
    return is58Inch > 0;
}

+ (BOOL)isRetina {
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];
        if (scale > 1.0) {
            return YES;
        }
    }
    return NO;
}


@end