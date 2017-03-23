//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIButton+FYBlock.h"
#import <objc/runtime.h>

static const char fy_UIButtonTapBlockKey;

@implementation UIButton (FYBlock)

- (void)fy_tapBlock:(FYButtonTapBlock)block; {
    objc_setAssociatedObject(self, &fy_UIButtonTapBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(p_fy_action) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_fy_action {
    FYButtonTapBlock block = objc_getAssociatedObject(self, &fy_UIButtonTapBlockKey);
    if (block) {
        block();
    }
}
// todo 下午继续
@end