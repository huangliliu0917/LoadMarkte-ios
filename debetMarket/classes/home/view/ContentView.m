//
//  ContentView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ContentView.h"
#import "ListTableViewCell.h"
#import "NewProductTitle.h"

@interface ContentView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableView;

@end

@implementation ContentView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self initSetUp];
    }
    
    return self;
}


- (void)initSetUp{
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [self addSubview:tableView];
    //[self.tableView registerClass:[ContentView class] forCellReuseIdentifier:@"xx"];
   // [self.tableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"ss"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
}



- (void)setHomeListData:(HomeListModel *)homeListData{
    _homeListData = homeListData;
    [self.tableView reloadData];
}


//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
       CenterViewCell * cell =  (CenterViewCell *)[[CenterViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xx"];
        HomeListModel * h = [[HomeListModel alloc] init];
        cell.homeListData = h;
        return cell;
    }else{
        ListTableViewCell * list = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ss"];
        return list;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return kAdaptedHeight(44);
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 111;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        HotPublish * hot = [HotPublish HotPublishViewCreate];
        hot.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(50));
        return hot;
    }else{
        NewProductTitle * view = [[NewProductTitle alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
//        view.backgroundColor = [UIColor blackColor];
        return view;
        
    }
    
    
}

@end
