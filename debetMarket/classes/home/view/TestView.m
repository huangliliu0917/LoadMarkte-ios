//
//  TestView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "TestView.h"
#import "NewProductTableViewCell.h"


@interface TestView()

@property(nonatomic,strong) UIImageView * imagetest;

@property(nonatomic,strong) UILabel * imagetestxx;


@property(nonatomic,strong) NSMutableArray * itemArrays;

@end


@implementation TestView


- (NSMutableArray *)itemArrays{
    if (_itemArrays == nil) {
        _itemArrays = [NSMutableArray array];
    }
    return _itemArrays;
}

- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray <HomeListModel *>*)data{
    
    if (self = [super initWithFrame:frame]) {
        
        self.dataArray  = data;
        [self setupInit];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)itemClick:(UITapGestureRecognizer * )tap{
    if ([self.delegate respondsToSelector:@selector(TestViewClick:)]) {
        [self.delegate TestViewClick:[self.dataArray objectAtIndex:tap.view.tag]];
    }
}

- (void)setupInit{
    
    CGFloat margin = 5.0;
    CGFloat with = (KScreenWidth  - 5 * margin) / 4;
    CGFloat height = with;
    
    LWLog(@"%lu",(unsigned long)self.dataArray.count);
    
    
    for (int i  = 0; i < self.dataArray.count; i++) {
        NewProductTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"NewProductTableViewCell" owner:nil options:nil] lastObject];
        cell.tag = i;
        cell.userInteractionEnabled = YES;
        cell.tag = i;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick:)];
        [cell addGestureRecognizer:ges];
        
        int col = i % 4;
        int row = i / 4;
        cell.frame = CGRectMake((margin + with) * col + margin, (margin + height) * row + margin, with, height);
        [self addSubview:cell];
        [self.itemArrays addObject:cell];
    }
    
//    for (int i = 0; i < 10; i++) {
//        NewProductTableViewCell * cell =
//
//    }
    
//    NewProductTableViewCell * cell  = [self.itemArrays lastObject];
    
//    UIImageView * imageview = [[UIImageView alloc] init];
//    self.imagetest = imageview;
//    [self addSubview:imageview];
//    imageview.backgroundColor = [UIColor blueColor];
//    [self.imagetest mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(cell.mas_bottom).offset(margin);
//        make.left.equalTo(self.mas_left);
//        make.right.equalTo(self.mas_right);
//        make.height.mas_equalTo(kAdaptedHeight(100));
//    }];
//
//    UILabel * lable  = [[UILabel alloc] init];
//    self.imagetestxx = lable;
//    [self addSubview:lable];
//    lable.text = @"test";
//    lable.backgroundColor = [UIColor redColor];
//    [self.imagetestxx mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(self.imagetest.mas_bottom);
//        make.left.equalTo(self.imagetest.mas_left);
//        make.right.equalTo(self.imagetest.mas_right);
//        make.height.mas_equalTo(kAdaptedHeight(20));
//    }];
    
//     [self mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.bottom.equalTo(cell.mas_bottom);
//     }];
}

@end
