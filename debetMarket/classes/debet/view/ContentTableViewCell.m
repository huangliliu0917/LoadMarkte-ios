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

@property (weak, nonatomic) IBOutlet UILabel *thirdLable;


@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@property(nonatomic,strong) NSMutableArray * lableArray;

@end

@implementation ContentTableViewCell

- (NSMutableArray *)lableArray{
    if (_lableArray == nil) {
        
        _lableArray = [NSMutableArray array];
    }
    return _lableArray;
}

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
    
    self.thirdLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
    self.thirdLable.layer.masksToBounds = YES;
    self.thirdLable.layer.borderWidth = .5;
    self.thirdLable.layer.borderColor = LWColor(190, 190, 192).CGColor;
    
    
    [self.lableArray addObject:self.firstLable];
    [self.lableArray addObject:self.secondLable];
    [self.lableArray addObject:self.thirdLable];
    _titleLable.font = kAdaptedFontSize(18);
    _monthTitle.font = kAdaptedFontSize(15);
    _monthRate.font = kAdaptedFontSize(15);
    
    _debetLineTitle.font = kAdaptedFontSize(15);
    
    _debetLine.font = kAdaptedFontSize(15);
   
}

- (NSString *)getRang:(NSString *)money{
    
    if (money.length > 5) {
        NSInteger rang = [money doubleValue] / 10000;
        return [NSString stringWithFormat:@"%ld万",rang];
    }
    return money;
}

- (void)setModel:(HomeListModel *)model{
    
    LWLog(@"%@",model.name);
    _model = model;
    
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"default"]];
    _titleLable.text = model.name;
    
    // 0 日利率 1 月利率  2 年利率
    if([model.deadlineUnit intValue] == 0){
        _monthTitle.text = @"日利率";
    }else if([model.deadlineUnit intValue] == 1){
        _monthTitle.text = @"月利率";
    }else{
       _monthTitle.text = @"年利率";
    }
    NSString * aa ;
    if (model.interestRate.length > 4) {
        aa = [model.interestRate substringToIndex:4];
    }else{
        aa = model.interestRate;
    }
    _monthRate.text = [NSString stringWithFormat:@"%@ %%",aa];
    
    if (model.enableMoney.length) {
        NSArray * money =  [model.enableMoney componentsSeparatedByString:@","];
        if (money.count == 1) {
            _debetLine.text = [NSString stringWithFormat:@"%@元",[self getRang:[money firstObject]]];
        }else{
           _debetLine.text = [NSString stringWithFormat:@"%@ ~ %@元",[self getRang:[money firstObject]],[self getRang:[money lastObject]]];
        }
        
    }else{
        _debetLine.text = @"0 元";
    }
//    LWLog(@"%d-----%d",model.isHot,model.isNew);
    if (model.isHot == 1) {
        [_rightImage setImage:[UIImage imageNamed:@"tj"]];
    }else{
        
        if(model.isNew == 1){
            [_rightImage setImage:[UIImage imageNamed:@"xp"]];
        }else{
            [_rightImage setImage:nil];
        }
        
    }
    
    LWLog(@"%@---%@",model.name,model.tag);
    if (model.tag.length) {
        NSArray * tags = [model.tag componentsSeparatedByString:@","];
        NSInteger index = tags.count > 3 ? 3 : tags.count;
        for (int i = 0; i < index; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.hidden = NO;
            title.text = [NSString stringWithFormat:@"  %@  ",[tags objectAtIndex:i]];
        }
        
        if (index < 3) {
            for (NSUInteger i = tags.count; i < 3; i++) {
                UILabel * title =  [self.lableArray objectAtIndex:i];
                title.hidden = YES;
            }
        }
    }else{
        for (int i = 0; i < self.lableArray.count; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.text = nil;
        }
        
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
