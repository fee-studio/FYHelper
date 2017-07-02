//
// Created by efeng on 2016/12/13.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+FY.h"

static char *const kTagStringKey;
static char *const kTagObjectKey;

@implementation NSObject (FY)

- (NSString *)tagString {
    NSString *strTag = objc_getAssociatedObject(self, kTagStringKey);
    return strTag;
}

- (void)setTagString:(NSString *)tagString {
    objc_setAssociatedObject(self, kTagStringKey, tagString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)tagObject; {
    id obj = objc_getAssociatedObject(self, kTagObjectKey);
    return obj;
}

- (void)setTagObject:(id)tagObject; {
    objc_setAssociatedObject(self, kTagObjectKey, tagObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, kTagObjectKey, tagObject, OBJC_ASSOCIATION_COPY_NONATOMIC); // 不能用这个。会深复制
}

@end