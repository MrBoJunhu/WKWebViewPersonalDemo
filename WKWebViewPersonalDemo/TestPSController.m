//
//  TestPSController.m
//  WKWebViewPersonalDemo
//
//  Created by bill on 16/9/26.
//  Copyright © 2016年 bill. All rights reserved.
//

#import "TestPSController.h"

@interface TestPSController ()

@end

@implementation TestPSController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}


- (void)configuraiton {
    
    [super configuraiton];
    
    self.buttonSelectedFontSize = 20;
    
    self.titleArray = @[@"第一页", @"第二页"];
    
    self.title = self.titleArray[0];
    
    self.buttonWidth = [UIScreen mainScreen].bounds.size.width / self.titleArray.count;
    
    self.buttonSelectedColor = [UIColor redColor];
    
    self.buttonSpace_Y = 10;
        
}

- (void)clickButtonAction:(UIButton *)sender {
    
    [super clickButtonAction:sender];
    
    NSLog(@"点击的是%ld", (long)sender.tag);
    
    self.title = sender.titleLabel.text;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
