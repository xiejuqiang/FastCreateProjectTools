//
//  JQHomeViewController.m
//  FastCreateProjectTools
//
//  Created by xiejuqiang on 2019/12/16.
//  Copyright © 2019 juqiangxie. All rights reserved.
//

#import "JQHomeViewController.h"

@interface JQHomeViewController ()

@end

@implementation JQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initData];
}

- (void)_initData{
    self.navigationItem.title = @"首页";
}

@end
