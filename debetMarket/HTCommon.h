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

/**商户号*/
#define DebetCustomerId @"4421"

/**版本更新store*/
#define AppleID  @"1215556282"

// 1、获得RGB颜色
#define LWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#endif /* HTCommon_h */
