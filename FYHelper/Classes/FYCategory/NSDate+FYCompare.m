//
// Created by efeng on 2017/3/18.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "NSDate+FYCompare.h"

@implementation NSDate (FYCompare)

#pragma mark - 以 天 为比较计算的单位

// 把一个具体的日期的时分秒去掉，只保留到【天】级别的时间
- (NSDate *)fy_toDateOnDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                   fromDate:self];
    NSDate *aDate = [calendar dateFromComponents:dateComponents];
    return aDate;
}

+ (NSDate *)fy_todayNowAddMinute:(int)minute crossToday:(BOOL)cross {
    NSDate *now = [NSDate date];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.minute = minute;
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:now options:0];

    if (!cross && [date fy_isLaterThanDate:[NSDate fy_today_23_59]]) {
        return [NSDate fy_today_23_59];
    }
    return date;
}

+ (NSDate *)fy_today_00_00 {
    NSDate *now = [NSDate date];
    NSDate *_00_00 = [[NSCalendar currentCalendar] dateBySettingHour:0 minute:0 second:0 ofDate:now options:0];
    return _00_00;
}

+ (NSDate *)fy_today_23_59 {
    NSDate *now = [NSDate date];
    NSDate *_23_59 = [[NSCalendar currentCalendar] dateBySettingHour:23 minute:59 second:59 ofDate:now options:0];
    return _23_59;
}

- (BOOL)fy_isSameOnDay:(NSDate *)anotherDate {
    NSDate *aDate = [self fy_toDateOnDay];
    NSDate *bDate = [anotherDate fy_toDateOnDay];
    return [aDate isEqualToDate:bDate];
}

- (BOOL)fy_isTomorrow {
    return [self fy_isSameOnDay:[NSDate fy_tomorrowNow]];
}

- (BOOL)fy_isToday {
    return [self fy_isSameOnDay:[NSDate fy_todayNow]];
}

- (BOOL)fy_isYesterday {
    return [self fy_isSameOnDay:[NSDate fy_yesterdayNow]];
}

#pragma mark - 以 秒 为比较计算的单位 - 具体的[NSDate date]

+ (NSDate *)fy_tomorrowNow {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = 1;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:[NSDate date] options:0];
}

+ (NSDate *)fy_todayNow {
    return [NSDate date];
}

+ (NSDate *)fy_yesterdayNow {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = -1;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:[NSDate date] options:0];
}

#pragma mark - 比较 - 秒级

- (BOOL)fy_isEarlierThanDate:(NSDate *)aDate {
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)fy_isLaterThanDate:(NSDate *)aDate {
    return ([self compare:aDate] == NSOrderedDescending);
}

- (BOOL)fy_isEarlierThanNow {
    return ([self fy_isEarlierThanDate:[NSDate date]]);
}

- (BOOL)fy_isLaterThanNow {
    return ([self fy_isLaterThanDate:[NSDate date]]);
}

#pragma mark - 比较 - 天级

- (BOOL)fy_isEarlierThanTodayOnDay; {
    NSDate *aDate = [self fy_toDateOnDay];
    NSDate *nowDate = [[NSDate date] fy_toDateOnDay];

    return [aDate fy_isEarlierThanDate:nowDate];
}

- (BOOL)fy_isLaterThanTodayOnDay; {
    NSDate *aDate = [self fy_toDateOnDay];
    NSDate *nowDate = [[NSDate date] fy_toDateOnDay];

    return [aDate fy_isLaterThanDate:nowDate];
}

#pragma mark - 比较相差的天数

+ (NSInteger)fy_differDaysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    NSDate *dateFrom = [fromDate fy_toDateOnDay];
    NSDate *dateTo = [toDate fy_toDateOnDay];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay fromDate:dateFrom toDate:dateTo options:0];
    NSInteger differDays = dateComponents.day;
    return differDays;
}

@end
