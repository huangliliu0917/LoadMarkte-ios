//
//  HeiMinCellTableViewCell.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeiMinCellTableViewCell : UITableViewCell


@property (nonatomic,strong) NSString * placeHoder;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@property (weak, nonatomic) IBOutlet UITextField *HeiMingTextField;

@end
