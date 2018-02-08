//
//  MineTopview.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^HTHeadImageBlock)();

typedef void(^HTHeadLoginBlock)();


@interface MineTopview : UIView

@property (nonatomic,strong) UserInfo * usermodel;


@property(nonatomic,copy) HTHeadImageBlock block;

@property(nonatomic,copy) HTHeadLoginBlock loginBlock;

- (void)setHeadImage:(UIImage *)iconView;

@end
