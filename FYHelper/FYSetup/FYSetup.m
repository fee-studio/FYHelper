//
// Created by efeng on 2017/7/3.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

#import "FYSetup.h"
#import "DDLog+FYSetup.h"
#import "Bugly+FYSetup.h"


@implementation FYSetup {

}

+ (void)initialize {
    [super initialize];


}


+ (void)load {
    [super load];


    [DDLog fy_setup];
    [Bugly fy_setup];



}






@end