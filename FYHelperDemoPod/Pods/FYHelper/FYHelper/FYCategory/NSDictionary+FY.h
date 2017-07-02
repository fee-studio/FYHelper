//
// Created by efeng on 2016/10/29.
// Copyright (c) 2016 buerguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FY)

/**
 * 字典转为JSON字符串
 * @return JSON字符串
 */
- (NSString *)fy_jsonString;

/**
 * 字典转为URL字符串
 * @return
 */
- (NSString *)fy_urlString;
@end
