//
//  FourListTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/30.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "FourListTableViewCell.h"
#import "NewProductTableViewCell.h"
@interface FourListTableViewCell()


@property(nonatomic,strong) NSMutableArray * dataArray;

@property(nonatomic,strong) NSMutableArray * cellArray;

@property(nonatomic,strong) UIView * BgView;
@end

@implementation FourListTableViewCell


- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (NSMutableArray *)cellArray{
    
    if (_cellArray == nil) {
        
        _cellArray = [NSMutableArray array];
    }
    
    return _cellArray;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray <HomeListModel *>*)data{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.datas = data;
        if (data.count) {
            [self.dataArray removeAllObjects];
            [self.cellArray removeAllObjects];
            [self.dataArray addObjectsFromArray:data];
            [self setUpInit];
        }
        
    }
    return self;
}

- (void)hotClick:(UITapGestureRecognizer *)tap{
    
    LWLog(@"%ld",tap.view.tag);
    if ([self.delegate respondsToSelector:@selector(FourListTableViewCellClick:)]) {
        HomeListModel * model = [self.dataArray objectAtIndex:tap.view.tag];
        [self.delegate FourListTableViewCellClick:model];
    }
}


- (void)setUpInit{
    
//    int col = 2;
//    int row = 2;
    
//    UIView * BgView =  [[UIView alloc] init];
//    BgView.userInteractionEnabled = YES;
//    self.BgView = BgView;
//    BgView.backgroundColor = [UIColor redColor];
//    [self addSubview:BgView];
    
    CGFloat margin = 5;
    CGFloat with = (KScreenWidth - 5 * 3)* 0.5;
    CGFloat height = (143 - 15) * 0.5;
    NSInteger index = self.dataArray.count > 4 ? 4: self.dataArray.count;
    for (int i = 0; i < index; i++) {
        int col = i % 2;
        int row = i / 2;
        CGFloat x = (with + margin) * col + margin;
        CGFloat y = (height + margin) * row + margin;
        
        HomeListModel * model = [self.dataArray objectAtIndex:i];
        
        LWLog(@"%@",[model mj_keyValues]);
        
        HotListView * cell = [[HotListView alloc] initWithFrame:CGRectMake(x, y, with, height)];
        cell.model = model;
        cell.tag = i;
        cell.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * get =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotClick:)];
        [cell addGestureRecognizer:get];
        
        [self.cellArray addObject:cell];
        
        [self.contentView addSubview:cell];
//        cell.backgroundColor = [UIColor orangeColor];
       
        
    }
//    HotListView * cell = [self.cellArray lastObject];
//    [BgView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.edges.equalTo(self.contentView);
//        make.bottom.equalTo(cell.mas_bottom);
//    }];
//    HotListView * cell = (HotListView *)[self.cellArray lastObject];
//
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.bottom.equalTo(self.contentView.mas_bottom);
//    }];
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}
@end
