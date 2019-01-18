//
//  MainModel.h
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainModel : NSObject


/**
 服务商单号/物流单号
 */
@property (nonatomic,copy) NSString *server_hawbcode;


/**
 复制按钮 icon 名称
 */
@property (nonatomic,copy) NSString *pasteIconName;

/**
 UITextField 的 placeholder
 */
@property (nonatomic,copy) NSString *placeholder;


/**
 地址
 */
@property (nonatomic,copy) NSString *address;



@end

NS_ASSUME_NONNULL_END
