//
// Created by efeng on 2017/7/4.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

#import "FYScrollViewController.h"
#import "FYMacroDefinition.h"
#import <Masonry/Masonry.h>

@interface FYScrollViewController () <UIScrollViewDelegate>


@end

@implementation FYScrollViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:mScreenBounds];
    self.view.backgroundColor = [UIColor whiteColor];

    self.fy_scrollView = [[UIScrollView alloc] initWithFrame:mScreenBounds];
    _fy_scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _fy_scrollView.delegate = self;
    [self.view addSubview:_fy_scrollView];
    [self.fy_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
    }];

    /**
     VIP 让填写表单是弹出的键盘能点击空白处收回键盘 (category的方法不好，原因看连接)
     http://www.jianshu.com/p/cde9e223504c
     http://blog.csdn.net/wangyanchang21/article/details/51144544
     */
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tapGr.cancelsTouchesInView = NO;
    [_fy_scrollView addGestureRecognizer:tapGr];
}

- (void)hideKeyboard {
    [super hideKeyboard];
}

//- (BOOL)canBecomeFirstResponder {
//    return YES;
//}

#pragma mark - view lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//
//    [self becomeFirstResponder];
//}

#pragma mark - 快捷方法

- (void)removeSubviews {
    for (UIView *view in self.fy_scrollView.subviews) {
        [view removeFromSuperview];
    }
}

#pragma mark - 键盘Notification

- (void)keyboardWillShow:(NSNotification *)note {
    [super keyboardWillShow:note];

    // 取出键盘最终的frame 修改约束 // VIP 用mas_updateConstraints没效果
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self.fy_scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.lessThanOrEqualTo(self.fy_scrollView.superview);
        make.width.equalTo(self.fy_scrollView.superview);
        make.bottom.equalTo(self.fy_scrollView.superview).offset(-rect.size.height);
    }];
}

- (void)keyboardWillHide:(NSNotification *)note {
    [super keyboardWillHide:note];

    // 修改约束
    [self.fy_scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.lessThanOrEqualTo(self.fy_scrollView.superview);
        make.width.equalTo(self.fy_scrollView.superview);
        make.bottom.equalTo(self.fy_scrollView.superview);
    }];
}

@end