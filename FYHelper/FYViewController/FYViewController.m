//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYViewController.h"
#import "FYMacroDefinition.h"

@implementation FYViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
//	self.view.frame = mScreenBounds;

    // 分派参数
    [self dispatchParameter];

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        // skill 这句很关键.关于在UINavigationController下面布局UIViewController + UITableView
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    // register for keyboard notifications
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillShow:)
                                name:UIKeyboardWillShowNotification
                              object:self.view.window];
    // register for keyboard notifications
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillHide:)
                                name:UIKeyboardWillHideNotification
                              object:self.view.window];

}

#pragma mark - 基类里面啥不需要加载

- (void)dispatchParameter {
    //	NSAssert(self.parameter, @"self.parameter必须不为空");
}

#pragma mark -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
}

#pragma mark - keyboard selector

/**
 *  隐藏键盘
 */
- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)n {
    _keyboardIsShown = YES;
}

- (void)keyboardWillHide:(NSNotification *)n {
    _keyboardIsShown = NO;
}

@end
