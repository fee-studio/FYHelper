//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYViewController : UIViewController

#pragma mark- 传参机制

// 基参数
@property(nonatomic, strong) NSDictionary *fy_parameter;

// 分派参数
- (void)fy_dispatchParameter;

#pragma mark- 键盘相关

@property(nonatomic, assign) BOOL keyboardIsShown;

- (void)hideKeyboard;
- (void)keyboardWillShow:(NSNotification *)n;
- (void)keyboardWillHide:(NSNotification *)n;

@end
