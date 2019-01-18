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


/**
 复制f物流单号 按钮
 */
@property (nonatomic,weak) XYButton *waybillNoPasteIconButton;

@property (nonatomic,weak) UITextField *textField;

@property (nonatomic,weak) UILabel *addressLabel;

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
    
    UILabel *waybillNoLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, KScreenWidth - 15 , 17)];
    waybillNoLabel.backgroundColor = [UIColor whiteColor];
    waybillNoLabel.font = [UIFont systemFontOfSize:17.f];
    waybillNoLabel.textColor = [UIColor blackColor];
    waybillNoLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:waybillNoLabel];
    self.waybillNoLabel = waybillNoLabel;
    
    
    XYButton *waybillNoPasteIconButton = [XYButton buttonWithType:UIButtonTypeCustom];
    waybillNoPasteIconButton.backgroundColor = [UIColor whiteColor];
    waybillNoPasteIconButton.frame = CGRectMake(0, 0, 60, 27);
    waybillNoPasteIconButton.imageRect = CGRectMake(13, 1, 25, 25);
    [self.contentView addSubview:waybillNoPasteIconButton];
    self.waybillNoPasteIconButton = waybillNoPasteIconButton;
    
    __weak typeof(self) weakSelf = self;
    
    [[self.waybillNoPasteIconButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.viewModel.waybillNoPasteSignal sendNext:@"复制物流单号"];
    }];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15,waybillNoLabel.bottom + 5, KScreenWidth - 30, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.returnKeyType = UIReturnKeyDone;
    [self.contentView addSubview:textField];
    self.textField = textField;
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, textField.bottom+5, KScreenWidth - 30 , 0)];
    addressLabel.backgroundColor = [UIColor whiteColor];
    addressLabel.font = [UIFont systemFontOfSize:17.f];
    addressLabel.textColor = [UIColor blackColor];
    addressLabel.textAlignment = NSTextAlignmentLeft;
    addressLabel.numberOfLines = 0;
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
}

-(void)bindWithViewModel:(MyOrderCellViewModel *)viewModel
{
    //修改复制按钮的 x坐标
    self.waybillNoPasteIconButton.x = viewModel.waybillNoTextWidth+20;
    self.addressLabel.height = viewModel.addressTextHeight;
    
     RAC(self.waybillNoLabel,text) = [viewModel.waybillNoSignal takeUntil:self.rac_prepareForReuseSignal];
    
    __weak typeof(self) weakSelf = self;
    [[viewModel.waybillNoPasteIconSignal takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        [weakSelf.waybillNoPasteIconButton setImage:x forState:UIControlStateNormal];
    }];
    
    RAC(self.textField,placeholder) = [viewModel.placeholderSignal takeUntil:self.rac_prepareForReuseSignal];
    
    //双向绑定
    RACChannelTerminal *inputTerminal = self.textField.rac_newTextChannel;
    RACChannelTerminal *viewModelInputContent = RACChannelTo(viewModel,inputContent);
    [[viewModelInputContent takeUntil:self.rac_prepareForReuseSignal] subscribe:inputTerminal];
    [[inputTerminal takeUntil:self.rac_prepareForReuseSignal] subscribe:viewModelInputContent];
    
    RAC(self.addressLabel,text) = [viewModel.addressSignal takeUntil:self.rac_prepareForReuseSignal];
    
    _viewModel = viewModel;
}


@end
