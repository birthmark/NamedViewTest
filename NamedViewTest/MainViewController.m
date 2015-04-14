//
//  MainViewController.m
//  NamedViewTest
//
//  Created by XiaoG on 15-4-11.
//  Copyright (c) 2015年 XiaoG. All rights reserved.
//

#import "MainViewController.h"
#import "MyCustomView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView* contentView = [[UIView alloc] initWithFrame:[self.view bounds]];
    [self.view addSubview:contentView];
    
    UILabel* labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"title";
    labelTitle.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:labelTitle];
    [labelTitle setName:@"title"];
    
    UILabel* labelSubTitle = [[UILabel alloc] init];
    labelSubTitle.text = @"subTitle";
    labelSubTitle.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:labelSubTitle];
    [labelSubTitle setName:@"subTitle"];
    
    UIButton* button = [[UIButton alloc] init];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [contentView addSubview:button];
    [button setName:@"MyButton"];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField* textField = [[UITextField alloc] init];
    [contentView addSubview:textField];
    textField.placeholder = @"input here";
    [textField setTextAlignment:NSTextAlignmentCenter];
    [textField setName:@"textField"];
    
    MyCustomView* customView = [[MyCustomView alloc] init];
    customView.name = @"customView";
    [self.view addSubview:customView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    UILabel* labelTitle = [self.view viewWithName:@"title"];
    labelTitle.width = self.view.width;
    labelTitle.height = 30;
    labelTitle.top = 20;
    
    UILabel* labelSubTitle = [self.view viewWithName:@"subTitle"];
    labelSubTitle.width = self.view.width/2;
    labelSubTitle.height = labelTitle.height;
    labelSubTitle.top = labelTitle.bottom + 15;
    
    UIButton* button = [self.view viewWithName:@"MyButton"];
    button.leftTop = CGPointMake(labelSubTitle.left, labelSubTitle.bottom+15);
    button.width =120;
    button.height = 40;
    button.centerX = self.view.width/2;
    
    UITextField* textField = [self.view viewWithName:@"textField"];
    textField.top = button.bottom + 15;
    textField.width = 120;
    textField.height = 40;
    
    MyCustomView* customView = [self.view viewWithName:@"customView"];
    customView.top = textField.bottom + 15;
    customView.width = self.view.width;
    customView.height = 100;
}

- (void)buttonClick:(id)sender
{
    NSString* name = [sender name];
    [self.view endEditing:YES];
    [self.view setNeedsLayout];
    
    UITextField* textField = [self.view viewWithName:@"textField"];
    name = textField.name;
    
    NSString* input = [textField text];
    if (input.length > 0) {
        UILabel* label = [self.view viewWithName:@"subTitle"];
        name = label.name;
        label.text = input;
    }
}
@end
