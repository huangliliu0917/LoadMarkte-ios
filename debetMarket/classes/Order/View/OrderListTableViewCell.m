//
//  OrderListTableViewCell.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/8.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "OrderListTableViewCell.h"

@interface headView ()
@property (nonatomic ,strong) UILabel * leftLable;
@property (nonatomic ,strong) UILabel * rightLable;


@end


@implementation headView
- (UILabel *)leftLable{
    if (!_leftLable) {
        _leftLable = [[UILabel alloc] init];
        _leftLable.textColor = [UIColor whiteColor];
        _leftLable.font = kAdaptedFontSize(13);
        _leftLable.numberOfLines = 1;
    }
    return _leftLable;
}

- (UILabel *)rightLable{
    if (!_rightLable) {
        _rightLable = [[UILabel alloc] init];
        _rightLable.textColor = [UIColor whiteColor];
        _rightLable.font = kAdaptedFontSize(13);
        _rightLable.numberOfLines = 1;
    }
    return _rightLable;
}
- (instancetype)init{
    if(self = [super init]){
        
//        self.backgroundColor = LWColor(234, 36, 43);
        [self addSubview:self.leftLable];
        self.leftLable.text = @"订单号: 201711081814";
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(kAdaptedWidth(14));
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(kAdaptedHeight(-10));
        }];
        
//        [self addSubview:self.rightLable];
//        self.rightLable.text = @"201711081814";
//        [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            //make.right.mas_equalTo(self.mas_right).offset(kAdaptedWidth(-10));
//            make.left.mas_equalTo(self.leftLable.mas_right).mas_offset(kAdaptedWidth(5));
//            make.top.mas_equalTo(self.leftLable.mas_top);
//            make.bottom.mas_equalTo(self.leftLable.mas_bottom);
//        }];
    }
    return self;
}


- (void)setOrderModel:(OrderModel *)orderModel{
    _orderModel = orderModel;
    
    self.leftLable.text = [NSString stringWithFormat:@"订单号: %@",orderModel.orderId];

}

@end



/**
 * 中间试图
 **/
@interface Center()


@property (nonatomic, strong) UIImageView * iconView;

// 手机
@property (nonatomic ,strong) UILabel * orderName;
//姓名
@property (nonatomic ,strong) UILabel * orderDesc;



@end

@implementation Center


- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode =  UIViewContentModeScaleAspectFit;
        _iconView.image = [UIImage imageNamed:@"order"];
    
    }
    return _iconView;
}

- (UILabel *)orderName{
    if (_orderName == nil) {
        _orderName = [[UILabel alloc] init];
        _orderName.font = kAdaptedFontSize(13);
        _orderName.numberOfLines = 1;
    }
    return _orderName;
}


- (UILabel *)orderDesc{
    if (_orderDesc == nil) {
        _orderDesc = [[UILabel alloc] init];
        _orderDesc.font = kAdaptedFontSize(13);
        _orderDesc.numberOfLines = 1;
    }
    return _orderDesc;
}





- (instancetype)init{
    if(self = [super init]){

        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(15));
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedWidth(10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(kAdaptedHeight(-15));
            make.height.width.mas_equalTo(kAdaptedHeight(50));
        }];
        

        
        [self addSubview:self.orderName];
        self.orderName.text = @"13857560740";
        [self.orderName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_offset(kAdaptedWidth(10)); //左
            make.bottom.mas_equalTo(self.iconView.mas_centerY);  //上
        }];
        
        
        [self addSubview:self.orderDesc];
        self.orderDesc.text = @"ssd";
        [self.orderDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.orderName.mas_left);
            make.top.mas_equalTo(self.orderName.mas_bottom);
            make.right.mas_equalTo(self.mas_right);
        }];
        
        //self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}



- (void)setOrderModel:(OrderModel *)orderModel{
    _orderModel = orderModel;
    

    if([orderModel.status intValue] == 2 && (orderModel.orderType == 3 || orderModel.orderType == 4)){
        self.orderName.text = [NSString stringWithFormat:@"%@(数据正在获取中,请稍后...)",orderModel.orderName];
    }else{
       self.orderName.text = orderModel.orderName;
    }
    self.orderDesc.text = orderModel.desc;
    
}


@end


