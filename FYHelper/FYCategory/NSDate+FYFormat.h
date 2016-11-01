#import <Foundation/Foundation.h>

@interface NSDate (FYFormat)

/**
 * 例如：@"yyyy年MM月dd日hh时mm分ss秒" @"yyyy-MM-dd HH:mm"
 * @param format 格式
 * @return 格式化后的日期
 */
- (NSString *)fy_dateStringWithFormat:(NSString *)format;


@end
