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
    
    _nameLable.font = kAdaptedFontSize(15);
}


- (void)setData:(CateGoryModel *)data{
    _data = data;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:data.icon] placeholderImage:nil options:SDWebImageRetryFailed];
    self.nameLable.text = [data.name copy];
}
@end
