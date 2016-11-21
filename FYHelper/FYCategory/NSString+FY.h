#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (FY)

/**
 * 是否为有效的URL
 * @return
 */
- (BOOL)fy_isValidURL;

/**
 * 是否为一个真实的字符串，!=nil & !=@""
 * @return
 */
- (BOOL)fy_isReality;

/**
 * 判断字符串是否为空，==nil || ==@""
 * @return
 */
- (BOOL)fy_isEmpty;

/**
 * 根据字体与字符串长度来计算长度与宽度
 * http://www.cocoachina.com/industry/20140604/8668.html
 * @param size 最大值
 * @param font
 * @return
 */
- (CGSize)fy_calculateSize:(CGSize)size font:(UIFont *)font;

/**
 *  create a json string from NSArray
 *  @param array 来源array
 *  @return 一个json string
 */
+ (NSString *)fy_jsonStringFromArray:(NSArray *)array;

/**
 * 把 装有String的Array转化成@"xxx,yyy,zzz"这种形式的样子.
 * @param array 装有String的Array  @[@"xxx", @"yyy", @"zzzz"]
 * @return @"xxx,yyy,zzz"样式的字符串
 */
+ (NSString *)fy_csvStringFromArray:(NSArray<NSString *> *)array;

/**
 * MD5 string
 * @return md5 string
 */
- (NSString *)fy_MD5String;

/**
 * 复制文本到剪贴板
 */
- (void)fy_copyStringToPasteboard;


@end
