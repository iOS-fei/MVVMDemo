//
//  XYButton.m
//  YTongInternation
//
//  Created by 张飞 on 2018/12/6.
//  Copyright © 2018 yto. All rights reserved.
//

#import "XYButton.h"

@implementation XYButton

//重写父类方法
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    //如果 self.titleRect 不为空，并且 self.titleRect 不等于零
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero))
    {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero))
    {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}


@end
