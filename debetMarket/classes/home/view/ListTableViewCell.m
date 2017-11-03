//
//  ListTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ListTableViewCell.h"
#import "NewProductTableViewCell.h"
#import "TestView.h"

@interface ListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,TestViewDelegate>
@property (nonatomic, strong) UICollectionView *bannerCollectionView;
@property (nonatomic, strong) TestView * test;

/**最新产品列表*/
@property (nonatomic, strong) NSArray * dataArray;


@property(nonatomic,strong) NSMutableArray * itemArrays;
@end


@implementation ListTableViewCell

- (NSMutableArray *)itemArrays{
    if (_itemArrays == nil) {
        _itemArrays = [NSMutableArray array];
    }
    return _itemArrays;
}


//- (void)TestViewClick:(HomeListModel *)model{
//    if ([self.delegate respondsToSelector:@selector(ListTableViewCellClick:)]) {
//        [self.delegate ListTableViewCellClick:model];
//    }
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithData:(NSArray<HomeListModel *> *)data{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
//        self.backgroundColor = [UIColor clearColor];
//        CGFloat height =  ((data.count -1 / 4) + 1) * ((KScreenWidth  - 5 * 5) / 4);
//        TestView * test = [[TestView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, height) andData:data];
//        test.userInteractionEnabled = YES;
//        test.dataArray = data;
//        self.test = test;
//        [self.contentView addSubview:test];
//
        self.dataArray = data;
        
        CGFloat margin = 5.0;
        CGFloat with = (KScreenWidth  - 5 * margin) / 4;
        CGFloat height = with;
        
        for (int i  = 0; i < data.count; i++) {
            NewProductTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"NewProductTableViewCell" owner:nil options:nil] lastObject];
            cell.tag = i;
            cell.userInteractionEnabled = YES;
            cell.tag = i;
            UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick:)];
            [cell addGestureRecognizer:ges];
            cell.model = [self.dataArray objectAtIndex:i];
            int col = i % 4;
            int row = i / 4;
            cell.frame = CGRectMake((margin + with) * col + margin, (margin + height) * row + margin, with, height);
            [self addSubview:cell];
            [self.itemArrays addObject:cell];
        }

    }
    return self;
}


- (void)itemClick:(UITapGestureRecognizer *)tap{
    
   
    [self.delegate ListTableViewCellClick: [self.dataArray objectAtIndex:tap.view.tag] ];
    
    LWLog(@"xx");
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getter方法
- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.itemSize = CGSizeMake(KScreenWidth / 4.0, KScreenWidth / 4.0 + 10);
    }
    return _flowLayout;
}

- (UICollectionView *)bannerCollectionView {
    if (!_bannerCollectionView) {
        _bannerCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _bannerCollectionView.dataSource = self;
        _bannerCollectionView.delegate = self;
        _bannerCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_bannerCollectionView registerNib:[UINib nibWithNibName:@"NewProductTableViewCell" bundle:nil] forCellWithReuseIdentifier:@"banner"];
        _bannerCollectionView.pagingEnabled = YES;
        _bannerCollectionView.showsHorizontalScrollIndicator = NO;
        _bannerCollectionView.showsVerticalScrollIndicator = NO;
    }
    return _bannerCollectionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewProductTableViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"banner" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}
@end
