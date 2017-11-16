//
//  NewProductTitle.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "NewProductTitle.h"


@interface NewProductTitle()

@end


@implementation NewProductTitle

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit{
    
    
    self.backgroundColor = [UIColor whiteColor];
    UIView * red = [[UIView alloc] init];
    red.backgroundColor = LWColor(236, 36, 43);
    [self addSubview:red];
    
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(kAdaptedHeight(8));
        make.left.equalTo(self.mas_left).offset(kAdaptedHeight(10));
         make.bottom.equalTo(self.mas_bottom).offset(-kAdaptedHeight(8));
        make.width.mas_equalTo(kAdaptedWidth(4));
    }];
    
    UILabel * new = [[UILabel alloc] init];
    [self addSubview:new];
    new.text = @"最新产品";
    new.font = kAdaptedFontSize(15);
    [new mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(red).offset(kAdaptedHeight(10));
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}
@end
