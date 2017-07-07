//
//  NSArray+Addition.m
//  Dobby
//
//  Created by efeng on 14/12/9.
//  Copyright (c) 2014年 weiboyi. All rights reserved.
//

#import "NSArray+FYJson.h"

@implementation NSArray (FYJson)

- (NSString *)fy_jsonString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return (error ? nil : json);
}

@end
