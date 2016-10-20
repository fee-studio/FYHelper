//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYViewController : UIViewController

// 基参数
@property(nonatomic, strong) NSDictionary *parameter;

// 分派参数
- (void)dispatchParameter;

@property(nonatomic, assign) BOOL keyboardIsShown;


- (void)hideKeyboard:(id)sender;

- (void)keyboardWillShow:(NSNotification *)n;

- (void)keyboardWillHide:(NSNotification *)n;

@end