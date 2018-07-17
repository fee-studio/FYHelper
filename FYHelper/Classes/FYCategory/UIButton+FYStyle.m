//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIButton+FYStyle.h"
#import "UIImage+FYHelper.h"

@implementation UIButton (FYStyle)
- (void)fy_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state; {
    [self setBackgroundImage:[UIImage fy_imageWithColor:backgroundColor] forState:state];
}
@end