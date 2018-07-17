//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYViewController : UIViewController

#pragma mark- 键盘相关

- (void)hideKeyboard;

- (void)keyboardWillShow:(NSNotification *)n;

- (void)keyboardWillHide:(NSNotification *)n;

@end
