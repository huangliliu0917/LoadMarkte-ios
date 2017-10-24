//
//  BackView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "BackView.h"
#import "LoginView.h"

@interface BackView()

@property(nonatomic,strong) LoginView * loginView;
@end

@implementation BackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//+ (instancetype)BackViewCreate{
//   BackView * backView =  [[self alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//   backView.backgroundColor = [UIColor blackColor];
//   backView.alpha = 0.4;
//   return backView;
//}




- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor blackColor];
        
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit{
    
    CGFloat with =  kAdaptedWidth(320);
    CGFloat height = kAdaptedHeight(220);

    LoginView * back = [[LoginView alloc] init];
    _loginView = back;
    back.backgroundColor = [UIColor whiteColor];
    back.center = CGPointMake(KScreenWidth * 0.5, KScreenHeight * 0.5);
    back.bounds = CGRectMake(0, 0, with, height);
    [self addSubview:back];
}

@end
