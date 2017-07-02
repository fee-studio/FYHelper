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
@end