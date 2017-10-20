//
//  IflyCheckVersion.h
//  IflyAPP
//
//  Created by 孟辉 on 16/12/5.
//  Copyright © 2016年 iasku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTCheckVersionTool : NSObject

@property (nonatomic, copy) NSString *countryAbbreviation;

+ (instancetype)sharedCheckManager;

/**
 * 传入版本
 **/
- (void)checkVersion:(HTViewController *)viewController;

@end
