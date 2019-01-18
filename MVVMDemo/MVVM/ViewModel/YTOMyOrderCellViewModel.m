//
//  YTOMyOrderCellViewModel.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/18.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "YTOMyOrderCellViewModel.h"
#import "MainModel.h"
@implementation YTOMyOrderCellViewModel
@synthesize addressTextHeight = _addressTextHeight;

- (instancetype)initWithMainModel:(MainModel *)model
{
    if (self = [super init]) {
        self.cellName = @"MyOrderTableViewCell";
        self.mainModel = model;
        
        CGFloat addressHeight = [model.address boundingRectWithSize:CGSizeMake(KScreenWidth - 30, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.f]} context:nil].size.height;
        self.addressTextHeight = addressHeight;
        
        self.rowHeight = 45 + addressHeight + 22;
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
    
    self.waybillNoSignal = [signal map:^id _Nullable(MainModel *model) {
        return [NSString stringWithFormat:@"物流单号 : %@",model.server_hawbcode];
    }];
    
    self.waybillNoPasteIconSignal = [signal map:^id _Nullable(MainModel *model) {
        return [UIImage imageNamed:model.pasteIconName];
    }];
    
    self.placeholderSignal = [signal map:^id _Nullable(MainModel *model) {
        return model.placeholder;
    }];
    
    self.addressSignal = [signal map:^id _Nullable(MainModel *model) {
        return model.address;
    }];
    
    
}

-(void)setMainModel:(MainModel * _Nonnull)mainModel
{
    _mainModel = mainModel;
}

-(void)setAddressTextHeight:(CGFloat)addressTextHeight
{
    _addressTextHeight = addressTextHeight;
}

@end
