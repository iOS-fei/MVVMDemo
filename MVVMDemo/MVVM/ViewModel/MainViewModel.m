//
//  MainViewModel.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "MainViewModel.h"
#import "MainModel.h"
#import "YTOMyOrderCellViewModel.h"
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
    for (int i = 0; i < 15; i++) {
        MainModel *mainModel = [[MainModel alloc] init];
        mainModel.server_hawbcode = @"G123456789";
        mainModel.placeholder = [NSString stringWithFormat:@"我是placeholder_%d",i];
        mainModel.address = @"收件地址 : gitHub是一个面向开源及私有软件项目的托管平台，因为只支持git 作为唯一的版本库格式进行托管，故名gitHub。gitHub于2008年4月10日正式上线";
        mainModel.pasteIconName = @"copyIcon";
        YTOMyOrderCellViewModel *cellViewModel = [YTOMyOrderCellViewModel modelWithMainModel:mainModel];
        [self.listArr addObject:cellViewModel];
    }
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


- (void)copyWaybillNoWithIndex:(NSInteger)index
{
    YTOMyOrderCellViewModel *cellVM = self.listArr[index];
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:cellVM.mainModel.server_hawbcode];
    self.failureBlock([NSString stringWithFormat:@"复制成功: %@",cellVM.mainModel.server_hawbcode]);
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
