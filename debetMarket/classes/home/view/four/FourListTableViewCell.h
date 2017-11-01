//
//  FourListTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/30.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol FourListTableViewCellDelegate <NSObject>

- (void)FourListTableViewCellClick:(HomeListModel *)model;

@end


@interface FourListTableViewCell : UITableViewCell

@property(nonatomic,strong) NSArray * datas;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray <HomeListModel *>*)data;


@property(nonatomic,weak) id <FourListTableViewCellDelegate> delegate;

@end
