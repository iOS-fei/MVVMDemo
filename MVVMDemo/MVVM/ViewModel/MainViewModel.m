//
//  MainViewModel.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "MainViewModel.h"
#import "YTOConst.h"
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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Order" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *ordersArr = [dic objectForKey:@"orders"];
    NSMutableArray <MainModel *> *orders = [MainModel mj_objectArrayWithKeyValuesArray:ordersArr];
    for (int i = 0; i < orders.count; i++) {
        MainModel *mainModel = orders[i];
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

- (void)didSelectRowWithIndex:(NSInteger)index
{
    YTOMyOrderCellViewModel *cellVM = self.listArr[index];
    MainModel *mainModel = cellVM.mainModel;
    mainModel.address = @"我是会改变的!";
    [self loadData];
    self.failureBlock(@"修改收件地址成功!");
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
