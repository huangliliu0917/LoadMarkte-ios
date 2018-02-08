//
//  ChaXunList.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ChaXunList.h"


@interface ChaXunList ()

@property(nonatomic,strong) UIImageView * iconView;


@property(nonatomic,strong) UILabel * nameLable;

@property(nonatomic,strong) UILabel * downLable;


@property(nonatomic,strong) UIImageView * arrayView;


@end



@implementation ChaXunList

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.iconView = [[UIImageView alloc] init];
        [self addSubview:self.iconView];
        self.iconView.image = [UIImage imageNamed:@"hy"];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(20));
            make.width.height.mas_equalTo(kAdaptedHeight(40));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
    
        self.nameLable = [[UILabel alloc] init];
        self.nameLable.text = @"行业黑名单";
        self.nameLable.textColor = [UIColor whiteColor];
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10));
            make.top.mas_equalTo(self.iconView.mas_top).mas_offset(kAdaptedWidth(1));
        }];
        
        self.downLable = [[UILabel alloc] init];
        self.downLable.text = @"点击查询";
        self.downLable.textColor = [UIColor whiteColor];
        self.downLable.font = kAdaptedFontSize(13);
        [self addSubview:self.downLable];
        [self.downLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10));
            make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(kAdaptedWidth(5));
        }];
        
        
        
        self.arrayView = [[UIImageView alloc] init];
        [self addSubview:self.arrayView];
        self.arrayView.image = [UIImage imageNamed:@"hyArray"];
        [self.arrayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(kAdaptedHeight(20));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-20));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
    }
    return self;
}


- (void)setType:(int)type{
    _type = type;
    
    LWLog(@"%d----%d",type,self.cate);
    if (self.cate == 0) {
        if (type == 0) {
            self.nameLable.text = @"行业黑名单";
        }else{
            self.nameLable.text = @"金融黑名单";
        }
    }else if(self.cate == 1){
        if (type == 0) {
            
        }else{
            
        }
    }else{
        if (type == 0) {
            self.nameLable.text = @"淘宝入口";
            self.iconView.image = [UIImage imageNamed:@"tb"];
        }else{
            self.nameLable.text = @"京东入口";
            self.iconView.image = [UIImage imageNamed:@"jd"];
        }
    }
}
@end
