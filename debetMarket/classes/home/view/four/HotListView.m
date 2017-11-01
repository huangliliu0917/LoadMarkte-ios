//
//  HotListView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/30.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HotListView.h"
#import "UIImageView+WebCache.h"

@interface HotListView()


@property(nonatomic,strong) UIImageView *  iconView;
@property(nonatomic,strong) UILabel *  titleLable;
@property(nonatomic,strong) UILabel *  fuLbale;
@end


@implementation HotListView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self= [super initWithFrame:frame]) {
        
        
//        self.backgroundColor = [UIColor orangeColor];
      
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.height - 10, frame.size.height - 10)];
        _iconView.contentMode = UIViewContentModeScaleAspectFit ;
        [self addSubview:_iconView];
        
       
        
        _titleLable = [[UILabel alloc] init];
        [self addSubview:_titleLable];
        _titleLable.font = kAdaptedFontSize(15);
        _titleLable.frame = CGRectMake(CGRectGetMaxX(_iconView.frame) + 5, 10, frame.size.width - (CGRectGetMaxX(_iconView.frame) + 5), 20);
        
        
        _fuLbale = [[UILabel alloc] init];
        [self addSubview:_fuLbale];
        _fuLbale.font = kAdaptedFontSize(13);
        _fuLbale.textColor = [UIColor lightGrayColor];
        _fuLbale.frame = CGRectMake(CGRectGetMaxX(_iconView.frame) + 5, CGRectGetMaxY(_titleLable.frame) + 5, frame.size.width - (CGRectGetMaxX(_iconView.frame) + 5), 20);
        
    }
    
    return self;
    
}

- (void)setModel:(HomeListModel *)model{
    _model = model;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:nil];
    _titleLable.text = model.name;
    
    NSString * rate;
    if([model.deadlineUnit intValue] == 0){
        rate = @"日利率";
    }else if([model.deadlineUnit intValue] == 1){
        rate = @"月利率";
    }else{
        rate = @"年利率";
    }
    _fuLbale.text = [NSString stringWithFormat:@"%@ %@ %%",rate,model.interestRate];
    // 0 日利率 1 月利率  2 年利率
    
    
    [self layoutSubviews];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(kAdaptedHeight(2));
//        make.left.equalTo(self.mas_left).offset(kAdaptedWidth(2));
//        make.width.mas_equalTo(_iconView.mas_height);
//        make.bottom.equalTo(self.mas_bottom).offset(kAdaptedHeight(2));
//
//    }];
//
//    _titleLable = [[UILabel alloc] init];
//    [self addSubview:_titleLable];
//    _titleLable.font = kAdaptedFontSize(15);
//    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_iconView.mas_top).mas_offset(kAdaptedHeight(2));
//        make.left.mas_equalTo(_iconView.mas_right).mas_offset(kAdaptedWidth(5));
//    }];
//
//    _fuLbale = [[UILabel alloc] init];
//    [self addSubview:_fuLbale];
//    _fuLbale.font = kAdaptedFontSize(13);
//    _fuLbale.textColor = [UIColor lightGrayColor];
//    [_fuLbale mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(3);
//        make.left.mas_equalTo(_titleLable.mas_left);
//    }];
}

@end
