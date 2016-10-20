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

+ (FYLocationUtil *)instance;

- (void)startLocation;

@end
