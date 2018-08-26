#import <Foundation/Foundation.h>

@interface NSTimer (FYBlock)

/**
 * 此方法兼容iOS10以下的系统.
 */
+ (NSTimer *)fy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
