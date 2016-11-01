//
// Created by efeng on 2016/10/30.
// Copyright (c) 2016 buerguo. All rights reserved.
//

#import "FYErrorUtil.h"
#import "FYMacroDefinition.h"

#define APP_ERROR_HANDLE_NOTIFICATION @"app_error_handle_notification"

@implementation NSError (FY)

+ (instancetype)fy_errorWithCode:(NSInteger)code message:(NSString *)message {
    NSParameterAssert(message != nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: message};
    return [NSError errorWithDomain:@"com.buerguo.fyhelper" code:code userInfo:userInfo];
}

+ (instancetype)fy_errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code message:(NSString *)message {
    NSParameterAssert(message != nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: message};
    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

- (instancetype)fy_toHandle {
    [mNotificationCenter postNotificationName:APP_ERROR_HANDLE_NOTIFICATION object:self];
    return self;
}

@end

@interface FYErrorUtil ()

@property(nonatomic, copy, readonly) FYErrorHandleBlock handleErrorBlock;

@end

@implementation FYErrorUtil {

}

+ (FYErrorUtil *)instance {
    static FYErrorUtil *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (void)fy_registerToHandle:(FYErrorHandleBlock)block {
    NSParameterAssert(block != nil);

    _handleErrorBlock = [block copy];

    // 注册handleError通知
    [mNotificationCenter addObserver:self
                            selector:@selector(handleError:)
                                name:APP_ERROR_HANDLE_NOTIFICATION
                              object:nil];
}

- (void)handleError:(NSNotification *)notification {
    NSError *error = [notification object]; //获取到传递的对象
    NSString *message = [error userInfo][NSLocalizedDescriptionKey];
    // block
    self.handleErrorBlock(error, message);
}
@end
