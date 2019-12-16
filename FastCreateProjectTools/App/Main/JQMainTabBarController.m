//
//  JQMainTabBarController.m
//  FastCreateProjectTools
//
//  Created by xiejuqiang on 2019/11/11.
//  Copyright © 2019 juqiangxie. All rights reserved.
//

#import "JQMainTabBarController.h"

@interface JQMainTabBarController ()

@end

@implementation JQMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViewControllers];
}

- (void)setupViewControllers {
    Class cls1 = NSClassFromString(@"JQHomeViewController");
    Class cls2 = NSClassFromString(@"JQAroundViewController");
    UIViewController *vc1 = [cls1 new];
    UIViewController *vc2 = [cls2 new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    
    vc1.tabBarItem.title = @"首页";
    vc2.tabBarItem.title = @"周边";
    
    vc1.tabBarItem.image = [[UIImage imageNamed:@"tabbar_icon_home_unselected"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_icon_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.image = [[UIImage imageNamed:@"tabbar_icon_around_unselected"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_icon_around_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255.0/255 green:73.0/255 blue:87.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    
    
    [self addChildViewController:nav1];
    [self addChildViewController:nav2];
}

@end
