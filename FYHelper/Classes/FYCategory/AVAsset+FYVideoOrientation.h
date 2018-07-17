//
// Created by efeng on 2017/4/14.
// Copyright (c) 2017 weiboyi. All rights reserved.
//
// VIP https://gist.github.com/lukabernardi/5020724#file-avasset-videoorientation-h-L5
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef enum {
    LBVideoOrientationUp,               //Device starts recording in Portrait
    LBVideoOrientationDown,             //Device starts recording in Portrait upside down
    LBVideoOrientationLeft,             //Device Landscape Left  (home button on the left side)
    LBVideoOrientationRight,            //Device Landscape Right (home button on the Right side)
    LBVideoOrientationNotFound = 99     //An Error occurred or AVAsset doesn't contains video track
} LBVideoOrientation;

@interface AVAsset (FYVideoOrientation)

/**
 Returns a LBVideoOrientation that is the orientation
 of the iPhone / iPad whent starst recording

 @return A LBVideoOrientation that is the orientation of the video
 */
@property(nonatomic, readonly) LBVideoOrientation videoOrientation;


@end