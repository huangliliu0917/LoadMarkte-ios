//
//  AppTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2017/11/2.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppTableViewCell : UITableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(HomeListModel *)model;

@end
