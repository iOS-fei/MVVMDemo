//
//  BaseCollectionViewCell.h
//  rec
//
//  Created by 张飞 on 2018/7/19.
//  Copyright © 2018年 张飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCellViewModel;

@interface BaseCollectionViewCell : UICollectionViewCell
- (void)bindWithViewModel:(BaseCellViewModel *)viewModel;


@end
