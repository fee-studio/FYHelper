#import "NSDate+FYFormat.h"

@implementation NSDate (FYFormat)


- (NSString *)fy_formatDateStringWithDefaultFormat; {
    return [self fy_formatDateStringWithFormat:@"yyyy-MM-dd HH:mm"];
}

- (NSString *)fy_formatDateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}


+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second {
    return [self fy_formatDateStringWithSecond:second format:@"yyyy-MM-dd HH:mm"];
}

+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:second]];
    return date;
}


+ (NSDate *)fy_dateFromString:(NSString *)dateString {
    return [self fy_dateFromString:dateString format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSDate *)fy_dateFromString:(NSString *)dateString format:(NSString *)format {
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    //NSString转NSDate
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}


@end
