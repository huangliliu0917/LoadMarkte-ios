//
//  MineHeadView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MineHeadView.h"
#import "MineTopview.h"
#import "MineBottomView.h"


@interface MineHeadView()<MineBottomViewDelegate>

@property(nonatomic,strong) MineTopview * mineTopView;

@property(nonatomic,strong) MineBottomView * mineBottomView;

@end


@implementation MineHeadView

- (void)setInit:(int)certifiedCount andUn:(int)unverifiedCount{
    
    [self.mineBottomView setInit:certifiedCount andUn:unverifiedCount];
    
}

- (MineTopview *)mineTopView{
    if (_mineTopView == nil) {
        _mineTopView = [[MineTopview alloc] init];
    }
    return _mineTopView;
}

- (MineBottomView *)mineBottomView{
    if (_mineBottomView == nil) {
        _mineBottomView = [[MineBottomView alloc] init];
    }
    return _mineBottomView;
}


- (void)setBottomNumberHidden{
    
    [self.mineTopView mas_updateConstraints:^(MASConstraintMaker *make) {
      make.height.mas_equalTo(self.mas_height).multipliedBy(1);
    }];
    
    [self.mineBottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_bottom);
    }];
    
}

- (instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.mineTopView];
        [self.mineTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.mas_top);
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.7);
        }];
        
        self.mineTopView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navColor"]];
        __weak typeof(self) wself = self;
        self.mineTopView.block = ^{
            LWLog(@"xxxxxxx");
            if ([wself.delegate respondsToSelector:@selector(mineHeadOptionClick:)]) {
                [wself.delegate mineHeadOptionClick:0];
            }
        };
        
        self.mineTopView.loginBlock = ^{
            LWLog(@"xxxxxxx");
            if ([wself.delegate respondsToSelector:@selector(mineHeadOptionClick:)]) {
                [wself.delegate mineHeadOptionClick:1];
            }
        };
        
        
        [self addSubview:self.mineBottomView];
        self.mineBottomView.delegate = self;
        [self.mineBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(self.mineTopView.mas_bottom);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

- (void)setUsermodel:(UserInfo *)usermodel{
    _usermodel = usermodel;
    self.mineTopView.usermodel = usermodel;
}

- (void)setHeadImage:(UIImage *)iconView{
    [self.mineTopView setHeadImage:iconView];
}

// 0 已认证   1 表示未认证
- (void) mineBottomViewClick:(int)option{
    
    if ([self.delegate respondsToSelector:@selector(mineHeadOptionClick:)]) {
        [self.delegate mineHeadOptionClick:option + 2];
    }
}
@end
