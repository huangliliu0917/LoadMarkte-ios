//
//  HTCommon.h
//  debetMarket
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#ifndef HTCommon_h
#define HTCommon_h

#ifdef DEBUG
#define LWLog(...) NSLog(__VA_ARGS__)
#else
#define LWLog(...)
#endif



#define AppName @"过海征信"

/**火图商户号*/
#define AppMerchantId @"1"
/**火图m yao*/
#define HTSecretKey @"4165a8d240b29af3f41818d10599d0d1"

/**版本更新store*/
#define AppleID  @"1346399726"


#define appScheme @"com.guohai.xiaodaimarket"


#define HTDebetAppId @""
#define HTDebetSecret @""

#define WeChatAPPID @"wx7010c1a3be4abf0f"
#define WeChatAppSecret @"bd0d599bbdda4690cd82089aeac5273f"

/**数据魔盒*/
#define partner_code @"yxcx_mohe"
#define partner_key @"2354830cd4f24b99812927f78874085d"




//1、获得RGB颜色
#define LWColor(r, g, b) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//2、获得RGB颜色
#define RGB_HEX(rgbValue, a) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((CGFloat)(rgbValue & 0xFF)) / 255.0 alpha:(a)]

//2、APP主题色
#define AppMainColor LWColor(245, 88, 84)

//3 App版本
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#define UUIDString @"1232313123"

//4 iOS 系统版本
#define osVersion [[UIDevice currentDevice] systemVersion]

//4 AppLogo
#define AppIconName [[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]

//5 弱指针
#define LWWeakSelf(type)  __weak typeof(type) weak##type = type;

// 1、屏幕高度
#define KScreenHeight  [UIScreen mainScreen].bounds.size.height
// 1、屏幕宽度
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width

#define kNavigationBar_HEIGHT ((KScreenHeight == 812.0) ? 88 : 64)
#define kStatusBar_Height  20
#define KScreenWidthRatio  (KScreenWidth / 375.0)
#define kScreenHeightRatio (((KScreenHeight == 812 ? 667 : KScreenHeight) - 64) / 603.0)
#define kAdaptedWidth(x)  ceilf((x) * KScreenWidthRatio)
#define kAdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define kAdaptedFontSize(R)  kCHINESE_SYSTEM(kAdaptedWidth(R))
#define kCHINESE_SYSTEM(x) [UIFont systemFontOfSize:x]



#define KeyedArchive(s) ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:(s)])


#define InterfaceSuccess 2000

//2、获取验证码接口
#define verificationInterface @"sendVerifyCode"
//2、手机登陆接口
#define LoginInterface @"user/login"

#endif /* HTCommon_h */
