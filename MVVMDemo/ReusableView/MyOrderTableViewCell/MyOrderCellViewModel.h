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


/**
 运单号 文本宽度
 */
@property (nonatomic,assign,readonly) CGFloat waybillNoTextWidth;

/**
 订单号 文本宽度
 */
@property (nonatomic,assign,readonly) CGFloat orderNoTextWidth;


/**
 收件地址 文本高度
 */
@property (nonatomic,assign,readonly) CGFloat consigneeAddressTextHeight;

@property (nonatomic,strong) RACSignal *waybillNoSignal;//NSString
@property (nonatomic,strong) RACSignal *waybillNoPasteIconSignal;//UIImage

//下单时间
@property (nonatomic,strong) RACSignal *createTimeSignal;//NSString

@property (nonatomic,strong) RACSignal *orderNoSignal;//NSString
@property (nonatomic,strong) RACSignal *orderNoPasteIconSignal;//UIImage


@property (nonatomic,strong) RACSignal *consigneeAddressSignal;//NSString


/**
 复制 物流单号 信号
 */
@property (nonatomic,strong) RACSubject *waybillNoPasteSignal;

/**
 复制 订单号 信号
 */
@property (nonatomic,strong) RACSubject *orderNoPasteSignal;

/**
 打印面单
 */
@property (nonatomic,strong) RACSubject *printSignal;

/**
 上传证件照
 */
@property (nonatomic,strong) RACSubject *uploadCertificateSignal;

/**
 物流详情
 */
@property (nonatomic,strong) RACSubject *trackInfoSignal;


@end

NS_ASSUME_NONNULL_END
