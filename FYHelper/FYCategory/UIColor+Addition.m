#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)fy_randomColor {

    CGFloat red = arc4random() / (CGFloat) INT_MAX;
    CGFloat green = arc4random() / (CGFloat) INT_MAX;
    CGFloat blue = arc4random() / (CGFloat) INT_MAX;
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:1.0];
}

+ (UIColor *)fy_colorWithHexInteger:(NSInteger)hexInteger; {
    return [UIColor colorWithRed:((float) ((hexInteger & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((hexInteger & 0xFF00) >> 8)) / 0xFF
                            blue:((float) (hexInteger & 0xFF)) / 0xFF
                           alpha:1.0];
}

+ (UIColor *)fy_colorWithHexString:(NSString *)hexString {
    return [[self class] fy_colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)fy_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    // Check for hash and add the missing hash
    if ('#' != [hexString characterAtIndex:0]) {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }

    // check for string length
    assert(7 == hexString.length || 4 == hexString.length);

    // check for 3 character HexStrings
    hexString = [[self class] hexStringTransformFromThreeCharacters:hexString];

    NSString *redHex = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt = [[self class] hexValueToUnsigned:redHex];

    NSString *greenHex = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt = [[self class] hexValueToUnsigned:greenHex];

    NSString *blueHex = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt = [[self class] hexValueToUnsigned:blueHex];

    UIColor *color = [UIColor colorWith8BitRed:redInt green:greenInt blue:blueInt alpha:alpha];

    return color;
}

+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [[self class] colorWith8BitRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    UIColor *color = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    color = [UIColor colorWithRed:(float) red / 255 green:(float) green / 255 blue:(float) blue / 255 alpha:alpha];
#else
    color = [UIColor colorWithCalibratedRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#endif

    return color;
}

+ (NSString *)hexStringTransformFromThreeCharacters:(NSString *)hexString {
    if (hexString.length == 4) {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                                               [hexString substringWithRange:NSMakeRange(1, 1)], [hexString substringWithRange:NSMakeRange(1, 1)],
                                               [hexString substringWithRange:NSMakeRange(2, 1)], [hexString substringWithRange:NSMakeRange(2, 1)],
                                               [hexString substringWithRange:NSMakeRange(3, 1)], [hexString substringWithRange:NSMakeRange(3, 1)]];
    }

    return hexString;
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue {
    unsigned value = 0;

    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];

    return value;
}

@end
