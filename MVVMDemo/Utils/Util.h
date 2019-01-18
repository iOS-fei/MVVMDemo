//
//  Util.h
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject

/**
 获取当前设备的导航栏高度
 
 @return 设备的导航栏高度 “64” 或者  “88”
 */
+ (CGFloat)currentDeviceNavigationBarHeight;
/**
 获取当前设备的tabbar高度
 
 @return 设备的导航栏高度 “49” 或者  “57”
 */
+ (CGFloat)currentDeviceTabbarHeight;

/**
 只显示label的提示弹框
 
 @param infoString 需要提示的信息
 */
+ (void)showInfoLabel:(NSString *)infoString;

@end

NS_ASSUME_NONNULL_END
