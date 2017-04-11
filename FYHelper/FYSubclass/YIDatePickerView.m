//
// Created by efeng on 2016/12/7.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "YIDatePickerView.h"
#import "YIConfigUtil+UI.h"
#import "MASConstraintMaker.h"
#import "Masonry.h"


@implementation YIDatePickerView {
    UIDatePicker *_datePicker;
    UIToolbar *_toolbar;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = kAppColorWhite;

        self.datePickerMode = UIDatePickerModeDate;
        self.minimumDate = [NSDate date];
    }

    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    [self loadView];
}


- (void)loadView {
    // 创建date picker
    _datePicker = [[UIDatePicker alloc] init];
    // 本地化
    _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    // changed
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged]; // 添加监听器
    // 设置text field的键盘
    [self addSubview:_datePicker];

    // 日期控件格式
    _datePicker.datePickerMode = self.datePickerMode;
    // 最大与最小值
    _datePicker.minimumDate = self.minimumDate;
    _datePicker.maximumDate = self.maximumDate;

    // add toolbar
    _toolbar = [[UIToolbar alloc] init];
    [_toolbar setBackgroundColor:kAppColorLight];
    [self addSubview:_toolbar];

    NSMutableArray *items = [NSMutableArray array];

    UIBarButtonItem *cancelBi = [[UIBarButtonItem alloc]
            initWithTitle:@"取消"
                    style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(cancelPick)];
    [cancelBi setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:15.0],
                    NSForegroundColorAttributeName: kAppColorMain,
                    NSBackgroundColorAttributeName: [UIColor blackColor]}
                            forState:UIControlStateNormal];

    UIBarButtonItem *spacer3 = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                 target:nil
                                 action:nil];

    UIBarButtonItem *okBi = [[UIBarButtonItem alloc]
            initWithTitle:@"完成"
                    style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(finishedPick)];
    [okBi setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:15.0],
                    NSForegroundColorAttributeName: kAppColorMain,
                    NSBackgroundColorAttributeName: [UIColor blackColor]}
                        forState:UIControlStateNormal];

    [items addObject:cancelBi];
    [items addObject:spacer3];
    [items addObject:okBi];

    [_toolbar setItems:items animated:YES];

    [_toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_toolbar.superview);
        make.left.equalTo(_toolbar.superview);
        make.right.equalTo(_toolbar.superview);
        make.height.equalTo(@44);
    }];

    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_toolbar.mas_bottom);
        make.left.equalTo(_datePicker.superview);
        make.width.equalTo(_datePicker.superview);
        make.bottom.equalTo(_datePicker.superview);
        make.height.equalTo(@216);
    }];

}

- (void)datePickerValueChanged:(UIDatePicker *)sender {
//    NSDate *dateSelected = [sender date]; // 获取被选中的时间

}

- (void)cancelPick {
    [self removeFromSuperview];

    self.actionBlock(nil);
}

- (void)finishedPick {
    [self removeFromSuperview];

    self.actionBlock([_datePicker date]);
}

- (void)addActionWithBlock:(YIDatePickerViewActionBlock)block {
    self.actionBlock = block;

}

@end
