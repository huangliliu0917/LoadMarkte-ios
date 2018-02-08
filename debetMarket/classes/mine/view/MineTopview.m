//
//  MineTopview.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MineTopview.h"
#import <UIImageView+WebCache.h>
@interface MineTopview ()

@property(nonatomic,strong) UIImageView * iconView;

@property(nonatomic,strong) UILabel * nameLable;


@end

@implementation MineTopview

- (instancetype)init{
    
    if (self = [super init]) {
        
        _iconView = [[UIImageView alloc] init];
        [self addSubview:self.iconView];
        _iconView.image = [UIImage imageNamed:@"MoRen"];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kAdaptedWidth(20));
            make.width.height.mas_equalTo(kAdaptedHeight(60));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        self.iconView.layer.cornerRadius = kAdaptedHeight(60) * 0.5;
        self.iconView.layer.masksToBounds = YES;
        self.iconView.backgroundColor = [UIColor whiteColor];
        //LWWeakSelf(self);
        self.iconView.userInteractionEnabled = YES;
        __weak typeof(self) wself = self;
        [self.iconView bk_whenTapped:^{
            if (wself.block) {
                wself.block();
            }
        }];
        
        _nameLable = [[UILabel alloc] init];
        _nameLable.text = @"未登录";
        _nameLable.font = kAdaptedFontSize(18);
        _nameLable.textColor = [UIColor whiteColor];
        [self addSubview:self.nameLable];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10));
            make.centerY.mas_equalTo(self.iconView.mas_centerY);
        }];
        _nameLable.userInteractionEnabled = YES;
        [_nameLable bk_whenTapped:^{
            if (wself.loginBlock) {
                wself.loginBlock();
            }
        }];
        
    }
    return self;
    
}

- (void)setUsermodel:(UserInfo *)usermodel{
    _usermodel = usermodel;
    
    if (usermodel.userName.length) {
        self.nameLable.text = usermodel.userName;
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:usermodel.headimg] placeholderImage:[UIImage imageNamed:@"MoRen"]];
    }else{
        self.nameLable.text = @"未登录";
    }
    
}

- (void)setHeadImage:(UIImage *)iconView{
    self.iconView.image = iconView;
}

@end
