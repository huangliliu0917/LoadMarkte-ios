//
//  ContentTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ContentTableViewCell.h"
@interface ContentTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *monthRate;
@property (weak, nonatomic) IBOutlet UILabel *debetLine;
@property (weak, nonatomic) IBOutlet UILabel *firstLable;
@property (weak, nonatomic) IBOutlet UILabel *secondLable;

@end

@implementation ContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
    
    self.firstLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
    self.firstLable.layer.masksToBounds = YES;
    self.firstLable.layer.borderWidth = .6;
    self.firstLable.layer.borderColor = [UIColor lightGrayColor].CGColor;

    self.secondLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
    self.secondLable.layer.masksToBounds = YES;
    self.secondLable.layer.borderWidth = .6;
    self.secondLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
