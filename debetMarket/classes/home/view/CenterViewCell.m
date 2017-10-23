//
//  CenterViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "CenterViewCell.h"


@interface CenterViewCell()

@property(nonatomic,strong) UIScrollView * scrollView;

@end


@implementation CenterViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIScrollView * scrollView = [[UIScrollView alloc] init];
        scrollView.backgroundColor = [UIColor redColor];
        _scrollView = scrollView;
        [self addSubview:scrollView];
        
    }
    return self;
}


- (void)setHomeListData:(HomeListModel *)homeListData{
    _homeListData = homeListData;
    _scrollView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(140));
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_scrollView.mas_bottom);
    }];
}
@end
