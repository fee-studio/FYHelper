//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYViewController.h"
#import "FYMacroDefinition.h"
#import "FLEX.h"

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

//    [mNotificationCenter addObserver:self
//                            selector:@selector(keyboardWillShow:)
//                                name:UIKeyboardWillShowNotification
//                              object:nil];
//    [mNotificationCenter addObserver:self
//                            selector:@selector(keyboardDidShow:)
//                                name:UIKeyboardDidShowNotification
//                              object:nil];
//    [mNotificationCenter addObserver:self
//                            selector:@selector(keyboardWillHide:)
//                                name:UIKeyboardWillHideNotification
//                              object:nil];
//    [mNotificationCenter addObserver:self
//                            selector:@selector(keyboardDidHide:)
//                                name:UIKeyboardDidHideNotification
//                              object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

//    [mNotificationCenter removeObserver:self
//                                   name:UIKeyboardWillShowNotification
//                                 object:nil];
//    [mNotificationCenter removeObserver:self
//                                   name:UIKeyboardDidShowNotification
//                                 object:nil];
//    [mNotificationCenter removeObserver:self
//                                   name:UIKeyboardWillHideNotification
//                                 object:nil];
//    [mNotificationCenter removeObserver:self
//                                   name:UIKeyboardDidHideNotification
//                                 object:nil];
}

#pragma mark - FLEX

- (void)actionFlex:(id)sender {
#ifdef DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif
}

#pragma mark - touch

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
}

- (void)keyboardDidShow:(NSNotification *)n {
}

- (void)keyboardWillHide:(NSNotification *)n {
}

- (void)keyboardDidHide:(NSNotification *)n {
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    FYLog(@"☣内存警告!");
}

- (void)dealloc {
    NSString *tips = [NSString stringWithFormat:@"✅ FYVC: %@ - dealloc", NSStringFromClass(self.class)];
    FYLog(@"%@", tips);
}

@end
