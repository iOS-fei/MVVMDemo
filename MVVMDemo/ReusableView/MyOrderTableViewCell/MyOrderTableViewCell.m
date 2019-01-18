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
    
    /*
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
    */
    
}

-(void)bindWithViewModel:(MyOrderCellViewModel *)viewModel
{
    
    _viewModel = viewModel;
}


@end
