//
//  IflyCheckVersion.m
//  IflyAPP
//
//  Created by luohaibo on 16/12/5.
//  Copyright © 2016年 iasku. All rights reserved.
//

#import "HTCheckVersionTool.h"
#import <StoreKit/StoreKit.h>
@interface HTCheckVersionTool()
@end

@implementation HTCheckVersionTool
static HTCheckVersionTool *checkManager = nil;
+ (instancetype)sharedCheckManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        checkManager = [[HTCheckVersionTool alloc] init];
        
    });
    return checkManager;
}

- (void)toAlertWithCurrent:(NSString *)cv andNetVersion:(NSString *)netVer andUrl:(NSString *)url andVC:(UIViewController *)vc{
    int  cc = [[cv stringByReplacingOccurrencesOfString:@"." withString:@""]intValue];
    int  nc = [[netVer stringByReplacingOccurrencesOfString:@"." withString:@""] intValue];
    if(cc < nc){
        UIAlertController * alerc = [UIAlertController alertControllerWithTitle:@"版本提示" message:@"当前发现新版本，是否前往更新？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alerc addAction:action1];
        UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:url]];
        }];
        [alerc addAction:action2];
        
        [vc presentViewController:alerc animated:YES completion:nil];
    }
}

- (void)checkVersion:(HTViewController *)viewController{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSString * URL = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@",AppleID];
   // AFNnet
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        if(responseObject){
            NSArray *infoArray = [responseObject objectForKey:@"results"];
            if ([infoArray count]) {
                NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
                NSString *lastVersion = [releaseInfo objectForKey:@"version"];
                NSString *trackViewUrl = [releaseInfo objectForKey:@"trackViewUrl"];
                [self toAlertWithCurrent:currentVersion andNetVersion:lastVersion andUrl:trackViewUrl andVC:viewController];
            }
        }
    } failure:nil];
    
}

@end
