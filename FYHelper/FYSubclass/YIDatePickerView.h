//
// Created by efeng on 2016/12/7.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^YIDatePickerViewActionBlock)(NSDate *dateSelected);

@interface YIDatePickerView : UIView

@property(nonatomic, strong) NSDate *date;
@property(nonatomic, assign) UIDatePickerMode datePickerMode;
@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSDate *maximumDate;

@property(copy) YIDatePickerViewActionBlock actionBlock;

- (void)loadView;

- (void)addActionWithBlock:(YIDatePickerViewActionBlock)block;

@end