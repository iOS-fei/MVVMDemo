//
//  YTOConst.h
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#ifndef YTOConst_h
#define YTOConst_h

//获取屏幕宽高
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

//状态栏+导航栏高度
#define KNavBarHeight [Util currentDeviceNavigationBarHeight]
//Tabbar高度
#define KTabbarHeight [Util currentDeviceTabbarHeight]

#import "UIViewExt.h"
#import "Util.h"


//第三方
#import "ReactiveObjC.h"
#import "IQKeyboardManager.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"

#endif /* YTOConst_h */
