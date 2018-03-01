//
//  HotListScrowTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/8.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HotListScrowTableViewCell.h"
#import "HorizontalPageFlowlayout.h"

@interface HotListScrowTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * contenScrollView;


@property (nonatomic,strong) NSArray * dataArray;


@end


@implementation HotListScrowTableViewCell


- (UICollectionView *)contenScrollView{
    if(_contenScrollView == nil){
        
        CGFloat with = (KScreenWidth - 5 * 3)* 0.5;
        CGFloat height = (143 - 15) * 0.5;
        
        HorizontalPageFlowlayout *fl = [[HorizontalPageFlowlayout alloc] initWithRowCount:2 itemCountPerRow:2];
        [fl setColumnSpacing:10 rowSpacing:15 edgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        //fl.itemSize = CGSizeMake(with, height);
        //UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
        fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        fl.minimumInteritemSpacing = 0;
        fl.minimumLineSpacing = 0;
        //fl.itemSize = CGSizeMake(with, height);
        _contenScrollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 143) collectionViewLayout:fl];
        _contenScrollView.dataSource = self;
        _contenScrollView.delegate = self;
        _contenScrollView.bounces = YES;
        _contenScrollView.pagingEnabled = YES;
        [_contenScrollView registerClass:[HotListView class] forCellWithReuseIdentifier:@"HotListView"];
        _contenScrollView.backgroundColor = [UIColor whiteColor];
        
    }
    return _contenScrollView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray <HomeListModel *>*)data{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.dataArray = data;
        [self.contentView addSubview:self.contenScrollView];
    
        self.contenScrollView.frame = CGRectMake(0, 0, KScreenWidth, 143);
        self.contenScrollView.contentSize = CGSizeMake((self.dataArray.count / 4 + 1) * KScreenWidth, 143);
        
        //[self setUpInit];
    }
    return self;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//
//    return self.dataArray.count / 4 + 1;
//}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HotListView * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotListView" forIndexPath:indexPath];
    HomeListModel * model = [self.dataArray objectAtIndex:indexPath.row];
    cell.model = model;
    //cell.backgroundColor = [UIColor redColor];
    return cell;
//    HotListView * cell = (HotListView *)[collectionView dequeueReusableCellWithReuseIdentifier:@"xxxindexPath"] forIndexPath:indexPath];
//    //MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
//
//    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
//
//    cell.backgroundColor = [UIColor yellowColor];
   
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.delegate HotItemClick:[self.dataArray objectAtIndex:indexPath.row]];
}

//- (void)setUpInit{
//
//    //    int col = 2;
//    //    int row = 2;
//
//    //    UIView * BgView =  [[UIView alloc] init];
//    //    BgView.userInteractionEnabled = YES;
//    //    self.BgView = BgView;
//    //    BgView.backgroundColor = [UIColor redColor];
//    //    [self addSubview:BgView];
//
//    CGFloat margin = 5;
//    CGFloat with = (KScreenWidth - 5 * 3)* 0.5;
//    CGFloat height = (143 - 15) * 0.5;
//    NSInteger index = self.dataArray.count ;
//    for (int i = 0; i < index; i++) {
//        int col = i % 2;
//        int row = i / 2;
//        CGFloat x = (with + margin) * col + margin + (i / 4) * KScreenWidth ;
//        CGFloat y = (height + margin) * row + margin;
//
//        HomeListModel * model = [self.dataArray objectAtIndex:i];
//
//        LWLog(@"%@",[model mj_keyValues]);
//
        //HotListView * cell = [[HotListView alloc] initWithFrame:CGRectMake(x, y, with, height)];
//        cell.model = model;
//        cell.tag = i;
//        cell.userInteractionEnabled = YES;
//        cell.backgroundColor = [UIColor redColor];
//        UITapGestureRecognizer * get =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotClick:)];
//        [cell addGestureRecognizer:get];
//
//        //[self.cellArray addObject:cell];
//
//        [self.contenScrollView addSubview:cell];
//        //        cell.backgroundColor = [UIColor orangeColor];
//    }
//
//}
@end
