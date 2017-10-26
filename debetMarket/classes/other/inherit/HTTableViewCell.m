//
//  HTTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/24.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTTableViewCell.h"

@implementation HTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
