//
//  HomeTopView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HomeTopView.h"

@interface HomeTopView ()

@property (weak, nonatomic) IBOutlet UILabel *firstLable;

@property (weak, nonatomic) IBOutlet UILabel *secondLable;

@property (weak, nonatomic) IBOutlet UILabel *thirdLable;

@end

@implementation HomeTopView


- (void)awakeFromNib{
    [super awakeFromNib];
    self.firstLable.font = kAdaptedFontSize(15);
    self.secondLable.font = kAdaptedFontSize(15);
    self.thirdLable.font = kAdaptedFontSize(15);
}

+ (instancetype)HomeTopViewFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeTopView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
