//
//  HeadIconView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HeadIconView.h"
#import "NewProductTableViewCell.h"

@interface HeadIconView()
@property(nonatomic,strong) NSMutableArray * itemArray;
@end


@implementation HeadIconView

- (NSMutableArray *)itemArray{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self setupInit];
        
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    
    [self setupInit];
    
//    for (int i  = 0; i < 6; i++) {
//        NewProductTableViewCell * cell = [self.itemArray objectAtIndex:i];
//        cell.data = [dataArray objectAtIndex:i];
//
//    }
    
}

/**
 * 分类点击
 */
- (void)cateGray:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(HeadIconClick:)]) {
        [self.delegate HeadIconClick:[self.dataArray objectAtIndex:tap.view.tag]];
    }
}

- (void)setupInit{
    CGFloat with = (KScreenWidth - 25) * 0.25;
    CGFloat height = with;
    CGFloat margin = 5;
    for (int i  = 0; i < self.dataArray.count; i++) {
        NewProductTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"NewProductTableViewCell" owner:nil options:nil] lastObject];
        cell.tag = i;
        int col = i % 4;
        int row = i / 4;
        cell.frame = CGRectMake((margin + with) * col + margin , (margin + height) * row + margin, with, height);
        [self.itemArray addObject:cell];
        cell.data = [self.dataArray objectAtIndex:i];
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cateGray:)];
        cell.userInteractionEnabled = YES;
        [cell addGestureRecognizer:ges];
        [self addSubview:cell];
        
    }
   NewProductTableViewCell * cell = [self.itemArray lastObject];
    
    CGRect fram = self.frame;
    fram.size.height = CGRectGetMaxY(cell.frame) + 5;
 
}


- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
