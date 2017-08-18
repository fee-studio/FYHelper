//
// Created by efeng on 2016/12/13.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FYTag)

//- (NSString *)tagString;
//
//- (void)setTagString:(NSString *)tagString;
//
//- (id)tagObject;
//
//- (void)setTagObject:(id)tagObject;


@property (nonatomic, copy) NSString *tagString;
@property (nonatomic, strong) id tagObject;


@end