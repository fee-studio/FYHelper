//
//  YITextField.m
//  XiaoJia
//
//  Created by efeng on 16/9/3.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import "FYPaddingTextField.h"

@implementation FYPaddingTextField


/**
 * Placeholder的位置
 */
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}

/**
 * Text的位置
 */
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}


@end
