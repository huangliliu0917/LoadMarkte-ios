//
//  ZhengXingHeadView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ZhengXingHeadView.h"

@interface ZhengXingHeadView ()

@property (nonatomic,strong) UIImageView * iconView;

@property (nonatomic,strong) UILabel * nameLable;

@property (nonatomic,strong) UILabel * titleLable;


@property (nonatomic,strong) UIImageView * titleIcon;


@property (nonatomic,strong) UILabel * titleDes;


@end


@implementation ZhengXingHeadView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.iconView = [[UIImageView alloc] init];
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(kAdaptedWidth(50));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(20));
        }];
        
        self.nameLable = [[UILabel alloc] init];
        self.nameLable.text = @"10000";
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_offset(kAdaptedHeight(20));
        }];
        
        
        self.titleLable = [[UILabel alloc] init];
        self.titleLable.text = @"贷款额度（元）";
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(kAdaptedHeight(5));
        }];
        
        
        self.titleIcon = [[UIImageView alloc] init];
        [self addSubview:self.titleIcon];
        [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(kAdaptedHeight(5));
            make.height.width.mas_equalTo(kAdaptedHeight(5));
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
        }];
        
        
        
        self.titleDes = [[UILabel alloc] init];
        self.titleDes.text = @"贷款额度是根据用户的各项信用指标综合评定结果，仅供参考整体信用情况及贷款额度范围";
        [self addSubview:self.titleDes];
        [self.titleDes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(kAdaptedHeight(5));
            make.left.mas_equalTo(self.titleIcon.mas_right);
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-20));
        }];
        
        
    }
    return self;
}

@end
