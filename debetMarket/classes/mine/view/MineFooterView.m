//
//  MineFooterView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "MineFooterView.h"

@interface MineFooterView ()

@property(nonatomic,strong) UIButton * btn;

@end



@implementation MineFooterView


- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        _btn.backgroundColor = AppMainColor;
        _btn.layer.cornerRadius = 5;
        _btn.layer.masksToBounds = YES;
        _btn.titleLabel.font = kAdaptedFontSize(15);
        [_btn setTitle:@"邀请好友认证,查看他的征信" forState:UIControlStateNormal];
        [_btn addTarget:self.delegate action:@selector(bottomClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (instancetype)init{
    if (self = [super init]) {
        
        self.btn.frame = CGRectMake(20, 30, KScreenWidth - 40, 44);
        [self addSubview:self.btn];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setTheShareBtnHidden{
    
    self.btn.hidden = YES;
}

@end
