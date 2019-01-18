//
//  MyOrderTableViewCell.m
//  YTongInternation
//
//  Created by 张飞 on 2018/12/10.
//  Copyright © 2018 yto. All rights reserved.
//

#import "MyOrderTableViewCell.h"
#import "MyOrderCellViewModel.h"
#import "XYButton.h"
#import "YTOConst.h"
@interface MyOrderTableViewCell ()

@property (nonatomic,weak) MyOrderCellViewModel *viewModel;

/**
 物流单号
 */
@property (nonatomic,weak) UILabel *waybillNoLabel;

@property (nonatomic,weak) UIButton *waybillNoPasteIconButton;

@property (nonatomic,weak) UILabel *createTimeLabel;

@property (nonatomic,weak) UILabel *orderNoLabel;

@property (nonatomic,weak) UIButton *orderNoPasteIconButton;

@property (nonatomic,weak) UILabel *consigneeAddressLabel;

@property (nonatomic,weak) UIButton *printButton;

@property (nonatomic,weak) UIButton *uploadCertificateButton;

@property (nonatomic,weak) UIButton *trackInfoButton;


@end

@implementation MyOrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubviews];
    }
    return self;
}

/**
 创建子视图
 */
- (void)createSubviews
{
    UILabel *waybillNoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, KScreenWidth - 15 , 17)];
    waybillNoLabel.backgroundColor = [UIColor whiteColor];
    waybillNoLabel.font = [UIFont systemFontOfSize:17.f];
    waybillNoLabel.textColor = [UIColor blackColor];
    waybillNoLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:waybillNoLabel];
    self.waybillNoLabel = waybillNoLabel;
    
    
    XYButton *waybillNoPasteIconButton = [XYButton buttonWithType:UIButtonTypeCustom];
    waybillNoPasteIconButton.backgroundColor = [UIColor clearColor];
    waybillNoPasteIconButton.frame = CGRectMake(0, 0, 60, 27);
    waybillNoPasteIconButton.imageRect = CGRectMake(13, 1, 25, 25);
    [self.contentView addSubview:waybillNoPasteIconButton];
    self.waybillNoPasteIconButton = waybillNoPasteIconButton;
    
    __weak typeof(self) weakSelf = self;
    
    [[self.waybillNoPasteIconButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.waybillNoPasteSignal sendNext:@"复制物流单号"];
    }];
    
    UILabel *createTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, waybillNoLabel.bottom+5, KScreenWidth - 15 , 17)];
    createTimeLabel.backgroundColor = [UIColor whiteColor];
    createTimeLabel.font = [UIFont systemFontOfSize:17.f];
    createTimeLabel.textColor = [UIColor blackColor];
    createTimeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:createTimeLabel];
    self.createTimeLabel = createTimeLabel;
    
    UILabel *orderNoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, createTimeLabel.bottom+5, KScreenWidth - 15 , 17)];
    orderNoLabel.backgroundColor = [UIColor whiteColor];
    orderNoLabel.font = [UIFont systemFontOfSize:17.f];
    orderNoLabel.textColor = [UIColor blackColor];
    orderNoLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:orderNoLabel];
    self.orderNoLabel = orderNoLabel;
    
    XYButton *orderNoPasteIconButton = [XYButton buttonWithType:UIButtonTypeCustom];
    orderNoPasteIconButton.backgroundColor = [UIColor clearColor];
    orderNoPasteIconButton.frame = CGRectMake(0, createTimeLabel.bottom, 60, 27);
    orderNoPasteIconButton.imageRect = CGRectMake(13, 1, 25, 25);
    [self.contentView addSubview:orderNoPasteIconButton];
    self.orderNoPasteIconButton = orderNoPasteIconButton;
    
    [[self.orderNoPasteIconButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.orderNoPasteSignal sendNext:@"复制订单号"];
    }];
    
    
    UILabel *consigneeAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, orderNoLabel.bottom+5, KScreenWidth - 35 , 17)];
    consigneeAddressLabel.backgroundColor = [UIColor whiteColor];
    consigneeAddressLabel.font = [UIFont systemFontOfSize:17.f];
    consigneeAddressLabel.textColor = [UIColor blackColor];
    consigneeAddressLabel.textAlignment = NSTextAlignmentLeft;
    consigneeAddressLabel.numberOfLines = 0;
    [self.contentView addSubview:consigneeAddressLabel];
    self.consigneeAddressLabel = consigneeAddressLabel;
    
    CGFloat buttonWidth  = (KScreenWidth-10*4)/3;
    CGFloat buttonHeight = 34;
    
    UIButton *printButton = [UIButton buttonWithType:UIButtonTypeCustom];
    printButton.frame = CGRectMake(10, 0, buttonWidth, buttonHeight);
    printButton.backgroundColor = UIColor.yellowColor;
    [printButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    printButton.layer.cornerRadius = 3;
    [printButton setTitle:@"打印面单" forState:UIControlStateNormal];
    printButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [self.contentView addSubview:printButton];
    self.printButton = printButton;
    [[self.printButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.printSignal sendNext:@"打印面单"];
    }];
    
    UIButton *uploadCertificateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadCertificateButton.frame = CGRectMake(self.printButton.right + 10, 0, buttonWidth, buttonHeight);
    uploadCertificateButton.backgroundColor = UIColor.yellowColor;
    [uploadCertificateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    uploadCertificateButton.layer.cornerRadius = 3;
    [uploadCertificateButton setTitle:@"上传证件照片" forState:UIControlStateNormal];
    uploadCertificateButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [self.contentView addSubview:uploadCertificateButton];
    self.uploadCertificateButton = uploadCertificateButton;
    [[self.uploadCertificateButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.uploadCertificateSignal sendNext:@"上传证件照片"];
    }];
    
    
    UIButton *trackInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    trackInfoButton.frame = CGRectMake(self.uploadCertificateButton.right + 10, 0, buttonWidth, buttonHeight);
    trackInfoButton.backgroundColor = UIColor.yellowColor;
    [trackInfoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    trackInfoButton.layer.cornerRadius = 3;
    [trackInfoButton setTitle:@"物流信息" forState:UIControlStateNormal];
    trackInfoButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [self.contentView addSubview:trackInfoButton];
    self.trackInfoButton = trackInfoButton;
    [[self.trackInfoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.trackInfoSignal sendNext:@"物流信息"];
    }];
}

