//
//  MyOrderCellViewModel.h
//  YTongInternation
//
//  Created by 张飞 on 2018/12/10.
//  Copyright © 2018 yto. All rights reserved.
//

#import "BaseCellViewModel.h"
#import "YTOConst.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyOrderCellViewModel : BaseCellViewModel

@property (nonatomic,strong) RACSignal *waybillNoSignal;//NSString

@property (nonatomic,strong) RACSignal *waybillNoPasteIconSignal;//UIImage

/**
 文本框输入的内容
 */
@property (nonatomic,copy) NSString *inputContent;


@property (nonatomic,strong) RACSignal *placeholderSignal;//NSString

@property (nonatomic,strong) RACSignal *addressSignal;//NSString

/**
 地址 文本高度
 */
@property (nonatomic,assign,readonly) CGFloat addressTextHeight;

/**
 复制 物流单号 信号
 */
@property (nonatomic,strong) RACSubject *waybillNoPasteSignal;




@end

NS_ASSUME_NONNULL_END
