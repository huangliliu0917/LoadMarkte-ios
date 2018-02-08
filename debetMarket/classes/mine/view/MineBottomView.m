//
//  MineBottomView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MineBottomView.h"


@interface MineBottomView()

//已认证
@property(nonatomic,strong) UILabel * yiRenZhengLable;
//描述
@property(nonatomic,strong) UILabel * yiTitleLable;


//未认证
@property(nonatomic,strong) UILabel * weiRenZhengLable;
//描述
@property(nonatomic,strong) UILabel * weiTitleLable;
//分割线
@property(nonatomic,strong) UIView * slider;


@end



@implementation MineBottomView

- (instancetype)init{
    if (self = [super init]) {
    
        
        self.userInteractionEnabled = YES;
        
        
        _slider = [[UILabel alloc] init];
        _slider.backgroundColor = [UIColor blackColor];
        [self addSubview:self.slider];
        [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-kAdaptedHeight(10));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.width.mas_equalTo(.8);
        }];
        
        
        
        
        _yiRenZhengLable = [[UILabel alloc] init];
        _yiRenZhengLable.text = @"0";
        _yiRenZhengLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.yiRenZhengLable];
        [self.yiRenZhengLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.slider.mas_left);
            make.bottom.mas_equalTo(self.mas_centerY);
        }];
        self.yiRenZhengLable.userInteractionEnabled = YES;
        __weak typeof(self) wself = self;
        [_yiTitleLable bk_whenTapped:^{
            if ([wself.delegate respondsToSelector:@selector(mineBottomViewClick:)]) {
                [wself.delegate mineBottomViewClick:0];
            }
        }];
        
        _yiTitleLable = [[UILabel alloc] init];
        _yiTitleLable.text = @"已认证（人）";
        _yiTitleLable.font = kAdaptedFontSize(14);
        _yiTitleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.yiTitleLable];
        self.yiTitleLable.userInteractionEnabled = YES;
        [self.yiTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.slider.mas_left);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        [_yiTitleLable bk_whenTapped:^{
            if ([wself.delegate respondsToSelector:@selector(mineBottomViewClick:)]) {
                [wself.delegate mineBottomViewClick:0];
            }
        }];
        
        
        
        _weiRenZhengLable = [[UILabel alloc] init];
        _weiRenZhengLable.text = @"0";
        [self addSubview:self.weiRenZhengLable];
        _weiRenZhengLable.textAlignment = NSTextAlignmentCenter;
        self.weiRenZhengLable.userInteractionEnabled = YES;
        [self.weiRenZhengLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.left.mas_equalTo(self.slider.mas_right);
            make.right.mas_equalTo(self.mas_right);
            make.bottom.mas_equalTo(self.mas_centerY);
        }];
        [_weiRenZhengLable bk_whenTapped:^{
            if ([wself.delegate respondsToSelector:@selector(mineBottomViewClick:)]) {
                [wself.delegate mineBottomViewClick:1];
            }
        }];
        
        
        _weiTitleLable = [[UILabel alloc] init];
        _weiTitleLable.font = kAdaptedFontSize(14);
        [self addSubview:self.weiTitleLable];
        _weiTitleLable.text = @"未认证（人）";
        self.weiTitleLable.userInteractionEnabled = YES;
        _weiTitleLable.textAlignment = NSTextAlignmentCenter;
        [self.weiTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(self.slider.mas_right);
            make.right.mas_equalTo(self.mas_right);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        [_weiTitleLable bk_whenTapped:^{
            if ([wself.delegate respondsToSelector:@selector(mineBottomViewClick:)]) {
                [wself.delegate mineBottomViewClick:1];
            }
        }];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setInit:(int)certifiedCount andUn:(int)unverifiedCount{
    
    self.yiRenZhengLable.text = [NSString stringWithFormat:@"%d",certifiedCount];
    self.weiRenZhengLable.text = [NSString stringWithFormat:@"%d",unverifiedCount];
}

@end
