//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYViewController.h"
#import "FYMacroDefinition.h"

#if DEBUG
#import "FLEXManager.h"
#endif


@implementation FYViewController {

}

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}

#pragma mark - view lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // 分派参数
    [self fy_dispatchParameter];

    // FLEX
#if DEBUG
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithTitle:@"FLEX"
                    style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(actionFlex:)];
#endif
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillShow:)
                                name:UIKeyboardWillShowNotification
                              object:nil];
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardDidShow:)
                                name:UIKeyboardDidShowNotification
                              object:nil];
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillHide:)
                                name:UIKeyboardWillHideNotification
                              object:nil];
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardDidHide:)
                                name:UIKeyboardDidHideNotification
                              object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [mNotificationCenter removeObserver:self
                                   name:UIKeyboardWillShowNotification
                                 object:nil];
    [mNotificationCenter removeObserver:self
                                   name:UIKeyboardDidShowNotification
                                 object:nil];
    [mNotificationCenter removeObserver:self
                                   name:UIKeyboardWillHideNotification
                                 object:nil];
    [mNotificationCenter removeObserver:self
                                   name:UIKeyboardDidHideNotification
                                 object:nil];
}

#pragma mark - 基类里面啥不需要加载

- (void)fy_dispatchParameter {
    //	NSAssert(self.parameter, @"self.parameter必须不为空");
}

#pragma mark - FLEX

- (void)actionFlex:(id)sender {
#if DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif
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

- (void)keyboardDidShow:(NSNotification *)n {
    _keyboardIsShown = YES;
}

- (void)keyboardWillHide:(NSNotification *)n {
    _keyboardIsShown = NO;
}

- (void)keyboardDidHide:(NSNotification *)n {
    _keyboardIsShown = NO;
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    FYLog(@"☣️内存警告!️");
}

- (void)dealloc {
    NSString *tips = [NSString stringWithFormat:@"✅ FYVC: %@ - dealloc", NSStringFromClass(self.class)];
    NSLog(@"%@", tips);
}

@end
