
//
//  HTNetworkingTool.m
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import "HTNetworkingTool.h"
#import "HTTool.h"


@interface HTNetworkingTool()

@end



@implementation HTNetworkingTool

static HTNetworkingTool * _HTNetworkingTool;

+ (instancetype)HTNetworkingManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _HTNetworkingTool = [[self alloc] init];
    });
    return _HTNetworkingTool;
}

/*账户网络请求Get*/
+ (void)HTNetworkingToolGet:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    if (isHud) { // 是否显示loading
        [SVProgressHUD showWithStatus:nil];
    }
    LWLog(@"api url %@",url);
    [manager GET:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",task);
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        LWLog(@"%@",json);
        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[json objectForKey:@"resultMsg"]];
        }else{
            LWLog(@"%@",json);
            success(json);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

+ (void)showLogin:(NSString *)alertStr{

    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    [[HTTool HTToolShare] showAlertWithController:appDelegate.currentVC andTitle:@"账号提示" andMessage:alertStr conform:^{
        LoginViewController * login = [[LoginViewController alloc] init];
        HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:login];
        AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
        [[AFHTTPSessionManager manager] invalidateSessionCancelingTasks:YES];
        [appDelegate.currentVC presentViewController:nav animated:YES completion:nil];
        
        
    } cancle:nil];
}

+ (void)HTNetworkingToolPost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    
    LWLog(@"api url %@",url);
    if (isHud) { // 是否显示loading
       [SVProgressHUD showWithStatus:nil];
    }
    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LWLog(@"%@",task);
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[json objectForKey:@"resultMsg"]];
            failure(nil);
        }else{
            LWLog(@"%@",json);
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

+ (void)HTNetworkingGetAppleServicePost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    //NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    
    //LWLog(@"api url %@",url);
    if (isHud) { // 是否显示loading
        [SVProgressHUD showWithStatus:nil];
    }
    [manager POST:urlStr parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LWLog(@"%@",task);
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[json objectForKey:@"resultMsg"]];
        }else{
            LWLog(@"%@",json);
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [SVProgressHUD dismiss];
        failure(error);
    }];
}



+ (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(IDModel *)modele success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    [SVProgressHUD showWithStatus:@"资料上传中"];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];

//    dict[@"name"] = [modele.name copy];
//    dict[@"cardNo"] = [modele.cardNo copy];
//    dict[@"gender"] = @(modele.gender);
//    dict[@"nation"] = [modele.nation copy];
//    dict[@"address"] = [modele.address copy];
//    dict[@"birth"] = [modele.birth copy];
//    dict[@"duration"] = [modele.duration copy];
//    dict[@"authority"] = [modele.authority copy];
// 
//    
//    
//    LWLog(@"%@-----%@",modele.frontSideFile,modele.backSideFile);
//    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:dict] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        NSData * imageData = UIImagePNGRepresentation([[HTTool HTToolShare] scaleImage:modele.frontSideFile sclae:0.1]);
//        // 上传的参数名
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
//        [formData appendPartWithFileData:imageData name:@"frontSideFile" fileName:fileName mimeType:@"image/png"];
//        
//        
//        
//        NSData * imageData1 = UIImagePNGRepresentation([[HTTool HTToolShare] scaleImage:modele.backSideFile sclae:0.1]);
//        // 上传的参数名
//        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str1 = [formatter1 stringFromDate:[NSDate date]];
//        NSString *fileName1 = [NSString stringWithFormat:@"%@.png", str1];
//        [formData appendPartWithFileData:imageData1 name:@"backSideFile" fileName:fileName1 mimeType:@"image/png"];
//        
//        
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [SVProgressHUD dismiss];
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
//            [self showLogin:[json objectForKey:@"resultMsg"]];
//        }else{
//            LWLog(@"%@",json);
//            success(json);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD dismiss];
//       failure(error);
//    }];

}

+ (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(NSMutableDictionary *)modele andImages:(NSArray <UIImage *>*)images andImageParameName:(NSString *)iconName success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    [SVProgressHUD showWithStatus:@"资料上传中"];
    
    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:modele] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < 1; i++) {
        
            UIImage * upLoadImage =  [images objectAtIndex:i];
            NSData * imageData = UIImagePNGRepresentation(upLoadImage);
            // 上传的参数名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            [formData appendPartWithFileData:imageData name:iconName fileName:fileName mimeType:@"image/png"];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[json objectForKey:@"resultMsg"]];
        }else{
            LWLog(@"%@",json);
            success(json);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
    
}

//#pragma mark  网络判断
//+ (BOOL)requestBeforeJudgeConnect
//{
//    struct sockaddr zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sa_len = sizeof(zeroAddress);
//    zeroAddress.sa_family = AF_INET;
//    SCNetworkReachabilityRef defaultRouteReachability =
//    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    BOOL didRetrieveFlags =
//    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    if (!didRetrieveFlags) {
//        printf("Error. Count not recover network reachability flags\\n");
//        return NO;
//    }
//    BOOL isReachable = flags & kSCNetworkFlagsReachable;
//    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
//    BOOL isNetworkEnable  =(isReachable && !needsConnection) ? YES : NO;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIApplication sharedApplication].networkActivityIndicatorVisible =isNetworkEnable;/*  网络指示器的状态： 有网络 ： 开  没有网络： 关  */
//    });
//    return isNetworkEnable;
//}
@end
