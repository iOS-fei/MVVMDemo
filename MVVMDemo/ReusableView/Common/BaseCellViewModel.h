//
//  BaseCellViewModel.h
//  rec
//
//  Created by 张飞 on 2018/7/16.
//  Copyright © 2018年 张飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BaseCellViewModel : NSObject
/**
 行高
 */
@property (nonatomic,assign) CGFloat rowHeight;

/**
 绑定cell的类名
 */
@property (nonatomic,copy) NSString *cellName;

@end
