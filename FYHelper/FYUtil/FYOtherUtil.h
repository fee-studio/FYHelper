//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYOtherUtil : NSObject

/**
 * 复制文字到粘贴板
 * @param copiedString 被复制的文字
 */
+ (void)fy_copyStringToPasteboard:(NSString *)copiedString;


@end