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

- (instancetype)init{
    if (self = [super init]) {
        
        [self setupInit];
        self.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}


- (void)setupInit{
    
    CGFloat margin = kAdaptedHeight(5.0);
    CGFloat with = (KScreenWidth  - 5 * margin) / 4;
    CGFloat height = with;
    
    for (int i  = 0; i < 11; i++) {
        NewProductTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"NewProductTableViewCell" owner:nil options:nil] lastObject];
        cell.tag = i;
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
    
    NewProductTableViewCell * cell  = [self.itemArrays lastObject];
    
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
    
     [self mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(cell.mas_bottom);
     }];
}

@end
