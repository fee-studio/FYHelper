//
// Created by efeng on 2017/4/8.
// Copyright (c) 2017 weiboyi. All rights reserved.
//

#import "UIAlertController+FYSupportedInterfaceOrientations.h"


@implementation UIAlertController (FYSupportedInterfaceOrientations)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000

- (NSUInteger)supportedInterfaceOrientations; {
    return UIInterfaceOrientationMaskPortrait;
}

#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end