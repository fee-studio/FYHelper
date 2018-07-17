//
//  FYBorderButton.m
//  Fred
//
//  Created by efeng on 2016/10/25.
//  Copyright © 2016年 weiboyi. All rights reserved.
//

#import "FYBorderButton.h"

@implementation FYBorderButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];

    self.layer.borderColor = [[UIColor grayColor] CGColor];
    self.layer.cornerRadius = 12.f;
    self.layer.borderWidth = 1.f;
    self.layer.masksToBounds = YES;

}


@end
