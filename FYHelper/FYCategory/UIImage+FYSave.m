//
// Created by efeng on 2016/11/17.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "UIImage+FYSave.h"
#import "FYErrorUtil.h"
#import <Photos/Photos.h>

@implementation UIImage (FYSave)

- (void)fy_saveToAlbumNamed:(NSString *)albumName
             completedBlock:(void (^)(BOOL success, NSError *error))completedBlock {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusAuthorized) {
            //Fetch a collection in the photos library that has the title "albumName"
            PHFetchOptions *fetchOptions = [PHFetchOptions new];

            //Provide the predicate to match the title of the album.
            fetchOptions.predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"title == '%@'", albumName]];

            //Fetch the album using the fetch option
            PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                                                                                  subtype:PHAssetCollectionSubtypeAlbumRegular
                                                                                  options:fetchOptions];
            PHAssetCollection *collection = fetchResult.firstObject;

            if (collection == nil) {
                NSError *error;
                BOOL success = [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
                            [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumName];
                        }
                                                                                    error:&error];
                if (!success) {
                    completedBlock(success, error);
                    return;
                }
            }

            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        //This will request a PHAsset be created for the UIImage
                        PHAssetChangeRequest *creationRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:self];

                        //Create a change request to insert the new PHAsset in the collection
                        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];

                        //Add the PHAsset placeholder into the creation request.
                        //The placeholder is used because the actual PHAsset hasn't been created yet
                        if (request != nil && creationRequest.placeholderForCreatedAsset != nil) {
                            [request addAssets:@[creationRequest.placeholderForCreatedAsset]];
                        }
                    }
                                              completionHandler:^(BOOL success, NSError *_Nullable error) {
                                                  if (error != nil) {
                                                      NSLog(@"Error inserting image into asset collection: %@", error.localizedDescription);
                                                  }
                                                  completedBlock(success, error);
                                              }];
        } else {
            completedBlock(NO, [NSError fy_errorWithCode:fyErrorCodePhotoPermission message:@"没有【照片】的权限,请在设置页中打开" info:nil]);
        }
    }];
}


@end
