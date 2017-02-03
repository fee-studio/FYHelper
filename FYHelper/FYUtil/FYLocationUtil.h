//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface FYLocationUtil : NSObject <CLLocationManagerDelegate>

@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;

@property(nonatomic, strong) NSString *country;
@property(nonatomic, strong) NSString *province;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *district;
@property(nonatomic, strong) NSString *street;

/**
 * HELP
 * http://stackoverflow.com/questions/3058927/why-the-cllocationmanager-delegate-is-not-getting-called-in-iphone-sdk-4-0
 */
@property(nonatomic, strong) CLLocationManager *locationManager;

+ (FYLocationUtil *)instance;

- (void)startLocation;

@end
