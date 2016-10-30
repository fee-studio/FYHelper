//
//  AppDelegate.m
//  FYHelperDemo
//
//  Created by efeng on 2016/10/17.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import "AppDelegate.h"
#import "FYErrorUtil.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[FYErrorUtil instance] fy_registerToHandle:^(NSError *error, NSString *fy_message) {
        NSLog(@"message = %@", fy_message);
        NSLog(@"error = %@", error);
        NSLog(@"error.userinfo = %@", error.userInfo);
    }];

    [NSError errorWithDomain:@"com.buerguo.fy" code:101 userInfo:@{@"fy_key": @"fy_value"}];
    [[NSError errorWithDomain:@"com.buerguo.fy1" code:102 userInfo:@{@"fy_key1": @"fy_value1"}] fy_toHandle];
    [[NSError errorWithDomain:@"com.buerguo.fy2" code:103 userInfo:@{@"fy_key2": @"fy_value2"}] fy_toHandle];
    [[NSError fy_errorWithDomain:@"com.buerguo.fy3" code:104 message:@"fy_message"] fy_toHandle];
    [[NSError fy_errorWithCode:105 message:@"fy_message2"] fy_toHandle];
    [[NSError fy_errorWithCode:106 message:@""] fy_toHandle];
    [[NSError fy_errorWithCode:0 message:@"msg00000"] fy_toHandle];
    [[NSError errorWithDomain:@"com.buerguo.fy4" code:-100 userInfo:nil] fy_toHandle];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
