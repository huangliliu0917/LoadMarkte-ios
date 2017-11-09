//
//  NewProductTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "NewProductTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface NewProductTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation NewProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
    _nameLable.font = kAdaptedFontSize(15);
}


- (void)setData:(CateGoryModel *)data{
    _data = data;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:data.icon] placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageRetryFailed];
    self.nameLable.text = [data.name copy];
}


- (void)setModel:(HomeListModel *)model{
    _model = model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageRetryFailed];
    self.nameLable.text = [model.name copy];
}
@end
