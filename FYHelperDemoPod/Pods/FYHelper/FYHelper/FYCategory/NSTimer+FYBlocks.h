#import <Foundation/Foundation.h>

@interface NSTimer (FYBlocks)
+ (NSTimer *)fy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

/**
 * 此方法兼容iOS10以下的系统.
 * @param interval
 * @param repeats
 * @param block
 * @return  NSTimer object
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
@end