-(void)bindWithViewModel:(MyOrderCellViewModel *)viewModel
{
    
    //修改复制按钮的 x坐标
    self.waybillNoPasteIconButton.x = viewModel.waybillNoTextWidth+5;
    self.orderNoPasteIconButton.x = viewModel.orderNoTextWidth + 5;
    self.consigneeAddressLabel.height = viewModel.consigneeAddressTextHeight;
    
    self.printButton.y = self.consigneeAddressLabel.bottom+10;
    self.uploadCertificateButton.y = self.consigneeAddressLabel.bottom+10;
    self.trackInfoButton.y = self.consigneeAddressLabel.bottom+10;
    
    __weak typeof(self) weakSelf = self;
    RAC(self.waybillNoLabel,text) = [viewModel.waybillNoSignal takeUntil:self.rac_prepareForReuseSignal];
    
    [[viewModel.waybillNoPasteIconSignal takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        [weakSelf.waybillNoPasteIconButton setImage:x forState:UIControlStateNormal];
    }];
    
    [[viewModel.orderNoPasteIconSignal takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        [weakSelf.orderNoPasteIconButton setImage:x forState:UIControlStateNormal];
    }];
    
    RAC(self.createTimeLabel,text) = [viewModel.createTimeSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.orderNoLabel,text) = [viewModel.orderNoSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.consigneeAddressLabel,text) = [viewModel.consigneeAddressSignal takeUntil:self.rac_prepareForReuseSignal];
    _viewModel = viewModel;
}


@end
