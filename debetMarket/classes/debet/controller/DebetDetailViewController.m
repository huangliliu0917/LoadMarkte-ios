//
//  DebetDetailViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "DebetDetailViewController.h"

@interface DebetDetailViewController ()

/**图像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/**标签*/
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
/**标签1*/
@property (weak, nonatomic) IBOutlet UILabel *firstLable;
/**标签2*/
@property (weak, nonatomic) IBOutlet UILabel *secondLable;
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

@end

@implementation DebetDetailViewController



- (void)setupInit{
    
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
    
    self.nameLable.font = kAdaptedFontSize(18);
    self.firstLable.font = kAdaptedFontSize(16);
    self.secondLable.font = kAdaptedFontSize(16);

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
    
  
    [self setupInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
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

@end
