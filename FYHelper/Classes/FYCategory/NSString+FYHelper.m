#import <CommonCrypto/CommonDigest.h>
#import "NSString+FYHelper.h"
//#import "EXTKeyPathCoding.h"
//#import "FYMacroDefinition.h"

@implementation NSString (FYHelper)


- (BOOL)fy_isValidURL {
    if ([[self lowercaseString] hasPrefix:@"http://"]
            || [[self lowercaseString] hasPrefix:@"https://"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)fy_csvFromArray:(NSArray *)array {
    NSMutableString *mutableString = [NSMutableString string];
    for (id object in array) {
        NSString *string = object;
        if ([object isKindOfClass:[NSNumber class]]) {
            string = [object stringValue];
        }
        if (![[string fy_trim] isEqualToString:@""]) {
            [mutableString appendString:string];
            [mutableString appendString:@","];
        }
    }
    if (mutableString.length > 0) {
        [mutableString deleteCharactersInRange:NSMakeRange(mutableString.length - 1, 1)];
    }
    return mutableString;
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
        NSLog(@"NSString(Addition) +stringCSVFromArray: - Exception: %@", exception);
    }
    @finally {

    }

    return tmpString;
}

- (BOOL)fy_isReality; {
    if (self == nil) {
        return NO;
    }
    return ![[self stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
}

- (BOOL)fy_isEmpty {
    if (self == nil) {
        return YES;
    }
    return [[self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
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

- (void)fy_copyStringToPasteboard {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self];
};

- (NSURL *)fy_toURL; {
    /* 最好是后端去转码
    NSString *webString;
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        webString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        webString = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
    }
    return [NSURL URLWithString:webString];
     */
    return [NSURL URLWithString:self];
}

- (NSString *)fy_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)fy_encodingUTF8 {
    NSString *encodingString;
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        encodingString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        encodingString = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
    }
    return encodingString;
}

- (NSArray *)fy_toArrayBySeparator:(NSString *)separator {
    return [self componentsSeparatedByString:separator];
}

+ (NSString *)fy_toStringFromArray:(NSArray *)array insertSeparator:(NSString *)separator {
    NSMutableString *mutableString = [NSMutableString string];
    for (id object in array) {
        NSString *string = object;
        if ([object isKindOfClass:[NSNumber class]]) {
            string = [object stringValue];
        }
        if (![[string fy_trim] isEqualToString:@""]) {
            [mutableString appendString:string];
            [mutableString appendString:separator];
        }
    }
    if (mutableString.length > 0) {
        [mutableString deleteCharactersInRange:NSMakeRange(mutableString.length - 1, 1)];
    }
    return mutableString;
}

@end
