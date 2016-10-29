#import <UIKit/UIKit.h>

@interface UIColor (Addition)

/**
 * 随机颜色
 * @return 随机颜色
 */
+ (UIColor *)fy_randomColor;

/**
 * 根据十六进制颜色值返回UIColor
 * @param hexInteger:十六进制颜色值
 * @return
 */
+ (UIColor *)fy_colorWithHexInteger:(NSInteger)hexInteger;

/**
 * 根据十六进制颜色值返回UIColor
 * @param hexString:十六进制颜色值
 * @return
 */
+ (UIColor *)fy_colorWithHexString:(NSString *)hexString;

/**
 * 根据十六进制颜色值返回UIColor
 * @param hexString:十六进制颜色值
 * @param alpha:透明度
 * @return
 */
+ (UIColor *)fy_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
