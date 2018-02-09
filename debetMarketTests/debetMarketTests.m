//
//  debetMarketTests.m
//  debetMarketTests
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTCommon.h"



@interface debetMarketTests : XCTestCase


@end

@implementation debetMarketTests







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

    
    NSString * app = @"adasd?orderId=1234";
    NSRange rang = [app rangeOfString:@"orderId="];
    NSRange orderIdRang = NSMakeRange(rang.location + rang.length, app.length - (rang.location + rang.length));
    [app substringWithRange:orderIdRang];
    NSLog(@"sign-------%@",[app substringWithRange:orderIdRang]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



@end
