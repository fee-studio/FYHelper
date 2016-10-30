//
//  FYFileUtil.h
//  Dobby
//
//  Created by efeng on 14-6-30.
//  Copyright (c) 2014年 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYFileUtil : NSObject

+ (NSString *)fy_appCachesDirectory;

+ (NSString *)fy_appDocumentDirectory;

// 单个文件的大小
+ (long long)fy_fileSizeAtPath:(NSString *)filePath;

// 遍历文件夹获得文件夹大小，返回多少M
+ (float)fy_folderSizeAtPath:(NSString *)folderPath;

@end
