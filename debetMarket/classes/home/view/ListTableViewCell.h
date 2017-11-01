//
//  ListTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ListTableViewCellDelegate <NSObject>

- (void)ListTableViewCellClick:(HomeListModel *) model;

@end


@interface ListTableViewCell : UITableViewCell

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray<HomeListModel *> *)data;

@property(nonatomic,weak) id <ListTableViewCellDelegate> delegate;

@end
