//
//  MineViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeadView.h"
#import "MineFooterView.h"
#import "ShareInfoModel.h"
#import<Photos/Photos.h>


@interface MineViewController ()<MineFooterViewDelegate,MineHeadViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>



@property (strong, nonatomic) MineHeadView * headView;

@property (strong, nonatomic) MineFooterView * mineFooterView;

@property(nonatomic,strong) NSArray * titleArray;

@property(nonatomic,strong) NSArray * imageArray;

@property(nonatomic,assign) int packageType;


@property(nonatomic,strong) ShareInfoModel * shareInfo;


/**
 相册
 */
@property(nonatomic,strong) UIImagePickerController *pickerController;



@end

@implementation MineViewController


- (UIImagePickerController *)pickerController{
    
    if (_pickerController == nil) {
        //初始化pickerController
        _pickerController = [[UIImagePickerController alloc] init];
        _pickerController.view.backgroundColor = [UIColor orangeColor];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = YES;
    }
    return _pickerController;
}



- (NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = self.packageType == 1 ? @[@"贷款进度查询",@"关于我们",@"设置"] : @[@"关于我们",@"设置"];
    }
    return _titleArray;
}

- (NSArray *)imageArray{
    if (_imageArray == nil) {
//        if (self.) {
//            <#statements#>
//        }
        _imageArray = self.packageType == 1 ? @[@"pdkjd",@"pgywm",@"psz"] : @[@"pgywm",@"psz"];
    }
    return _imageArray;
}



- (MineHeadView *)headView{
    if (_headView == nil) {
        _headView = [[MineHeadView alloc] init];
        _headView.delegate = self;
    }
    return _headView;
}


- (MineFooterView *)mineFooterView{
    if (_mineFooterView == nil) {
        _mineFooterView = [[MineFooterView alloc] init];
    }
    return _mineFooterView;
}


//获取个人中心数据
- (void)getUserCenterData{
    
    [HTNetworkingTool HTNetworkingToolPost:@"user/center" parame:nil isHud:NO success:^(id json) {
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            ;
            [self.headView setInit:[[[json objectForKey:@"data"] objectForKey:@"certifiedCount"] intValue] andUn:[[[json objectForKey:@"data"] objectForKey:@"unverifiedCount"] intValue]];
        }
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
    self.headView.usermodel = usermodel;
    
    if (usermodel) {
        [self getUserCenterData];
        [self getShareInfo];
    }else{
       [self.headView setInit:0 andUn:0];
    }
}

// 获取用户信息
- (void)getShareInfo{
    [HTNetworkingTool HTNetworkingToolPost:@"sys/getInviteShareConfig" parame:nil isHud:NO success:^(id json) {
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            ;
            ShareInfoModel * model = [ShareInfoModel mj_objectWithKeyValues:json[@"data"]];
            self.shareInfo = model;
        }
        LWLog(@"%@",json);
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人中心";
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    self.packageType = delegate.packageType;
    
    
    self.tableView.backgroundColor = LWColor(232, 233, 234);
    self.tableView.rowHeight = 50;
    self.headView.frame = CGRectMake(0, kNavigationBar_HEIGHT, KScreenWidth, kAdaptedHeight(160));
    self.headView.backgroundColor = AppMainColor;
    self.tableView.tableHeaderView = self.headView;
    

    self.mineFooterView.frame = CGRectMake(0, 0, KScreenWidth, 66);
    self.tableView.tableFooterView =  self.mineFooterView;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mineCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineCell"];
        cell.imageView.bounds = CGRectMake(0, 0, 30, 30);
        cell.textLabel.font = kAdaptedFontSize(16);
    }
    cell.imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}





//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        if (self.packageType == 1) {
//            return 44;
//        }else{
//            return 0;
//        }
//    }else{
//        return 44;
//    }
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * a = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    a.backgroundColor = LWColor(248, 247, 248);
    return a;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.packageType) {
        if (indexPath.row == 0) {
            PushWebViewController * pa = [[PushWebViewController alloc] init];
            pa.funUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"loanProjectProcessUrl"];
            [self.navigationController pushViewController:pa animated:YES];
        }else if (indexPath.row == 1) {
            PushWebViewController * pa = [[PushWebViewController alloc] init];
            pa.funUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"aboutUrl"];
            [self.navigationController pushViewController:pa animated:YES];
        }else{
            SettingViewController * setVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
            [self.navigationController pushViewController:setVC animated:YES];
        }
    }else{
        if (indexPath.row == 0) {
            PushWebViewController * pa = [[PushWebViewController alloc] init];
            pa.funUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"aboutUrl"];
            [self.navigationController pushViewController:pa animated:YES];
        }else{
            SettingViewController * setVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
            [self.navigationController pushViewController:setVC animated:YES];
        }
        
    }
    
}


