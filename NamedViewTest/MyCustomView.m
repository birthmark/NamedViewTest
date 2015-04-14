//
//  MyCustomView.m
//  NamedViewTest
//
//  Created by XiaoG on 15-4-13.
//  Copyright (c) 2015年 XiaoG. All rights reserved.
//

#import "MyCustomView.h"

@implementation MyCustomView

- (id)init
{
    self = [super init];
    if (self) {
        UILabel* labelTitle = [[UILabel alloc] init];
        labelTitle.text = @"title";
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.name = @"title";
        [self addSubview:labelTitle];
        
        UILabel* labelContent = [[UILabel alloc] init];
        labelContent.text = @"contentjjjjhkjhkjhk";
        labelContent.textAlignment = NSTextAlignmentCenter;
        labelContent.name = @"content";
        [self addSubview:labelContent];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UILabel* labelTitle = [self viewWithName:@"title"];
    labelTitle.width = 80;
    labelTitle.height = self.height;
    NSLog(@"labelTitle right: %f", labelTitle.right);
    
    UILabel* labelContent = [self viewWithName:@"content"];
    labelContent.width = self.width - 80;
    labelContent.left = labelTitle.right;
    labelContent.height = self.height;
    NSLog(@"labelContent right: %f", labelContent.right);
    
//    self.height = labelContent.bottom;
}

@end
