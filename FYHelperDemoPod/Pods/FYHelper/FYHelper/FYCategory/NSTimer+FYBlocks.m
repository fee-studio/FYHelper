#import <objc/objc.h>
#import "NSTimer+FYBlocks.h"

@implementation NSTimer (FYBlocks)

+ (NSTimer *)fy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    void (^p_block)(NSTimer *timer) = [block copy];
    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(fy_jdExecuteSimpleBlock:) userInfo:p_block repeats:repeats];
    return timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    void (^p_block)(NSTimer *timer) = [block copy];
    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(fy_jdExecuteSimpleBlock:) userInfo:p_block repeats:repeats];
    return timer;
}

+ (void)fy_jdExecuteSimpleBlock:(NSTimer *)inTimer; {
    if ([inTimer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer)) [inTimer userInfo];
        block(inTimer);
    }
}

@end
