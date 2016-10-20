//
// Created by efeng on 2016/10/19.
// Copyright (c) 2016 weiboyi. All rights reserved.
//

#import "FYLocationUtil.h"


@implementation FYLocationUtil

+ (FYLocationUtil *)instance {
    static FYLocationUtil *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];

            _instance.latitude = @"";
            _instance.longitude = @"";
            _instance.country = @"";
            _instance.province = @"";
            _instance.city = @"";
            _instance.district = @"";
            _instance.street = @"";
        }
    }

    return _instance;
}

- (void)startLocation {
    // 判断定位操作是否被允许
    if ([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *_locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [_locationManager requestAlwaysAuthorization];
        }
        // 开始定位
        [_locationManager startUpdatingLocation];
    } else {
        // 提示用户无法进行定位操作
    }
}

// 定位代理经纬度回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [manager stopUpdatingLocation];
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];

    CLLocationCoordinate2D coor = currentLocation.coordinate;
    NSString *latitude = [NSString stringWithFormat:@"%.8f", coor.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%.8f", coor.longitude];

    self.latitude = latitude;
    self.longitude = longitude;

    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:currentLocation
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       for (CLPlacemark *placemark in placemarks) {
                           NSDictionary *address = [placemark addressDictionary];

                           self.country = address[@"Country"];
                           self.province = address[@"City"];
                           self.city = address[@"State"];
                           self.district = address[@"SubLocality"];
                           self.street = address[@"Street"];
                       }
                   }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error.code == kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
    }
}

@end