//
//  debetMarketTests.m
//  debetMarketTests
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "MD5Encryption.h"

@interface debetMarketTests : XCTestCase
/**网络  APP 标识*/
#define NoticeCenterAppKey  @"app"
/**网络  APP 签名秘药*/
#define NoticeCenterAppSecure  @"21ff3104eb7a7bf3f2b663b8ab18eebe"
@end

@implementation debetMarketTests

//- (NSString *)HotTechAsignWith:(NSString *)key{
//    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
//    NSString *timeString = [NSString stringWithFormat:@"%.f", a];
//    timeString = @"1509698895918";
//    NSString * firstSecure =  [NSString stringWithFormat:@"%@%@",NoticeCenterAppKey,timeString];
//
////    NSData * test = [firstSecure dataUsingEncoding:NSUTF8StringEncoding];
//
////    NSString *unicodeStr = [NSString stringWithCString:[firstSecure UTF8String] encoding:NSUnicodeStringEncoding];
//
//    const char * origin = [firstSecure UTF8String];
//    unsigned char mdc[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(origin, (CC_LONG)strlen(origin), mdc);
//    NSData * content = [NSData dataWithBytes:mdc length:CC_MD5_DIGEST_LENGTH];
////    Byte MD5result[CC_MD5_DIGEST_LENGTH];
////    CC_MD5([test bytes],(UInt16)[test length],MD5result);
////    NSData *adata = [[NSData alloc] initWithBytes:MD5result length:CC_MD5_DIGEST_LENGTH];
//    NSData * ta1 = [self stringToByte:NoticeCenterAppSecure];
//    NSMutableData * cc = [NSMutableData dataWithData:content];
//    [cc appendData:ta1];
//
//    unsigned char MD5result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5([cc bytes],(CC_LONG)strlen([cc bytes]),MD5result);
//    NSString * signS = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//                        MD5result[0], MD5result[1], MD5result[2], MD5result[3],
//                        MD5result[4], MD5result[5], MD5result[6], MD5result[7],
//                        MD5result[8], MD5result[9], MD5result[10], MD5result[11],
//                        MD5result[12], MD5result[13], MD5result[14], MD5result[15]
//                        ];
//    return signS;
//}
//
//
//
//
//-(NSData*)stringToByte:(NSString*)string
//{
//    NSString *hexString=[[string uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if ([hexString length]%2!=0) {
//        return nil;
//    }
//    Byte tempbyt[1]={0};
//    NSMutableData* bytes=[NSMutableData data];
//    for(int i=0;i<[hexString length];i++)
//    {
//        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
//        int int_ch1;
//        if(hex_char1 >= '0' && hex_char1 <='9')
//            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
//        else if(hex_char1 >= 'A' && hex_char1 <='F')
//            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
//        else
//            return nil;
//        i++;
//
//        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
//        int int_ch2;
//        if(hex_char2 >= '0' && hex_char2 <='9')
//            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
//        else if(hex_char2 >= 'A' && hex_char2 <='F')
//            int_ch2 = hex_char2-55; //// A 的Ascll - 65
//        else
//            return nil;
//
//        tempbyt[0] = int_ch1+int_ch2;  ///将转化后的数放入Byte数组里
//        [bytes appendBytes:tempbyt length:1];
//    }
//    return bytes;
//}



- (NSData * )test:(NSString *)hexString{
    int j=0;
    Byte bytes[128];  ///3ds key的Byte 数组， 128位
    for(int i=0;i<[hexString length];i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        i++;
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        
        else
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        int_ch = int_ch1+int_ch2;
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        j++;
        
    }
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:j];
    return newData;
}

- (NSString *)HotTechAsignWith:(NSString *)key{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.f", a];
    timeString = @"1509699334914";
    NSString * firstSecure =  [NSString stringWithFormat:@"%@%@",NoticeCenterAppKey,timeString];
    NSData * test = [firstSecure dataUsingEncoding:NSUTF8StringEncoding];
    Byte MD5result[16];
    CC_MD5([test bytes],(UInt8)[test length],MD5result);
    NSData *adata = [[NSData alloc] initWithBytes:MD5result length:16];
    NSData * ta1 = [self test:NoticeCenterAppSecure];
    NSMutableData * cc = [NSMutableData dataWithData:adata];
    [cc appendData:ta1];
    CC_MD5([cc bytes],(UInt8)[cc length],MD5result);
    NSString * signS = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        MD5result[0], MD5result[1], MD5result[2], MD5result[3],
                        MD5result[4], MD5result[5], MD5result[6], MD5result[7],
                        MD5result[8], MD5result[9], MD5result[10], MD5result[11],
                        MD5result[12], MD5result[13], MD5result[14], MD5result[15]
                        ];
    return signS;
}



- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    [self javaAsignWithMutableDictionary:<#(NSMutableDictionary *)#>]
   
 
    NSString * sign = [self HotTechAsignWith:nil];
//    NSString * sign =  [self HotTechAsignWith:nil];
//    NSAssert([sign isEqualToString:@"863DFE40CC9462E021638D38C4E08F75"], nil);
    NSLog(@"sign-------%@",sign);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



@end