- (void)mineHeadOptionClick:(int)tag{
    LWLog(@"bottomClick%d",tag);
    UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
    if(tag == 0 && usermodel){
        [self iconViewClick];
    }else if (tag == 2  || tag == 3) {
        CustomSlideViewController * vc = [[CustomSlideViewController alloc] init];
        vc.type = tag - 2;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
        UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
        if (!usermodel) {
            LoginViewController * uer = [[LoginViewController alloc] init];
            HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:uer];
            [self presentViewController:nav animated:YES completion:nil];
        }
        
    }
}
//底部按钮点击
- (void)bottomClick{
    
    UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
    if (!usermodel) {
        LoginViewController * uer = [[LoginViewController alloc] init];
        HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:uer];
        [self presentViewController:nav animated:YES completion:nil];
    }else{
        
        [[HTTool HTToolShare] HTToolToTurnShare:self andShareImage:self.shareInfo.icon andShareTitle:self.shareInfo.title andDes:self.shareInfo.description andShareUrl:self.shareInfo.url];
    }
    
    
    
    LWLog(@"bottomClick");
}
/**
 * 登录成功通知
 **/
- (void)LOginViewResult:(HTViewController *)vc{
//    UserInfo * user =  (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
//    _loginNameLable.text = [user.account copy];
//    LWLog(@"xxxxx%@",[user mj_keyValues]);
}

/**
 权限获取
 */
- (void)showQuanXian{
    
    [[HTTool HTToolShare] showAlertWithController:self andTitle:@"提示" andMessage:@"请在设置-->隐私-->相机，中开启本应用的相机访问权限！！" conform:^{
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url];
            
        }
    } cancle:^{
        
    }];
    
}


//点击头像上传
- (void)iconViewClick{
    
    
    //     UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",@"图库", nil];
    
    
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:@"选择头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * act0 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AVAuthorizationStatus authStatus =  [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
        {
            [self showQuanXian];
        }else{
            [self makePhoto:UIImagePickerControllerSourceTypeCamera];
        }
        
    }];
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            
            [self makePhoto:UIImagePickerControllerSourceTypePhotoLibrary];
        }else{
            [self showQuanXian];
        }
        
        
    }];
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            
            [self makePhoto:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            //[self choosePicture];
        }else{
            [self showQuanXian];
        }
        
        
    }];
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [aler addAction:act0];
    [aler addAction:act1];
    [aler addAction:act2];
    [aler addAction:act3];
    [self presentViewController:aler animated:YES completion:nil];
}

//跳转到imagePicker里
- (void)makePhoto:(UIImagePickerControllerSourceType) type
{
    self.pickerController.sourceType = type;
    [self presentViewController:self.pickerController animated:YES completion:nil];
}

//用户取消退出picker时候调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self.pickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//用户选中图片之后的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    LWLog(@"%@",info);
    UIImage * userHead = [info objectForKey:UIImagePickerControllerEditedImage];
    LWLog(@"%@",userHead);
    __weak typeof(self) wself = self;
    [self.pickerController dismissViewControllerAnimated:YES completion:^{
        [wself.headView setHeadImage:userHead];
        [wself uploadIconViewImageView:userHead];
    }];
    
}

- (void)uploadIconViewImageView:(UIImage *)image{
    
    NSArray * images = @[[[HTTool HTToolShare] scaleImage:image sclae:0.5]];
    //NSArray * array = @[image];
    [HTNetworkingTool HTNetworkingToolPostFile:@"user/img" parame:nil andImages:images andImageParameName:@"file" success:^(id json) {
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        LWLog(@"%@",json);
        if (base.resultCode == 2000) {
            
            UserInfo * usermodel = (UserInfo *)[[HTTool HTToolShare] HTToolUnArchiveObject:@"UserInfo"];
            usermodel.headimg = [json objectForKey:@"data"];
            [[HTTool HTToolShare] HTToolArchiveRootObject:usermodel withPath:@"UserInfo"];
            [SVProgressHUD showSuccessWithStatus:@"头像上传成功"];
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        
    }];
//    [HTNetworkingTool HTNetworkingToolPostFile:ApiUpLoadImage parame:nil  andImages:images andImageParameName:@"img" success:^(id json) {
//
//        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
//        if (base.resultCode == InterfaceSuccess) {
//            [SVProgressHUD showSuccessWithStatus:base.resultMsg];
//        }else{
//            [SVProgressHUD showErrorWithStatus:base.resultMsg];
//        }
//        LWLog(@"%@",json);
//    } failure:^(NSError *error) {
//        LWLog(@"%@",[error description]);
//    }];
    
}

@end
