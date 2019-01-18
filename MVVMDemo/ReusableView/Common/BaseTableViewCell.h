//
//  BaseTableViewCell.h
//  rec
//
//  Created by 张飞 on 2018/7/16.
//  Copyright © 2018年 张飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCellViewModel;
@interface BaseTableViewCell : UITableViewCell

- (void)bindWithViewModel:(BaseCellViewModel *)viewModel;

@end
