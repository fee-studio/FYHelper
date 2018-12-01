//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface UIScreen (FYFrame)

+ (CGSize)fy_size;

+ (CGSize)fy_DPISize;

+ (CGFloat)fy_width;

+ (CGFloat)fy_height;

+ (BOOL)is35InchesScreen;

+ (BOOL)is4InchesScreen;

+ (BOOL)is47InchesScreen;

+ (BOOL)is55InchesScreen;

+ (BOOL)is58InchesScreen;

+ (BOOL)isIphoneXAboveScreen;

+ (BOOL)isRetina;

@end
