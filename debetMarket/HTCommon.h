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


#define MainIpAddress @"http://192.168.1.45:8080/rest/api/"

/**商户号*/
#define DebetCustomerId @"4421"
/**版本更新store*/
#define AppleID  @"1215556282"

#define HTDebetAppId @""
#define HTDebetSecret @""

// 1、获得RGB颜色
#define LWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 1、屏幕高度
#define KScreenHeight  [UIScreen mainScreen].bounds.size.height
// 1、屏幕宽度
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kNavigationBar_HEIGHT 64
#define kStatusBar_Height  20
#define KScreenWidthRatio  (KScreenWidth / 375.0)
#define kScreenHeightRatio ((KScreenHeight-64)/603.0)
#define kAdaptedWidth(x)  ceilf((x) * KScreenWidthRatio)
#define kAdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define kAdaptedFontSize(R)  kCHINESE_SYSTEM(kAdaptedWidth(R))
#define kCHINESE_SYSTEM(x) [UIFont systemFontOfSize:x]





//2、获取验证码接口
#define verificationInterface @""
//2、手机登陆接口
#define LoginInterface @"user/login"
#endif /* HTCommon_h */
