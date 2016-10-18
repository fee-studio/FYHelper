//
//  FYDeviceInfo.m
//  MagicWallpaper
//
//  Created by efeng on 2016/10/18.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import "FYDeviceInfo.h"

@implementation FYDeviceInfo


+ (NSString *)systemName {
	return [[UIDevice currentDevice] systemName];
}

+ (NSString *)systemVersion {
	return [[UIDevice currentDevice] systemVersion];
}

+ (BOOL)isIpad {
	return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)isIphone {
	return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (NSString *)deviceModel {
	return [[UIDevice currentDevice] model];
}

+ (NSString *)vendorId {
	return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

@end
