//
//  QueryHeadView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "QueryHeadView.h"


@interface QueryHeadView()

@property (nonatomic,strong) NSArray * titles;

@end


@implementation QueryHeadView


- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles{
    
    if (self = [super initWithFrame:frame]) {
        
        self.titles = titles;
        
        [self setUpInit];
    }
    
    return self;
    
}

- (void)setUpInit{
    
    CGFloat with = kAdaptedHeight(26);
    CGFloat margin = (KScreenWidth - self.titles.count * with) * 1.0 /  (self.titles.count + 1);
    for (int i = 0; i < self.titles.count; i++) {
        
        
        UILabel * head  = [[UILabel alloc] initWithFrame:CGRectMake((margin + with) * i + margin, 15, with, with )];
        head.text = [NSString stringWithFormat:@"%d",i+1];
        head.textAlignment = NSTextAlignmentCenter;
        head.backgroundColor = [UIColor redColor];
        head.textColor = [UIColor whiteColor];
        head.layer.cornerRadius = with * 0.5;
        head.layer.masksToBounds = YES;
        head.font = kAdaptedFontSize(12);
        [self addSubview:head];
        
        
        
        
        if (i < self.titles.count - 1) {
            UIView * he = [[UIView alloc] init];
            he.frame = CGRectMake(CGRectGetMaxX(head.frame), head.center.y - 1, margin, 2);
            he.backgroundColor = AppMainColor;
            [self addSubview:he];
        }
        
        UILabel * title  = [[UILabel alloc] init];
        title.text = [self.titles objectAtIndex:i];
        [self addSubview:title];
        title.textColor = [UIColor grayColor];
        title.font = kAdaptedFontSize(13);
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(head.mas_bottom).mas_offset(kAdaptedHeight(5));
            make.centerX.mas_equalTo(head.mas_centerX);
        }];
        
    }
}

@end
