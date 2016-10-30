//
// Created by efeng on 2016/10/30.
// Copyright (c) 2016 buerguo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 支持只用code和message来创建NSError
 * 支持错误处理器
 */
@interface NSError (FY)

+ (instancetype)fy_errorWithCode:(NSInteger)code message:(NSString *)message;

+ (instancetype)fy_errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code message:(NSString *)message;

- (void)fy_toHandle;

@end


#pragma mark -

typedef void (^FYErrorHandleBlock)(NSInteger code,
        NSDictionary *userInfo,
        NSString *message,
        NSError *error);

@interface FYErrorUtil : NSObject

+ (FYErrorUtil *)instance;

- (void)fy_registerToHandle:(FYErrorHandleBlock)block;

@end