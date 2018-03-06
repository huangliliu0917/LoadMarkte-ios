//
//  HTTabBarController.m
//  debetMarket
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTTabBarController.h"
#import "HomeViewController.h"
#import "BianBaoHomeViewController.h"

@interface HTTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,strong) NSArray * titleArray;

@property(nonatomic,strong) NSArray * imageNameArray;


@property (nonatomic,assign) int packageType;

@end

@implementation HTTabBarController

- (NSArray *)titleArray{
    if (_titleArray == nil) {
        AppDelegate * de = (AppDelegate *) [UIApplication sharedApplication].delegate;
        if(de.packageType){
           _titleArray = @[@"首页",@"贷款",@"订单",@"我的"];
        }else{
           _titleArray = @[@"首页",@"订单",@"我的"];
        }
        
    }
    return _titleArray;
}

- (NSArray *)imageNameArray{
    if (_imageNameArray == nil) {
        AppDelegate * de = (AppDelegate *) [UIApplication sharedApplication].delegate;
        if(de.packageType){
            _imageNameArray = @[@"home",@"dk",@"dd",@"gr",];
        }else{
            _imageNameArray = @[@"home",@"dd",@"gr",];
        }
        
        
    }
    return _imageNameArray;
}


- (void)goOrderList{
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    if(delegate.packageType == 0){
        self.selectedIndex = 1 ;
    }else{
       self.selectedIndex = 2 ;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate * de = (AppDelegate *) [UIApplication sharedApplication].delegate;
    self.packageType = de.packageType;
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goOrderList) name:@"goOrderList" object:nil];
    
    if (self.packageType) {
        for (int i = 0; i < self.titleArray.count; i++) {
            UIViewController * vc ;
            if (i == 0) {
                vc = [[HomeViewController alloc] init];
            }else if ( i == 1){
                vc  = [[DebetTableViewController alloc] initWithStyle:UITableViewStylePlain];
            }else if(i == 2){
                vc = [[OrderTableViewController alloc] initWithStyle:UITableViewStylePlain];
            }else {
                vc = [[MineViewController alloc] initWithStyle:UITableViewStylePlain];
            }
            //添加子控制器
            [self addOneChlildVc:vc title:[self.titleArray objectAtIndex:i]  imageName:[self.imageNameArray objectAtIndex:i] selectedImageName:[NSString stringWithFormat:@"%@_hight",[self.imageNameArray objectAtIndex:i]]];
        }
    }else{
        for (int i = 0; i < self.titleArray.count; i++) {
            UIViewController * vc ;
            if (i == 0) {
                vc = [[BianBaoHomeViewController alloc] init];
            }else if(i == 1){
                vc = [[OrderTableViewController alloc] initWithStyle:UITableViewStylePlain];
            }else {
                vc = [[MineViewController alloc] initWithStyle:UITableViewStylePlain];
            }
            //添加子控制器
            [self addOneChlildVc:vc title:[self.titleArray objectAtIndex:i]  imageName:[self.imageNameArray objectAtIndex:i] selectedImageName:[NSString stringWithFormat:@"%@_hight",[self.imageNameArray objectAtIndex:i]]];
        }
        
    }
    
    self.delegate = self;
    
    [self.tabBar setTintColor:AppMainColor];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    
    // 设置图标
    childVc.tabBarItem.image = [[HTTool HTToolShare] imageWithOriginal:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [[HTTool HTToolShare] imageWithOriginal:selectedImageName];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    
    childVc.tabBarItem.title = title;
    
    //调整tabbarItem  图片的位置
    //    [childVc.tabBarItem setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    
    // 添加为tabbar控制器的子控制器
    HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"订单"]) {
        
        UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
        if (!usermodel) {
            LoginViewController * uer = [[LoginViewController alloc] init];
            HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:uer];
            [self presentViewController:nav animated:YES completion:nil];
           return NO;
        }else{
           return YES;
        }
        
    }else{
        return YES;
    }

}

@end
