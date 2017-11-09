//
//  ContentView.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ContentViewDelegate <NSObject>

- (void)ContentViewDelegate:(HomeListModel *)model;

- (void)seeMore;
@end


@interface ContentView : UIView


/**热门列表*/
@property(nonatomic,strong) NSArray * hotProjectList;

/**最新产品*/
@property(nonatomic,strong) NSArray * NewListS;


- (void) ContentViewSetDate:(NSArray *)hotProjectList and:(NSArray *)NewListS;


@property(nonatomic,weak) id <ContentViewDelegate> delegate;

@end
