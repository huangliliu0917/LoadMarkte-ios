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
        [self setupInit];
        
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



- (void)setupInit{
    CGFloat with = (KScreenWidth) * 0.25;
    CGFloat height = with;
    
    for (int i  = 0; i < 8; i++) {
        NewProductTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"NewProductTableViewCell" owner:nil options:nil] lastObject];
        cell.tag = i;
        int col = i % 4;
        int row = i / 4;
        cell.frame = CGRectMake(with * col , height * row, with, height);
        [self.itemArray addObject:cell];
        [self addSubview:cell];
        
    }
 
}
@end
