//
//  Util.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "Util.h"
#import "SVProgressHUD.h"
@implementation Util

+ (BOOL)isIphoneX_XSScreenType
{
    if (CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125, 2436))) { return YES; } return NO;
}

+ (BOOL)isIphoneXRScreenType
{
    if (CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(828, 1792))) { return YES; } return NO;
}

+ (BOOL)isIphoneXSMaxScreenType
{
    if (CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1242, 2688))) { return YES; } return NO;
}

+ (CGFloat)currentDeviceNavigationBarHeight
{
    if ([self isIphoneX_XSScreenType] || [self isIphoneXRScreenType] || [self isIphoneXSMaxScreenType])
    {
        return 44+44;
    }
    return 20+44;
}

+ (CGFloat)currentDeviceTabbarHeight
{
    if ([self isIphoneX_XSScreenType] || [self isIphoneXRScreenType] || [self isIphoneXSMaxScreenType])
    {
        return 49+34;
    }
    return 49;
}

+ (void)showInfoLabel:(NSString *)infoString
{
    if (infoString != nil && ![@"" isEqualToString:infoString]){
        [SVProgressHUD showImage:nil status:infoString];
    }
}

@end
