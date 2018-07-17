//
// Created by efeng on 2016/12/29.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FYCache)


- (void)fy_saveDataCacheWithIdentifier:(NSString *)identifier;

+ (NSData *)fy_getDataCacheWithIdentifier:(NSString *)identifier;

+ (void)fy_clearDataCache;
@end