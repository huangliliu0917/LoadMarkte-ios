//
//  HeiMingDanFootView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HeiMingDanFootView.h"
@interface HeiMingDanFootView ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * headTitle;

@property (nonatomic,strong) UIView * sliderView;

@property (nonatomic,strong) UILabel * optionTitle1;

@property (nonatomic,strong) UILabel * optionTitle2;

@property (nonatomic,strong) UILabel * optionTitle3;

@property (nonatomic,strong) UIButton * btn;


@end


@implementation HeiMingDanFootView

- (instancetype)init{
    if (self = [super init]) {
        
        self.iconView = [[UIImageView alloc] init];
        [self addSubview:self.iconView];
        self.iconView.image = [UIImage imageNamed:@"option"];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(kAdaptedHeight(20));
            make.left.mas_equalTo(self.mas_left).mas_equalTo(kAdaptedWidth(15));
            make.top.mas_equalTo(self.mas_top).mas_equalTo(kAdaptedWidth(10));
        }];
        
        self.headTitle = [[UILabel alloc] init];
        self.headTitle.text = @"查询介绍";
        self.headTitle.font = kAdaptedFontSize(15);
        [self addSubview:self.headTitle];
        [self.headTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(kAdaptedWidth(10));
            make.centerY.mas_equalTo(self.iconView.mas_centerY);
        }];
        
        
        self.sliderView = [[UIView alloc] init];
        self.sliderView.backgroundColor = LWColor(242, 242, 241);
        [self addSubview:self.sliderView];
        [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedHeight(10));
            make.height.mas_equalTo(.5);
        }];
        
        
        self.optionTitle1 = [[UILabel alloc] init];
        self.optionTitle1.text = @"1、匹配5家第三方数据公司的金融风险名单库";
        self.optionTitle1.font = kAdaptedFontSize(13);
        [self addSubview:self.optionTitle1];
        [self.optionTitle1 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.mas_left).mas_equalTo(kAdaptedWidth(15));
            make.top.mas_equalTo(self.sliderView.mas_bottom).mas_offset(kAdaptedHeight(10));
           
        }];
        
        
        
        self.optionTitle2 = [[UILabel alloc] init];
        [self addSubview:self.optionTitle2];
        self.optionTitle2.font = kAdaptedFontSize(13);
        self.optionTitle2.text = @"2、检测身份证号、手机号在互联网上记录的不良名单";
        [self.optionTitle2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_equalTo(kAdaptedWidth(15));
            make.top.mas_equalTo(self.optionTitle1.mas_bottom).mas_offset(kAdaptedHeight(10));
        }];
        
        
        
        self.optionTitle3 = [[UILabel alloc] init];
        [self addSubview:self.optionTitle3];
        self.optionTitle3.font = kAdaptedFontSize(13);
        self.optionTitle3.text = @"3、检测其它风险项";
        [self.optionTitle3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_equalTo(kAdaptedWidth(15));
            make.top.mas_equalTo(self.optionTitle2.mas_bottom).mas_offset(kAdaptedHeight(10));
        }];
        
        
        self.btn = [[UIButton alloc] init];
        [self.btn addTarget:self.superview action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
        self.btn.layer.cornerRadius = 5;
        self.btn.layer.masksToBounds = YES;
        self.btn.backgroundColor = [UIColor redColor];
        [self.btn setTitle:@"下一步" forState:UIControlStateNormal];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(self.mas_left).mas_equalTo(kAdaptedWidth(20));
           make.right.mas_equalTo(self.mas_right).mas_equalTo(kAdaptedWidth(-20));
            make.top.mas_equalTo(self.optionTitle3.mas_bottom).mas_offset(kAdaptedHeight(10));
            make.height.mas_equalTo(44);
        }];
        self.userInteractionEnabled = YES;
        
        
    }
    return self;
}



@end
