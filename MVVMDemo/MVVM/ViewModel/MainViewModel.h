//
//  MainViewModel.h
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseCellViewModel;
NS_ASSUME_NONNULL_BEGIN

typedef void(^YTOSuccessBlock)(id data);
typedef void(^YTOFailureBlock) (NSString *errorMsg);

@interface MainViewModel : NSObject

@property (nonatomic,copy)YTOSuccessBlock successBlock;

@property (nonatomic,copy) YTOFailureBlock failureBlock;

- (void)requestSuccessBlock:(YTOSuccessBlock)successBlock failureBlock:(YTOFailureBlock)failureBlock;

/**
 加载数据
 */
- (void)loadData;

- (BaseCellViewModel *)getCurrentCellViewModelWithIndex:(NSInteger)index;

/**
 复制 物流单号
 
 @param index 列表的索引
 */
- (void)copyWaybillNoWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
