//
//  HTAFHTTPSessionManager.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTAFHTTPSessionManager.h"

@implementation HTAFHTTPSessionManager

+ (instancetype)manager{
    HTAFHTTPSessionManager * manager = [super manager];
    
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 30;
    
    
    // 开始设置请求头
    [manager.requestSerializer setValue:AppVersion forHTTPHeaderField:@"appVersion"];
    [manager.requestSerializer setValue:UUIDString forHTTPHeaderField:@"hwid"];
    [manager.requestSerializer setValue:[[HTTool HTToolShare] HTToolGetIphoneType] forHTTPHeaderField:@"mobileType"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"osType"];
    [manager.requestSerializer setValue:osVersion forHTTPHeaderField:@"osVersion"];
    [manager.requestSerializer setValue:AppMerchantId forHTTPHeaderField:@"merchantId"];
    
    UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
    if(usermodel == nil){
        [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"userToken"];
        [manager.requestSerializer setValue:@"0" forHTTPHeaderField:@"userId"];
        
    }else{
        [manager.requestSerializer setValue:usermodel.userToken forHTTPHeaderField:@"userToken"];
        [manager.requestSerializer setValue:usermodel.userId forHTTPHeaderField:@"userId"];
    }
    
    

    return manager;
}
@end
