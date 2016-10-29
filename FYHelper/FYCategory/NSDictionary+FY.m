//
// Created by efeng on 2016/10/29.
// Copyright (c) 2016 buerguo. All rights reserved.
//

#import "NSDictionary+FY.h"


@implementation NSDictionary (FY)

- (NSString *)fy_jsonString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return (error ? nil : json);
}

@end
