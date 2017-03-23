#import <CommonCrypto/CommonDigest.h>
#import "NSString+FY.h"
#import "FYMacroDefinition.h"

@implementation NSString (FY)


- (BOOL)fy_isValidURL {
    if ([[self lowercaseString] hasPrefix:@"http://"]
            || [[self lowercaseString] hasPrefix:@"https://"]) {
        return YES;
    } else {
        return NO;
    }
}


+ (NSString *)fy_csvStringFromArray:(NSArray *)stringArray {
    NSMutableString *tmpString = [NSMutableString string];
    @try {
        for (int i = 0; i < stringArray.count; i++) {

            id stringObject = stringArray[i];
            if ([stringObject isKindOfClass:[NSNumber class]]) {
                stringObject = [stringObject stringValue];
            }

            [tmpString appendString:stringObject];
            if (i != stringArray.count - 1) {
                [tmpString appendString:@","];
            }
        }
    }
    @catch (NSException *exception) {
        FYLog(@"NSString(Addition) +stringCSVFromArray: - Exception: %@", exception);
    }
    @finally {

    }

    return tmpString;
}

- (BOOL)fy_isReality; {
    if (self == nil) {
        return NO;
    }

    if ([[self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return NO;
    }

    return YES;
}

- (CGSize)fy_calculateSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle.copy};

        expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        expectedLabelSize = [self sizeWithFont:font
                             constrainedToSize:size
                                 lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }

    return CGSizeMake(ceilf(expectedLabelSize.width), ceilf(expectedLabelSize.height));
}

+ (NSString *)fy_jsonStringFromArray:(NSArray *)array {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (NSString *)fy_MD5String {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int) strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
    ];
}

- (BOOL)fy_isEmpty {
    return [[self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
}

- (void)fy_copyStringToPasteboard {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self];
};

- (NSURL *)fy_toURL; {
    return [NSURL URLWithString:self];
}

- (NSString *)fy_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
