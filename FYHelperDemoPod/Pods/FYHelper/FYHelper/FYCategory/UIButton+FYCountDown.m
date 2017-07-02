//
//  UIButtonf.m
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import "UIButton+FYCountDown.h"
#import "FYHelper.h"

@implementation UIButton (FYCountDown)

- (void)fy_countDownTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle {
    __block NSInteger timeOut = timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long) timeOut];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                FYLog(@"____%@", strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@", strTime, waitTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}


- (void)fy_countDownTime:(NSInteger)timeout waitTitle:(NSString *)waitTitle {
    __block NSString *title = self.titleLabel.text;
    __block UIColor *color = self.titleLabel.textColor;
    __block NSInteger timeOut = timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:title forState:UIControlStateNormal];
                [self setTitleColor:color forState:UIControlStateNormal];
                [self fy_borderStyleWithColor:color width:1.f];
                self.userInteractionEnabled = YES;
            });
        } else {
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long) timeOut];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                FYLog(@"____%@", strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@", strTime, waitTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self fy_borderStyleWithColor:[UIColor grayColor] width:1.f];
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}


@end
