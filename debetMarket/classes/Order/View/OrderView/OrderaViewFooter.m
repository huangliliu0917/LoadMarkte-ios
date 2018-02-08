//
//  OrderaViewFooter.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderaViewFooter.h"


@interface OrderaViewFooter ()


@property(nonatomic,strong) UIImageView * upCheck;

@property(nonatomic,strong) UILabel * upTitle;


@property(nonatomic,strong) UIImageView * downCheck;

@property(nonatomic,strong) UILabel * downTitle;


@property(nonatomic,strong) UIButton * btn;


@property(nonatomic,assign) int upStatus;

@property(nonatomic,assign) int downStatus;

@end



@implementation OrderaViewFooter


- (instancetype)init{
    if (self = [super init]) {
       
        self.upStatus = 0;
        self.downStatus = 0;
        
        
        
        self.upCheck = [[UIImageView alloc] init];
        self.upCheck.userInteractionEnabled = YES;
        [self addSubview:self.upCheck];
        self.upCheck.image = [UIImage imageNamed:@"orderCheckOut"];
        [self.upCheck mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.width.mas_equalTo(kAdaptedHeight(20));
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(10));
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
            
        }];
        
        __weak typeof(self) wself = self;
        [self.upCheck bk_whenTapped:^{
            if (wself.upStatus) {
                wself.upStatus = 0;
                self.upCheck.image = [UIImage imageNamed:@"orderCheckOut"];
                wself.btn.userInteractionEnabled = NO;
                //[UIColor colorWithHexString:@"#20BEFD"]
                [self.btn setBackgroundColor:LWColor(222, 221, 223)];
            }else{
                wself.upStatus = 1;
                if (wself.upStatus && wself.downStatus) {
                    wself.btn.userInteractionEnabled = YES;
                    [wself.btn setBackgroundColor:AppMainColor];
                }
                self.upCheck.image = [UIImage imageNamed:@"orderCheckOn"];
            }
        }];
        
        
        self.upTitle = [[UILabel alloc] init];
        self.upTitle.font = kAdaptedFontSize(15);
        NSString *str = @"我同意 个人征信查询授权";
        //创建NSMutableAttributedString
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:str];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(4, 8)];
        [self addSubview:self.upTitle];
        self.upTitle.attributedText = attrStr;
        [self.upTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.upCheck.mas_right).mas_offset(kAdaptedWidth(10));
            make.centerY.mas_equalTo(self.upCheck.mas_centerY);
        }];
        
        self.upTitle.userInteractionEnabled = YES;
        [self.upTitle bk_whenTapped:^{
            
           AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            PushWebViewController * pa = [[PushWebViewController alloc] init];
            pa.funUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"creditAuthUrl"];
            [app.currentVC.navigationController pushViewController:pa animated:YES];
        }];
        
        
        self.downCheck = [[UIImageView alloc] init];
        self.downCheck.userInteractionEnabled = YES;
        [self addSubview:self.downCheck];
        self.downCheck.image = [UIImage imageNamed:@"orderCheckOut"];
        [self.downCheck mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(kAdaptedHeight(20));
            make.top.mas_equalTo(self.upCheck.mas_bottom).mas_offset(kAdaptedHeight(10));
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
        }];
        [self.downCheck bk_whenTapped:^{
            if (wself.downStatus) {
                wself.downStatus = 0;
                self.downCheck.image = [UIImage imageNamed:@"orderCheckOut"];
                wself.btn.userInteractionEnabled = NO;
                [self.btn setBackgroundColor:LWColor(222, 221, 223)];
            }else{
                wself.downStatus = 1;
                self.downCheck.image = [UIImage imageNamed:@"orderCheckOn"];
                if (wself.upStatus && wself.downStatus) {
                    wself.btn.userInteractionEnabled = YES;
                    [wself.btn setBackgroundColor:AppMainColor];
                }
            }
        }];
        
        
        self.downTitle = [[UILabel alloc] init];
        [self addSubview:self.downTitle];
        self.downTitle.font = kAdaptedFontSize(15);
        self.downTitle.text = @"本人承诺 本人查询已获得信用主体授权，授权相关的一切法律后果由本人自行承担";
        self.downTitle.numberOfLines = 2;
        [self.downTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downCheck.mas_right).mas_offset(kAdaptedWidth(10));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
            make.top.mas_equalTo(self.downCheck.mas_top);
        }];
        
        
        self.btn = [[UIButton alloc] init];
        [self.btn setBackgroundColor:LWColor(242, 241, 243)];
        self.btn.userInteractionEnabled = NO;
        [self addSubview:self.btn];
        self.btn.layer.cornerRadius = 5;
        self.btn.layer.masksToBounds = YES;
        [self.btn addTarget:self action:@selector(lijiPayup) forControlEvents:UIControlEventTouchUpInside];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(20));
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-20));
            make.top.mas_equalTo(self.downTitle.mas_bottom).mas_offset(kAdaptedHeight(30));
            make.height.mas_equalTo(44);
        }];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)lijiPayup{
    
    [self.delegate lijizhifu:self.upStatus andDownStatus:self.downStatus];
   
}

- (void)setOrder:(PayInfo *)order{
    _order = order;
    [self.btn setTitle:[NSString stringWithFormat:@"立即支付%@元",order.surplusAmount] forState:UIControlStateNormal];
}

@end
