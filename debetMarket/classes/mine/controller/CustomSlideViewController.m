//
//  CustomSlideViewController.m
//  bameng
//
//  Created by lhb on 16/11/21.
//  Copyright © 2016年 HT. All rights reserved.
//

#import "CustomSlideViewController.h"
//#import "OrderListTableViewController.h"
#import "XTSegmentControl.h"


#define pageSize 10

/**选择时候的颜色*/
#define COLOR_BACK_SELECTED [UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:1]


@interface CustomSlideViewController ()<UIScrollViewDelegate> //PYSearchViewControllerDelegate


/***/
@property(nonatomic,strong) UIScrollView * scrollView;


/**选项卡列表*/
@property(nonatomic,strong) NSArray< NSString *> * titleArray;


/**控制器选择*/
@property (nonatomic ,strong) XTSegmentControl *segmentControl;



@end


@implementation CustomSlideViewController



- (NSArray<NSString *> *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"已认证",@"未认证"];
    }
    return _titleArray;
}



- (void)setupChildViewControllers
{
    for(int i = 0 ; i < self.titleArray.count; i++){
        RenZhengTableViewController * homeViewController = [[RenZhengTableViewController alloc] initWithStyle:UITableViewStylePlain];
        if (i == 0) {
            homeViewController.type = 1;
        }
        [self addChildViewController:homeViewController];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    LWLog(@"xxxx%@",[self class]);
    

    
    
    
    self.navigationItem.title = @"认证";

    
    
    [self setupChildViewControllers];
    
//    [self setUpInit];
    
     [self setupTitlesView];
    
    
    [self setupScrollView];
    
   
    
    [self addChildVcView];
    

    

}






#pragma mark - 添加子控制器的view
- (void)addChildVcView
{
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / KScreenWidth;
    
    // 取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}



- (void)setupTitlesView
{

    
    
    self.segmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 40) Items:self.titleArray selectedBlock:^(NSInteger index) {
        
       //[self selectCurrentOption:index];
    }];
    //self.segmentControl
    
    [self.view addSubview:self.segmentControl];
    
    
}



- (void)setupScrollView
{
    
    
    // 不允许自动调整scrollView的内边距
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.segmentControl.frame), KScreenWidth, KScreenHeight - CGRectGetMaxY(self.segmentControl.frame))];
//    scrollView.backgroundColor = [UIColor redColor];
//    scrollView.frame = self.view.bounds;
    //    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    // 添加所有子控制器的view到scrollView中
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.frame.size.width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    //    self.scrollView.backgroundColor = [UIColor orangeColor];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
//    appDelegate.current = self;
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}





#pragma mark titleHeadOption

- (void)selectCurrentOption:(NSInteger) index{
    
    // 让UIScrollView滚动到对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = index * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark - <UIScrollViewDelegate>

//- (void)scrollviewend:(UIScrollView *)scrollView{
//
//
//    if (scrollView.contentOffset.x <  0) {
//        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
//        }];
//    }
//}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
       // HomeTitleButton *titleButton = self.titleView.subviews[index];
//[self.titleView titleClick:titleButton];
    
    [self.segmentControl selectIndex:index];
    // 添加子控制器的view
    [self addChildVcView];
    
    // 当index == 0时, viewWithTag:方法返回的就是self.titlesView
    //    XMGTitleButton *titleButton = (XMGTitleButton *)[self.titlesView viewWithTag:index];
}


@end
