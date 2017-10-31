//
//  DebetDetailViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "DebetDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "HSGenderPickerVC.h"
#import "LoginViewController.h"

@interface DebetDetailViewController ()<HSGenderPickerVCDelegate>

/**图像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/**标签*/
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
/**标签1*/
@property (weak, nonatomic) IBOutlet UILabel *firstLable;
/**标签2*/
@property (weak, nonatomic) IBOutlet UILabel *secondLable;

/**标签3*/
@property (weak, nonatomic) IBOutlet UILabel *thirdLable;


/**贷款标签*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanLable;
/**贷款范围*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanMoney;
/**贷款范围右侧*/
@property (weak, nonatomic) IBOutlet UILabel *daikuanMoneyRight;
/**分期*/
@property (weak, nonatomic) IBOutlet UILabel *fenqiLable;
/**分期范围*/
@property (weak, nonatomic) IBOutlet UILabel *fenqifanwei;
/**分期天数*/
@property (weak, nonatomic) IBOutlet UILabel *fenqiDay;
/**每日应还钱*/
@property (weak, nonatomic) IBOutlet UILabel *dayBackMoneyLable;
/**每日应还钱标签*/
@property (weak, nonatomic) IBOutlet UILabel *dayBackMoneyTitleLable;
/**每日rate*/
@property (weak, nonatomic) IBOutlet UILabel *rateLable;
/**每日rate标签*/
@property (weak, nonatomic) IBOutlet UILabel *dayRateTitleLable;

/**最快放款时间*/
@property (weak, nonatomic) IBOutlet UILabel *fastDayLable;
/**最快放款时间标签*/
@property (weak, nonatomic) IBOutlet UILabel *fastDayLableTitle;

/**申请材料*/
@property (weak, nonatomic) IBOutlet UILabel *shengqinlable;
/**基本信息*/
@property (weak, nonatomic) IBOutlet UILabel *foutFirstLable;
/**身份信息*/
@property (weak, nonatomic) IBOutlet UILabel *fourSecondLable;
/**工作信息*/
@property (weak, nonatomic) IBOutlet UILabel *fourThreeLable;
/**运营商验证*/
@property (weak, nonatomic) IBOutlet UILabel *fourFourLable;
/**立即申请*/
@property (weak, nonatomic) IBOutlet UIButton *lijishengqing;



@property(nonatomic,strong) NSMutableArray * lableArray;

@property(nonatomic,strong) NSArray * moneyArray;
@property(nonatomic,strong) NSArray *dayArray;
@property(nonatomic,assign) int current;


@end

@implementation DebetDetailViewController

- (NSMutableArray *)lableArray{
    if (_lableArray == nil) {
        
        _lableArray = [NSMutableArray array];
    }
    return _lableArray;
}

