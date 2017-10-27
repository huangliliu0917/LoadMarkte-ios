//
//  DebetTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "DebetTableViewController.h"
#import "HeadIconView.h"
#import "ContentTableViewCell.h"
#import "DebetDetailViewController.h"

@interface DebetTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) HeadIconView * head;

@property(nonatomic,strong) UITableView * content;

@end

@implementation DebetTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
    [HTNetworkingTool HTNetworkingToolPost:@"project/category" parame:nil success:^(id json) {
        
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
    
    
    
    self.navigationItem.title = @"贷款";
    self.head = [[HeadIconView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth * 0.5)];
    self.tableView.tableHeaderView = self.head;
//    self.head.backgroundColor = LWColor(236, 36, 43);
    //[self.view addSubview:self.head];
    
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"productCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //.content  = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.head.frame), KScreenWidth, KScreenHeight - CGRectGetMaxY(self.head.frame)) style:UITableViewStylePlain];
    //self.content.dataSource = self;
    //self.content.delegate = self;
    //self.content.estimatedRowHeight = 100;
    //self.content.rowHeight = UITableViewAutomaticDimension;
    //[self.content registerNib:[UINib nibWithNibName:@"ContentTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"productCell"];
    //self.content.tableFooterView = [[UIView alloc] init];
//    self.content.contentInset = UIEdgeInsetsMake(kAdaptedHeight(15), 0, 0, 0);
    //self.content.backgroundColor = [UIColor lightGrayColor];
    //[self.view addSubview:self.content];
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}



//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return KScreenHeight * 0.25;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//
//    HeadIconView * head = [[HeadIconView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight * 0.25)];
//    head.backgroundColor = [UIColor redColor];
//    return head;
//
//
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ContentTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    if (cell == nil) {
        cell = (ContentTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"ContentTableViewCell" owner:nil options:nil] lastObject];
    }
    

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DebetDetailViewController * debetDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DebetDetailViewController"];
    [self.navigationController pushViewController:debetDetailViewController animated:YES];
}
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
