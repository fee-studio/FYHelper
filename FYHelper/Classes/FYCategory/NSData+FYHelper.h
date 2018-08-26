#import <Foundation/Foundation.h>

@interface NSData (FYHelper)

/**
 * Object to NSData
 */
+ (NSData *)fy_dataFromObject:(id)object;

/**
 * NSData to Object
 */
- (id)fy_toObject;

/**
 * Returns hexadecimal string of NSData.
 * Empty string if data is empty.
 */
- (NSString *)fy_hexString;

/**
 * NSData to MD5 string
 */
- (NSString *)fy_MD5String;

@end
