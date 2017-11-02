//
//  LoginViewController.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/24.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTViewController.h"


@protocol LoginViewControllerDelegate <NSObject>

- (void)LOginViewResult:(HTViewController *)vc;

@end



@interface LoginViewController : HTViewController

@property(nonatomic,weak) id <LoginViewControllerDelegate> delegate;

@end
