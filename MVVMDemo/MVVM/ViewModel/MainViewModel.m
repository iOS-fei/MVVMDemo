//
//  MainViewModel.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel ()

@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation MainViewModel

-(instancetype)init
{
    if (self = [super init])
    {
        [self configListArr];
    }
    return self;
}

- (void)configListArr
{
    
}

- (void)requestSuccessBlock:(YTOSuccessBlock)successBlock failureBlock:(YTOFailureBlock)failureBlock
{
    _successBlock = successBlock;
    _failureBlock = failureBlock;
}

-(void)loadData
{
    self->_successBlock(self.listArr.copy);
}

- (BaseCellViewModel *)getCurrentCellViewModelWithIndex:(NSInteger)index
{
    return self.listArr[index];
}

#pragma mark - lazy

-(NSMutableArray *)listArr
{
    if (!_listArr) {
        _listArr = [NSMutableArray array];
    }
    return _listArr;
}


@end
