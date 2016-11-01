#import "NSDate+FYFormat.h"

@implementation NSDate (FYFormat)

- (NSString *)fy_dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}

@end
