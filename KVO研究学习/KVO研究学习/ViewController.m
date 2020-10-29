//
//  ViewController.m
//  KVO研究学习
//
//  Created by ww on 2020/10/27.
//  Copyright © 2020 ww. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testBtn setBackgroundColor:UIColor.redColor];
    [self.testBtn setTitle:@"点我跳转" forState:UIControlStateNormal];
    [self.view addSubview:self.testBtn];
    self.testBtn.frame = CGRectMake(100, 100, 100, 100);
    [self.testBtn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
}


- (void)btnClick{
    [self.navigationController pushViewController:[TestViewController new] animated:true];
    NSInteger a = 123;
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wformat"
    NSLog(@"%d", a);
    #pragma clang diagnostic pop
    
    
}

@end
