//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^FYButtonTapBlock)(void);

@interface UIButton (FYBlock)
- (void)fy_tapBlock:(FYButtonTapBlock)block;
@end