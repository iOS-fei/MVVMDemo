//
//  MainViewController.m
//  MVVMDemo
//
//  Created by 张飞 on 2019/1/17.
//  Copyright © 2019 张飞. All rights reserved.
//

#import "MainViewController.h"
#import "YTOConst.h"
#import "MainViewModel.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) MainViewModel *vm;
@property (nonatomic,weak) UITableView *mainTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    __weak  typeof(self) weakSelf = self;
    
    [self.vm requestSuccessBlock:^(id  _Nonnull data) {
        NSArray *tmpArr = data;
        weakSelf.dataArray = [NSMutableArray arrayWithArray:tmpArr];
        [weakSelf .mainTableView reloadData];
    } failureBlock:^(NSString * _Nonnull errorMsg) {
        [Util showInfoLabel:errorMsg];
    }];
    [self.vm loadData];
    
    [[self rac_signalForSelector:@selector(scrollViewWillBeginDragging:) fromProtocol:@protocol(UIScrollViewDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        [[IQKeyboardManager sharedManager] resignFirstResponder];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    return cell;
}

#pragma mark - lazy load

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavBarHeight, KScreenWidth, KScreenHeight - KNavBarHeight)];
        mainTableView.backgroundColor = [UIColor clearColor];
        mainTableView.tableFooterView = [[UIView alloc] init];
        mainTableView.showsVerticalScrollIndicator = YES;
        [self.view addSubview:mainTableView];
        _mainTableView = mainTableView;
    }
    return _mainTableView;
}



-(MainViewModel *)vm
{
    if (!_vm) {
        _vm = [[MainViewModel alloc] init];
    }
    return _vm;
}

@end
