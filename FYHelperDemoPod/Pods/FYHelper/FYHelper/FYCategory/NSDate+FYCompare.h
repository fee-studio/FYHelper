//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FYCompare)

///是否是同一天
- (BOOL)fy_isSameDay:(NSDate *)anotherDate;

///是否是今天
- (BOOL)fy_isToday;

///是否是明天
- (BOOL)fy_isTomorrow;

///是否是昨天
- (BOOL)fy_isYesterday;


+ (NSDate *)fy_dateTomorrow;

+ (NSDate *)fy_dateToday;

+ (NSDate *)fy_dateYesterday;

- (BOOL)fy_isInFuture;

- (BOOL)fy_isInPast;

@end