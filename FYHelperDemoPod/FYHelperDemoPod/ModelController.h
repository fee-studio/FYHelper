//
//  ModelController.h
//  FYHelperDemoPod
//
//  Created by xiaojia on 02/07/2017.
//  Copyright (c) 2017 xiaojia. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
