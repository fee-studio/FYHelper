#import <Foundation/Foundation.h>

@interface NSDate (FYFormat)

/**
 * default format: yyyy-MM-dd HH:mm
 */
- (NSString *)fy_formatDateStringWithDefaultFormat;

/**
 * 例如：@"yyyy年MM月dd日hh时mm分ss秒" @"yyyy-MM-dd HH:mm"
 * @param format 格式
 * @return 格式化后的日期
 */
- (NSString *)fy_formatDateStringWithFormat:(NSString *)format;

/**
 * 把second按format格式化后返回
 * @param second
 * @param format
 * @return
 */
+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second format:(NSString *)format;

/**
 * 把second按@"yyyy-MM-dd HH:mm"格式化后返回
 * @param second
 * @return
 */
+ (NSString *)fy_formatDateStringWithSecond:(NSTimeInterval)second;


@end
