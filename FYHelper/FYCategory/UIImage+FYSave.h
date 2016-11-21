//
// Created by efeng on 2016/11/17.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (FYSave)

/**
 * 把图片保存到指定的相册中
 * @param albumName 相册名
 * @param completedBlock
 */
- (void)saveToAlbumNamed:(NSString *)albumName
          completedBlock:(nullable void (^)(BOOL success, NSError *__nullable error))completedBlock;

@end