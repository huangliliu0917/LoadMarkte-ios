//
//  HotPublish.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HotPublish.h"

@interface HotPublish ()

@property (weak, nonatomic) IBOutlet UILabel *firstLable;

@property (weak, nonatomic) IBOutlet UILabel *secondLable;



@end


@implementation HotPublish

+ (instancetype)HotPublishViewCreate{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"HotPublish" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.firstLable.font = kAdaptedFontSize(20);
    self.secondLable.font = kAdaptedFontSize(16);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
