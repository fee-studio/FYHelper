//
//  FYDeviceUtil.h
//  MagicWallpaper
//
//  Created by efeng on 2016/10/18.
//  Copyright © 2016年 buerguo. All rights reserved.
//
#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface FYDeviceUtil : NSObject


/**
 * 获取iOS系统的名称
 */
+ (NSString *)fy_systemName;

/**
 * 获取iOS系统的版本号
 */
+ (NSString *)fy_systemVersion;

/**
 * 系统版本号floats
 */
+ (float)fy_systemVersionCode;

/**
 * 设备型号
 * e.g. @"iPhone", @"iPod touch"
 */
+ (NSString *)fy_deviceModel;

/**
 * 判断当前设备是否iPad
 */
+ (BOOL)fy_isiPad;

/**
 * 判断当前设备是否iPhone
 */
+ (BOOL)fy_isiPhone;

/**
 * 供应商的UUID
 */
+ (NSString *)fy_vendorUUID;

/**
 * 打电话 
 */
+ (void)fy_callTelephone:(NSString *)phoneNumber;

/**
 * 是否为iPhoneX
 * @return
 */
+ (BOOL)fy_isIphoneX;

@end
