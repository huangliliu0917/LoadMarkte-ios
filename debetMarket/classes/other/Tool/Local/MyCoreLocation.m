//
//  MyCoreLocation.m
//  bameng
//
//  Created by lhb on 16/11/11.
//  Copyright © 2016年 HT. All rights reserved.
//

#import "MyCoreLocation.h"
#import <CoreLocation/CoreLocation.h>
@interface MyCoreLocation ()<CLLocationManagerDelegate>
/**
 * 定位管理器
 **/
@property (nonatomic, strong) CLLocationManager * locationManager;
/**
 * 地理编码
 **/
@property (nonatomic, strong) CLGeocoder *geoC;
@end

@implementation MyCoreLocation

static MyCoreLocation * _CoreLocationinstance;


- (CLGeocoder *)geoC{
    if (_geoC == nil) {
        _geoC = [[CLGeocoder alloc] init];
    }
    return _geoC;
}

- (CLLocationManager *)locationManager{
    if(_locationManager == nil){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        _locationManager.distanceFilter = 100.0;
        [_locationManager requestWhenInUseAuthorization];
    }
    return _locationManager;
}



+(instancetype)MyCoreLocationShare{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_CoreLocationinstance == nil){
            _CoreLocationinstance = [[self alloc] init];
        }
    });
    return _CoreLocationinstance;
}


- (instancetype)init{
    if (self = [super init]) {
        [self locationManager];
    }
    return self;
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusDenied://拒绝
            LWLog(@"拒绝");
            break;
        case kCLAuthorizationStatusAuthorizedAlways://拒绝
            LWLog(@"一直允许");
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse://拒绝
            LWLog(@"使用期间允许");
            break;
        default:
            break;
    }
}


- (void)locationManager:(CLLocationManager * )manager didUpdateLocations:(NSArray *)locations{
    CLLocation* location = [locations lastObject];
    NSLog(@"经度:%g,纬度:%g,高度:%g,速度:%g,方向:%g",location.coordinate.latitude,location.coordinate.longitude,location.altitude,location.speed,location.course);
    [manager stopUpdatingLocation];
    
//    NSString * lw = [NSString stringWithFormat:@"%g,%g",location.coordinate.latitude,location.coordinate.longitude];
//    __weak MyCoreLocation * wself = self;
//    [self.geoC reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (error == nil) {
//            CLPlacemark *pl = [placemarks firstObject];
//            NSDictionary * da =  pl.addressDictionary;
//            LWLog(@"%@--%@",pl,[da[@"FormattedAddressLines"] lastObject]);
//            LWLog(@"%@---",pl.locality);
////            [[NSUserDefaults standardUserDefaults] setObject:[da[@"FormattedAddressLines"] lastObject] forKey:@"detailaddress"];
////            if ([wself.delegate respondsToSelector:@selector(MyCoreLocationTakeBackCity: andLatLong: andFullInfo:)]) {
////                [wself.delegate MyCoreLocationTakeBackCity:pl.locality andLatLong:lw andFullInfo:location];
////            }
//        }else{
//            LWLog(@"错误");
//        }
//    }];
    
}

- (void)MyCoreLocationStartLocal:(UIViewController *)vc{
    if([CLLocationManager locationServicesEnabled]){
        if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse){
            [_locationManager startUpdatingLocation];
        }else{
            NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
            NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
            appName = [NSString stringWithFormat:@"为了更好的体验,请到设置->隐私->定位服务中开启!【%@APP】定位服务,已便获取附近信息!",appName];
            UIAlertController * alerc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:appName preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alerc addAction:action1];
            UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                [[UIApplication sharedApplication] openURL:url];
            }];
            [alerc addAction:action2];
            [vc presentViewController:alerc animated:YES completion:nil];
        }

    }
}

- (void)MyCoreLocationStopLocal{
    
    [_locationManager stopUpdatingLocation];
}


@end
