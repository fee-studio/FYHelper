//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYOtherUtil.h"


@implementation FYOtherUtil {

}

/*
 复制文本到剪贴板
 */
+ (void)fy_copyStringToPasteboard:(NSString *)copiedString {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:copiedString];
}

@end