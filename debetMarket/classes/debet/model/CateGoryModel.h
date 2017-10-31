//
//  CateGoryModel.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/30.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CateGoryModel : NSObject
    
@property(nonatomic,assign) int categoryId;
    
@property(nonatomic,copy) NSString * icon;
    
@property(nonatomic,copy) NSString * name;
    
@property(nonatomic,assign) int parentId;
    
@end
