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

@interface ListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *bannerCollectionView;
@property (nonatomic, strong) TestView * test;
@end


@implementation ListTableViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//
//        [self.contentView addSubview:self.bannerCollectionView];
//
//        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(self.contentView.mas_top);
//            make.left.equalTo(self.contentView.mas_left);
//            make.right.equalTo(self.contentView.mas_right);
//            make.bottom.equalTo(self.contentView.mas_bottom);
//        }];
//    }
//
//    return self;
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        TestView * test = [[TestView alloc] init];
        self.test = test;
        [self.contentView addSubview:test];
        
        [self.test mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.top.equalTo(self.contentView.mas_top);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
      
    }
    
    return self;
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
