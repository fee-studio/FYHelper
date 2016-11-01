#import <CommonCrypto/CommonDigest.h>
#import "NSData+FY.h"

@implementation NSData (FY)

+ (NSData *)fy_dataFromObject:(id)object {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    return data;
}

- (id)fy_objectFromData {
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:self];
    return object;
}

- (NSString *)fy_hexString {
    const unsigned char *dataBuffer = (const unsigned char *) [self bytes];

    if (!dataBuffer)
        return [NSString string];

    NSUInteger dataLength = [self length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];

    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long) dataBuffer[i]]];

    return [NSString stringWithString:hexString];
}

- (NSString *)fy_MD5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (int) self.length, result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
    ];
}

@end
