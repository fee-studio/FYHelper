#import "NSDate+FYFormat.h"

@implementation NSDate (FYFormat)

- (NSString *)fy_formatDateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}

+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:second]];
    return date;
}

+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second {
    return [self fy_formatDateStringWithSecond:second format:@"yyyy-MM-dd HH:mm"];
}

@end
