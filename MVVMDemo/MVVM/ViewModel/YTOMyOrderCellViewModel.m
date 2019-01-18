//
//  YTOMyOrderCellViewModel.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "YTOMyOrderCellViewModel.h"

@implementation YTOMyOrderCellViewModel
- (instancetype)initWithMainModel:(MainModel *)model
{
    if (self = [super init]) {
        self.cellName = @"MyOrderTableViewCell";
        self.mainModel = model;
//        self.rowHeight =
        [self bindSignals];
    }
    return self;
}
+ (instancetype)modelWithMainModel:(MainModel *)model
{
    return [[[self class] alloc] initWithMainModel:model];
}


/**
 绑定信号
 */
- (void)bindSignals
{
    RACSignal *signal = [RACSignal return:self.mainModel];
}

-(void)setMainModel:(MainModel * _Nonnull)mainModel
{
    _mainModel = mainModel;
}
@end
