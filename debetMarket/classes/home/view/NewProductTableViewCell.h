//
//  NewProductTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CateGoryModel.h"
@interface NewProductTableViewCell : UICollectionViewCell


@property(nonatomic,strong)  CateGoryModel * data;

@property(nonatomic,strong)  HomeListModel * model;
@end