- (void)setupInit{
    

    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
    
    self.nameLable.font = kAdaptedFontSize(18);
    self.firstLable.font = kAdaptedFontSize(16);
    self.secondLable.font = kAdaptedFontSize(16);
    self.thirdLable.font = kAdaptedFontSize(16);
    
//    self.firstLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
//    self.firstLable.layer.masksToBounds = YES;
//    self.firstLable.layer.borderWidth = .6;
//    self.firstLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
//
//    self.secondLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
//    self.secondLable.layer.masksToBounds = YES;
//    self.secondLable.layer.borderWidth = .6;
//    self.secondLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
//
//    self.thirdLable.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
//    self.thirdLable.layer.masksToBounds = YES;
//    self.thirdLable.layer.borderWidth = .6;
//    self.thirdLable.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    [self.lableArray addObject:self.firstLable];
    [self.lableArray addObject:self.secondLable];
    [self.lableArray addObject:self.thirdLable];

    self.daikuanLable.font = kAdaptedFontSize(18);
    self.daikuanMoney.font = kAdaptedFontSize(16);
    self.daikuanMoneyRight.font = kAdaptedFontSize(16);
    
    self.fenqiLable.font = kAdaptedFontSize(18);
    self.fenqifanwei.font = kAdaptedFontSize(16);
    self.fenqiDay.font = kAdaptedFontSize(16);
    

    self.dayBackMoneyLable.font = kAdaptedFontSize(18);
    self.dayBackMoneyTitleLable.font = kAdaptedFontSize(16);
  
    
    self.rateLable.font = kAdaptedFontSize(18);
    self.dayRateTitleLable.font = kAdaptedFontSize(16);
    

    self.fastDayLable.font = kAdaptedFontSize(18);
    self.fastDayLableTitle.font = kAdaptedFontSize(16);
    

    self.shengqinlable.font = kAdaptedFontSize(18);
    self.foutFirstLable.font = kAdaptedFontSize(18);
    self.fourSecondLable.font = kAdaptedFontSize(18);
    self.fourThreeLable.font = kAdaptedFontSize(18);
    self.fourFourLable.font = kAdaptedFontSize(18);


    self.lijishengqing.layer.cornerRadius = 5;
    self.lijishengqing.layer.masksToBounds = YES;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _model.name;
    
    UserInfo * unUserInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
  
    [self setupInit];
    
    NSMutableDictionary * parame  = [NSMutableDictionary dictionary];
    parame[@"projectId"] = self.model.loanId;
    parame[@"userId"] = unUserInfo == nil ? @(0) : unUserInfo.userId;
    LWLog(@"%@",parame);
    [HTNetworkingTool HTNetworkingToolPost:@"project/detail" parame:parame success:^(id json) {
        LWLog(@"%@",[json description]);
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            HomeListModel * model = [HomeListModel mj_objectWithKeyValues:[json objectForKey:@"data"]];
            [self setupInit:model];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
}

- (void)setupInit:(HomeListModel *)model{
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:nil options:SDWebImageProgressiveDownload];
    _nameLable.text = model.name;
    
    if (model.tag.length) {
        NSArray * tags = [model.tag componentsSeparatedByString:@","];
        NSInteger index = tags.count > 3 ? 3 : tags.count;
        for (int i = 0; i < index; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.text = [NSString stringWithFormat:@"  %@  ",[tags objectAtIndex:i]];
            title.layer.cornerRadius = self.firstLable.frame.size.height * 0.5;
            title.layer.masksToBounds = YES;
            title.layer.borderWidth = .6;
            title.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }
    }else{
        for (int i = 0; i < self.lableArray.count; i ++) {
            UILabel * title =  [self.lableArray objectAtIndex:i];
            title.text = nil;
        }
    }
    
    if (model.enableMoney.length) {
        NSArray * money =  [model.enableMoney componentsSeparatedByString:@","];
        self.moneyArray = [money copy];
        _daikuanMoney.text = [NSString stringWithFormat:@"%@ ~ %@元",[money firstObject],[money lastObject]];
    }else{
        _daikuanMoney.text = @"0 元";
    }
    
    if (model.deadline.length) {
        NSArray * money =  [model.deadline componentsSeparatedByString:@","];
        self.dayArray = [money copy];
        _fenqifanwei.text = [NSString stringWithFormat:@"%@ ~ %@天",[money firstObject],[money lastObject]];
    }else{
        _daikuanMoney.text = @"0 天";
    }
    
    // 0 日利率 1 月利率  2 年利率
    if([model.deadlineUnit intValue] == 0){
        _dayRateTitleLable.text = @"参考日利率";
    }else if([model.deadlineUnit intValue] == 1){
        _dayRateTitleLable.text = @"参考月利率";
    }else{
        _dayRateTitleLable.text = @"参考年利率";
    }
    _rateLable.text = [NSString stringWithFormat:@" %@ %%",model.interestRate];
    
    
    _fastDayLable.text = [NSString stringWithFormat:@"%@ 天",model.fastestGetTime];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            _current = 0;
            HSGenderPickerVC *vc = [[HSGenderPickerVC alloc] init];
            vc.titleUnit = @"请选择贷款金额(元)";
            vc.genderArray = [[NSArray alloc] initWithObjects:self.moneyArray, nil];
            vc.delegate = self;
            [self presentViewController:vc animated:YES completion:nil];
            
        }else if(indexPath.row == 1){
            _current = 1;
            HSGenderPickerVC *vc = [[HSGenderPickerVC alloc] init];
            vc.titleUnit = @"请选择分期时间(天)";
            vc.delegate = self;
            vc.genderArray = [[NSArray alloc] initWithObjects:self.dayArray, nil];
            [self presentViewController:vc animated:YES completion:nil];
            
        }
    }
    
    
}

-(void)genderPicker:(HSGenderPickerVC*)genderPicker
    selectedGernder:(NSString*)gender{
    
    if (_current == 0) {
        
        _daikuanMoneyRight.text = [NSString stringWithFormat:@"%@ 元",gender];
    }else{
        
        _fenqiDay.text =  [NSString stringWithFormat:@"%@ 天",gender];
    }
    LWLog(@"%@",gender);
    
}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)lijishengqing:(id)sender {
    UserInfo * unUserInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
    if (unUserInfo == nil) {
        LoginViewController * alet = [[LoginViewController alloc] init];
        [self.view.window addSubview:alet.view];
    }else{
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:self.model.applyUrl]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.model.applyUrl]];
        }
    }
}

@end
