//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYNavigationController.h"


@implementation FYNavigationController {

}



- (void)dealloc {
    NSString *tips = [NSString stringWithFormat:@"✅ FYNC: %@ - dealloc", NSStringFromClass(self.class)];
    NSLog(@"%@", tips);
}

@end