//
//  BottomBarButton.m
//  广东海事局
//
//  Created by Darsky on 14/8/23.
//  Copyright (c) 2014年 Darsky. All rights reserved.
//

#import "BottomBarButton.h"

@implementation BottomBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, self.frame.size.width-40)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [self setTitleColor:[UIColor colorWithRed:78.0/255.0 green:225.0/255.0 blue:253.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

@end
