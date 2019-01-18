//
//  MyOrderCellViewModel.m
//  YTongInternation
//
//  Created by 张飞 on 2018/12/10.
//  Copyright © 2018 yto. All rights reserved.
//

#import "MyOrderCellViewModel.h"

@implementation MyOrderCellViewModel

- (RACSubject *)waybillNoPasteSignal
{
    if (!_waybillNoPasteSignal) {
        _waybillNoPasteSignal = [RACSubject subject];
    }
    return _waybillNoPasteSignal;
}

@end
