//
//  NSMutableDictionary+XingZhuangSign.m
//  XingZhang
//
//  Created by 罗海波 on 2017/2/9.
//  Copyright © 2017年 xz. All rights reserved.
//

#import "NSMutableDictionary+XingZhuangSign.h"
#import "MD5Encryption.h"


@implementation NSMutableDictionary (Sign)


+ (NSMutableDictionary *)asignWithMutableDictionary:(NSMutableDictionary *)dict{
    
    if (dict == nil) {
        dict = [[self alloc] init];
    }
    dict[@"customerid"] = DebetCustomerId;
    NSDate * timestamp = [[NSDate alloc] init];
    NSString *timeSp = [NSString stringWithFormat:@"%lld", (long long)[timestamp timeIntervalSince1970] * 1000];  //转化为UNIX时间戳
    dict[@"appId"] = kNewOutFitAppID;
    dict[@"token"] = kNewOutFitToken;
    dict[@"timestamp"] = timeSp;
    //计算asign参数
    NSArray * arr = [dict allKeys];
    [arr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * cc = [NSString stringWithFormat:@"%@",[dict objectForKey:obj]];
        if (cc.length==0) {
            //            NSLog(@"%@",cc);
            [dict removeObjectForKey:obj];
        }
        
    }];
    //计算asign参数
    arr = [dict allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        return [[obj1 lowercaseString] compare:[obj2 lowercaseString]] == NSOrderedDescending;
    }];
    NSMutableString * signCap = [[NSMutableString alloc] init];
    //进行asign拼接
    for (NSString * dicKey in arr) {
        [signCap appendString:[NSString stringWithFormat:@"%@%@",[dicKey lowercaseString],[dict valueForKey:dicKey]]];
    }
//    NSString * aa = [signCap substringToIndex:signCap.length-1];
    
    NSString * cc  = [NSString stringWithFormat:@"%@%@",signCap,kNewOutFitAppSecrect];
    //LWLog(@"%@",cc);
    dict[@"sign"] = [[[MD5Encryption alloc] init] md5:cc];
    return dict;
}

- (NSMutableDictionary *)asignWithMutableDictionary{
    
    return [NSMutableDictionary asignWithMutableDictionary:self];
}

@end