@interface BottomView()

@property (nonatomic ,strong) UILabel * leftTimeLable;

@property (nonatomic ,strong) UILabel * rightStatusLable;


@end


@implementation BottomView



- (UILabel *)leftTimeLable{
    if (!_leftTimeLable) {
        _leftTimeLable = [[UILabel alloc] init];
        _leftTimeLable.textColor = LWColor(134, 133, 134);
        _leftTimeLable.font = kAdaptedFontSize(14);
        _leftTimeLable.numberOfLines = 1;
    }
    return _leftTimeLable;
}


- (UILabel *)rightStatusLable{
    if (!_rightStatusLable) {
        _rightStatusLable = [[UILabel alloc] init];
        _rightStatusLable.textColor = [UIColor redColor];
        _rightStatusLable.numberOfLines = 1;
        _rightStatusLable.font = kAdaptedFontSize(14);
    }
    return _rightStatusLable;
}

- (instancetype)init{
    
    if(self = [super init]){

        [self addSubview:self.leftTimeLable];
        self.leftTimeLable.text = @"出借时间:";
        
        [self.leftTimeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(kAdaptedHeight(10));
            make.top.mas_equalTo(self.mas_top).mas_offset(kAdaptedHeight(10));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(kAdaptedHeight(-10));
        }];
      
        [self addSubview:self.rightStatusLable];
        self.rightStatusLable.text = @"已完成";
        
        [self.rightStatusLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftTimeLable.mas_top);
            make.bottom.mas_equalTo(self.leftTimeLable.mas_bottom);
            make.right.mas_equalTo(self.mas_right).mas_offset(kAdaptedWidth(-10));
        }];
        
    }
    return self;
}


- (void)setOrderModel:(OrderModel *)orderModel{
    _orderModel = orderModel;
    
    self.leftTimeLable.text = orderModel.createTime;
    self.rightStatusLable.text = orderModel.statusName;
    
    if ([orderModel.status intValue] ==  1) {
        self.rightStatusLable.textColor = [UIColor redColor];
    }else{
        self.rightStatusLable.textColor = [UIColor lightGrayColor];
    }
}
@end





@interface OrderListTableViewCell()


@property(nonatomic,strong)headView * headView;

@property(nonatomic,strong)Center * centerView;

@property(nonatomic,strong)BottomView * bottomView;



@end


@implementation OrderListTableViewCell


- (Center *)centerView{
    if(_centerView == nil){
        _centerView = [[Center alloc] init];
        _centerView.backgroundColor = [UIColor whiteColor];
    }
    return _centerView;
    
}

- (headView *)headView{
    
    if(_headView == nil){
        _headView = [[headView alloc] init];
    }
    return _headView;
}

- (BottomView *)bottomView{
    if(_bottomView == nil){
        _bottomView = [[BottomView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self setupView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.backgroundColor = LWColor(239, 239, 239);
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.layer.cornerRadius = 5;
//        self.layer.masksToBounds = YES;
    }
    return self;
}


- (void)setupView{
    
    [self.contentView addSubview:self.headView];
    self.headView.backgroundColor = [UIColor redColor];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentView.mas_top);
    
    }];
    
    
    [self.contentView addSubview:self.centerView];
    LWLog(@"xxxxx");
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.headView.mas_bottom);
   
    }];
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.centerView.mas_bottom).mas_offset(1);

    }];
    
   
    
    
    
    UIView * black = [[UIView alloc] init];
    black.backgroundColor = LWColor(207, 206, 206);
    [self.contentView addSubview:black];
    [black mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.bottomView.mas_bottom);
        make.height.mas_equalTo(5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    self.backgroundColor = LWColor(237, 238, 239);
    
}


- (void)setOrderModel:(OrderModel *)orderModel{
    _orderModel = orderModel;
    
    self.headView.orderModel = orderModel;
    self.centerView.orderModel = orderModel;
    self.bottomView.orderModel = orderModel;
   
}


- (void)setFrame:(CGRect)frame{

    CGRect fm = frame;
    fm.origin.x = frame.origin.x + 5;
    fm.origin.y = frame.origin.y + 5;
    fm.size.width = frame.size.width - 10;
    fm.size.height = frame.size.height - 10;
    [super setFrame:fm];
}
@end

