//
//  UIButtonf.h
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (FYCountDown)

- (void)fy_countDownTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle;

- (void)fy_countDownTime:(NSInteger)timeout waitTitle:(NSString *)waitTitle;

@end
