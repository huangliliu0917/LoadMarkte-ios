//
//  AppTableViewCell.m
//  debetMarket
//
//  Created by 罗海波 on 2017/11/2.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "AppTableViewCell.h"
#import "AppListView.h"
#import <Masonry/Masonry.h>
@interface AppTableViewCell()

@property(nonatomic,strong) NSArray * titleArray;
@property(nonatomic,strong) NSArray * imagesArray;

@property(nonatomic,strong) UIView * containerView;
@end
@implementation AppTableViewCell

- (NSArray *)titleArray{
    
    if (_titleArray == nil) {
        _titleArray = @[@"基本信息",@"身份信息",@"工作信息",@"运营商验证",@"电商验证",@"授权征信查询",@"联系人信息"];
    }
    
    return _titleArray;
}


- (NSArray *)imagesArray{
    if (_imagesArray == nil) {
        _imagesArray = @[@"jbxx",@"sfxx",@"gzxx",@"sjyz",@"dsyz",@"zxcx",@"lxrxx"];
    }
    return _imagesArray;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(HomeListModel *)model{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 创建一个装载九宫格的容器
        _containerView = [[UIView alloc] init];
        [self.contentView addSubview:_containerView];
        
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        NSArray * app =  [model.applicationMaterial componentsSeparatedByString:@","];
        for (int i = 0; i < app.count; i++) {
            AppListView *view = [[AppListView alloc] init];
//            view.backgroundColor = [UIColor randomColor];
            [_containerView addSubview:view];
        }
       
        //水平方向控件间隔固定等间隔
        [_containerView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:10 tailSpacing:10];
//        [_containerView.subviews makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(50);
//            make.height.equalTo(70);
//        }];
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
