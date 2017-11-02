//
//  LoginViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/24.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
@interface LoginViewController ()<LoginViewDelegate>
@property(nonatomic,strong) LoginView * loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    [self setUpInit];
}

- (void)setUpInit{
    
    CGFloat with =  kAdaptedWidth(320);
    CGFloat height = kAdaptedHeight(220);
    
    LoginView * back = [[LoginView alloc] init];
    self.loginView = back;
    back.delegate = self;
    back.backgroundColor = [UIColor whiteColor];
    back.frame = CGRectMake((KScreenWidth - with) * 0.5, (KScreenHeight - height) * 0.5, with, height);
    back.bounds = CGRectMake(0, 0, with, height);
    [self.view addSubview:back];
    
    
}

- (void)LoginViewClick:(int)type andPhone:(NSString *)phoneNumber andVerCode:(NSString *)code{
    
    [self.view removeFromSuperview];
    
}

- (void)LOginViewResult:(HTViewController *)vc{
    
    
    LWLog(@"xxxxx");
    [UIView animateWithDuration:1 animations:^{
        [self.view removeFromSuperview];
        [self.delegate LOginViewResult:self];
    }];
    LWLog(@"xxxxx");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
