//
//  FYDeviceUtil.m
//  MagicWallpaper
//
//  Created by efeng on 2016/10/18.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import "FYDeviceUtil.h"

@implementation FYDeviceUtil


+ (NSString *)fy_systemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)fy_systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (float)fy_systemVersionCode {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


+ (BOOL)fy_isiPad {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)fy_isiPhone {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (NSString *)fy_deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)fy_vendorUUID {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

@end
