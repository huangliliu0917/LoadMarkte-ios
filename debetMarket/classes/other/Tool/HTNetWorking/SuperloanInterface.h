//
//  SuperloanInterface.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/12/4.
//  Copyright © 2017年 HT. All rights reserved.
//

#ifndef SuperloanInterface_h
#define SuperloanInterface_h


//正式：zhengxin.51morecash.com
//测试：zhengxin.51huotao.com


#ifdef DEBUG //api/sys/init
//#define MainIpAddress @"http://192.168.1.86:8080/api"
//#define MainIpAddress @"http://zhengxin.51huotao.com/api"
// http://zhengxin.51morecash.com/
#define MainIpAddress @"http://zhengxin.51morecash.com/api"
#else
#define MainIpAddress @"http://zhengxin.51morecash.com/api"
#endif

#endif /* SuperloanInterface_h */
