//
// Created by efeng on 2016/12/29.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "NSData+FYCache.h"
#import <CommonCrypto/CommonDigest.h>

#define kSDMaxCacheFileAmount 100

@implementation NSData (FYCache)

+ (NSString *)fy_cachePath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"Caches"];
    path = [path stringByAppendingPathComponent:@"FYDataCache"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

+ (NSString *)fy_creatMD5StringWithString:(NSString *)string {
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG) strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    [hash lowercaseString];
    return hash;
}

+ (NSString *)fy_creatDataPathWithString:(NSString *)string {
    NSString *path = [NSData fy_cachePath];
    path = [path stringByAppendingPathComponent:[self fy_creatMD5StringWithString:string]];
    return path;
}

- (void)fy_saveDataCacheWithIdentifier:(NSString *)identifier {
    NSString *path = [NSData fy_creatDataPathWithString:identifier];
    [self writeToFile:path atomically:YES];
}

+ (NSData *)fy_getDataCacheWithIdentifier:(NSString *)identifier {
    static BOOL isCheckedCacheDisk = NO;
    if (!isCheckedCacheDisk) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *contents = [manager contentsOfDirectoryAtPath:[self fy_cachePath] error:nil];
        if (contents.count >= kSDMaxCacheFileAmount) {
            [manager removeItemAtPath:[self fy_cachePath] error:nil];
        }
        isCheckedCacheDisk = YES;
    }
    NSString *path = [self fy_creatDataPathWithString:identifier];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

+ (void)fy_clearDataCache {
    [[NSFileManager defaultManager] removeItemAtPath:[self fy_cachePath] error:nil];
}

@end