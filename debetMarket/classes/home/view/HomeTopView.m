//
//  HomeTopView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HomeTopView.h"
#import <UIView+BlocksKit.h>
@interface HomeTopView ()


@property (weak, nonatomic) IBOutlet UIView *firstView;

@property (weak, nonatomic) IBOutlet UILabel *firstLable;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@property (weak, nonatomic) IBOutlet UILabel *secondLable;
@property (weak, nonatomic) IBOutlet UIView *thirdView;

@property (weak, nonatomic) IBOutlet UILabel *thirdLable;

@end

@implementation HomeTopView


- (void)awakeFromNib{
    [super awakeFromNib];
    self.firstLable.font = kAdaptedFontSize(14);
    self.secondLable.font = kAdaptedFontSize(14);
    self.thirdLable.font = kAdaptedFontSize(14);
    

//    homeTopView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(180));
//    self.homeTopView = homeTopView;
//    [self.view addSubview:homeTopView];
    //
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(180));
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[UIColor colorWithRed:0 green:143/255.0 blue:234/255.0 alpha:1.0].CGColor,
//                       (id)[UIColor colorWithRed:0 green:173/255.0 blue:234/255.0 alpha:1.0].CGColor,
//                       (id)[UIColor whiteColor].CGColor, nil];
//    [self.layer addSublayer:gradient];
    
    
    self.firstView.userInteractionEnabled = YES;
    
    [self.firstView bk_whenTapped:^{
        if ([self.delegate respondsToSelector:@selector(HomeTopView:)]) {
            [self.delegate HomeTopView:0];
        }
    }];
    self.secondView.userInteractionEnabled = YES;
    [self.secondView bk_whenTapped:^{
        if ([self.delegate respondsToSelector:@selector(HomeTopView:)]) {
            [self.delegate HomeTopView:1];
        }
    }];
    self.thirdView.userInteractionEnabled = YES;
    [self.thirdView bk_whenTapped:^{
        if ([self.delegate respondsToSelector:@selector(HomeTopView:)]) {
            [self.delegate HomeTopView:2];
        }
    }];
}

+ (instancetype)HomeTopViewFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeTopView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
