//
//  HotListScrowTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/8.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HotListScrowTableViewCellDelegate <NSObject>

- (void)HotItemClick:(HomeListModel *)model;

@end



@interface HotListScrowTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray <HomeListModel *>*)data;


@property(nonatomic,weak) id <HotListScrowTableViewCellDelegate> delegate;

@end
