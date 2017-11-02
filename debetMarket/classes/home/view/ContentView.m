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

@interface ContentView()<UITableViewDelegate,UITableViewDataSource,FourListTableViewCellDelegate
,ListTableViewCellDelegate>

@property(nonatomic,strong) UITableView * tableView;

@end

@implementation ContentView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self initSetUp];
    }
    
    return self;
}


- (void)initSetUp{
    
    ;
    NSLog(@"%@",NSStringFromCGRect(self.frame));
//    UITableView * tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.backgroundColor = [UIColor orangeColor];
    
//    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [self addSubview:tableView];
//    [self.tableView registerNib:[UINib nibWithNibName:@"FourListTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourListTableViewCell"];
//    [self.tableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"ss"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {

//        make.edges.equalTo(self);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.tableView.frame = self.frame;
}

- (void)ContentViewSetDate:(NSArray *)hotProjectList and:(NSArray *)NewListS{
    _hotProjectList = hotProjectList;
    _NewListS = NewListS;
    [self.tableView reloadData];
}

////section底部间距
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
       return self.hotProjectList.count ? 1 : 0;
    }else{
       return self.NewListS.count ? 1 : 0;
    }
    
}

- (void)FourListTableViewCellClick:(HomeListModel *)model{
    
//    LWLog(@"%@", [model mj_keyValues]);
    [self.delegate ContentViewDelegate:model];
    
}



- (void)ListTableViewCellClick:(HomeListModel *)model{
    LWLog(@"%@", [model mj_keyValues]);

    [self.delegate ContentViewDelegate:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        FourListTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"xx"];
        if (cell == nil) {
            cell = [[FourListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xx" WithData:self.hotProjectList];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }else{
        ListTableViewCell * list = [tableView dequeueReusableCellWithIdentifier:@"ss"];

        if (list == nil) {
            list = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ss" WithData:self.NewListS];
        }
        list.selectionStyle = UITableViewCellSelectionStyleNone;
        list.delegate = self;
        return list;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return kAdaptedHeight(44);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 143;
    }else{
      return  (KScreenWidth / 4.0 + 10) * (self.NewListS.count / 4);
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        HotPublish * hot = [HotPublish HotPublishViewCreate];
        hot.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(50));
        return hot;
    }else{
        NewProductTitle * view = [[NewProductTitle alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,  kAdaptedHeight(50))];
//        view.backgroundColor = [UIColor blackColor];
        return view;
        
    }
    
    
}

@end
