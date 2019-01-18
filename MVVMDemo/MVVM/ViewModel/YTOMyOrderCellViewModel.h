//
//  YTOMyOrderCellViewModel.h
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "MyOrderCellViewModel.h"
@class MainModel;
NS_ASSUME_NONNULL_BEGIN

@interface YTOMyOrderCellViewModel : MyOrderCellViewModel

@property (nonatomic,strong,readonly) MainModel *mainModel;


+ (instancetype)modelWithMainModel:(MainModel *)model;
- (instancetype)initWithMainModel:(MainModel *)model;
@end

NS_ASSUME_NONNULL_END
