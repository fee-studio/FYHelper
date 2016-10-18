//
//  FYDeviceInfo.h
//  MagicWallpaper
//
//  Created by efeng on 2016/10/18.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYDeviceInfo : NSObject


/** 获取iOS系统的名称 */
+ (NSString *)systemName;

/** 获取iOS系统的版本号 */
+ (NSString *)systemVersion;

/** 设备型号 **/
+ (NSString *)deviceModel;

/** 判断当前设备是否ipad */
+ (BOOL)isIpad;

/** 判断当前设备是否iphone */
+ (BOOL)isIphone;

+ (NSString *)vendorId;


@end
