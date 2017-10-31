//
//  ContentTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ContentTableViewCell.h"
#import "UIImageView+WebCache.h"


@interface ContentTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *monthTitle;

@property (weak, nonatomic) IBOutlet UILabel *monthRate;

@property (weak, nonatomic) IBOutlet UILabel *debetLineTitle;

@property (weak, nonatomic) IBOutlet UILabel *debetLine;
@property (weak, nonatomic) IBOutlet UILabel *firstLable;

@property (weak, nonatomic) IBOutlet UILabel *secondLable;

@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

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
    
    _titleLable.font = kAdaptedFontSize(16);
}



- (void)setModel:(HomeListModel *)model{
    
    LWLog(@"%@",model.name);
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:nil];
    _titleLable.text = model.name;
    
    // 0 日利率 1 月利率  2 年利率
    if([model.deadlineUnit intValue] == 0){
        _monthTitle.text = @"日利率";
    }else if([model.deadlineUnit intValue] == 1){
        _monthTitle.text = @"月利率";
    }else{
       _monthTitle.text = @"年利率";
    }
    
    _debetLine.text = [NSString stringWithFormat:@"%@ %",model.interestRate];
    
    if (model.enableMoney.length) {
        NSArray * money =  [model.enableMoney componentsSeparatedByString:@","];
        _debetLine.text = [NSString stringWithFormat:@"%@ ~ %@元",[money firstObject],[money lastObject]];
    }else{
        _debetLine.text = @"0 元";
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
