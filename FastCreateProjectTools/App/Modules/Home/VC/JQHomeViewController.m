//
//  JQHomeViewController.m
//  FastCreateProjectTools
//
//  Created by xiejuqiang on 2019/12/16.
//  Copyright © 2019 juqiangxie. All rights reserved.
//

#import "JQHomeViewController.h"
#import "JQHomeView.h"

@interface JQHomeViewController ()
@end

@implementation JQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initData];
    [self test];
}

- (void)_initData{
    self.navigationItem.title = @"首页";
}

- (void)test {
    [NetworkManager postWithPath:@"http://120.197.100.98:17080/uSystem/v100/community/detailInfo" params:@{@"baseInfo":@{@"versionCode":@472,@"sign":@"08e1d82a8dfc8f59a48c6838177f049c",@"deviceCode":@"08a421f30b2179d58c6491a4be871f35",@"userId":@"856445858030292992",@"platform":@2},@"communityId":@"188",@"commentId":@"C2773756670843773953"} completeResponse:^(id  _Nonnull obj, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"%@",obj);
        }
        else {
            NSLog(@"%@",error.description);
        }
    }];
    
    JQHomeView *homeView = [JQHomeView new];
    homeView.frame = CGRectMake(100, 100, 100, 100);
    homeView.backgroundColor = [UIColor redColor];
   
    
    JQHomeView *homeView1 = [JQHomeView new];
    homeView1.frame = CGRectMake(100, 100, 100, 100);
    homeView1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:homeView1];
    
    JQHomeView *homeView2 = [JQHomeView new];
    homeView2.frame = CGRectMake(100, 100, 100, 100);
    homeView2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:homeView2];
     [self.view addSubview:homeView];
    
    NSLog(@"homeView==%p",homeView);
    NSLog(@"homeView1==%p",homeView1);
    NSLog(@"homeView2==%p",homeView2);
    
    UIStackView *stackView = [UIStackView new];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 20;
    stackView.distribution = UIStackViewDistributionFillEqually;
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-100);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@(30));
    }];
    
    UILabel *label1 = [UILabel new];
    label1.text = @"发了可视对讲干掉发上来的高科技阿斯兰的高科技啊";
    label1.textColor = [UIColor blackColor];
    label1.backgroundColor = [UIColor redColor];
    [label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow  forAxis:UILayoutConstraintAxisHorizontal];
    [self.view addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"发了可视对讲干";
    label2.textColor = [UIColor blackColor];
    label2.backgroundColor = [UIColor blueColor];
    [label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh  forAxis:UILayoutConstraintAxisHorizontal];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(@(ScreenWidth/2.0));
    }];
    
    [stackView addArrangedSubview:label1];
    [stackView addArrangedSubview:label2];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.view.subviews);
}

@end
