//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FYCompare)

/**
 * @return 返回当前时间的 天级别的时间，也就是舍掉时分秒时间。
 */
- (NSDate *)fy_toDateOnDay;

/**
 * 返回 当前时间 + minute分钟
 * @param minute 想要增加的分钟数
 * @param cross  增加后的分钟数 是否要跨过今天; false为不跨过，最大值为[NSDate fy_today_23_59]
 * @return 增加分钟数后的时间
 */
+ (NSDate *)fy_todayNowAddMinute:(int)minute crossToday:(BOOL)cross;

+ (NSDate *)fy_today_00_00;

+ (NSDate *)fy_today_23_59;

///是否是同一天
- (BOOL)fy_isSameOnDay:(NSDate *)anotherDate;

///是否是今天
- (BOOL)fy_isToday;

///是否是明天
- (BOOL)fy_isTomorrow;

///是否是昨天
- (BOOL)fy_isYesterday;

+ (NSDate *)fy_tomorrowNow;

+ (NSDate *)fy_todayNow;

+ (NSDate *)fy_yesterdayNow;

+ (NSInteger)fy_differDaysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

///  是否为将来的时间
- (BOOL)fy_isLaterThanNow;

- (BOOL)fy_isEarlierThanDate:(NSDate *)aDate;

- (BOOL)fy_isLaterThanDate:(NSDate *)aDate;

///  是否为过去的时间
- (BOOL)fy_isEarlierThanNow;

///  是否为今天之前的日子，以天为单位
- (BOOL)fy_isEarlierThanTodayOnDay;

///  是否为今天之后的日子，以天为单位
- (BOOL)fy_isLaterThanTodayOnDay;

@end