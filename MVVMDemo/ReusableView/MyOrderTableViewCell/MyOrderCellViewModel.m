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

-(RACSubject *)orderNoPasteSignal
{
    if (!_orderNoPasteSignal) {
        _orderNoPasteSignal = [RACSubject subject];
    }
    return _orderNoPasteSignal;
}


-(RACSubject *)printSignal
{
    if (!_printSignal) {
        _printSignal = [RACSubject subject];
    }
    return _printSignal;
}

-(RACSubject *)uploadCertificateSignal
{
    if (!_uploadCertificateSignal) {
        _uploadCertificateSignal = [RACSubject subject];
    }
    return _uploadCertificateSignal;
}

-(RACSubject *)trackInfoSignal
{
    if (!_trackInfoSignal) {
        _trackInfoSignal = [RACSubject subject];
    }
    return _trackInfoSignal;
}

@end
