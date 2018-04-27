//
//  ViewController.m
//  YQCountDownDemo
//
//  Created by chase on 2018/4/27.
//  Copyright © 2018年 chase. All rights reserved.
//

#import "ViewController.h"
#import "YQCountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createCountDownButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createCountDownButton
{
    YQCountDownButton *countDownButton = [[YQCountDownButton alloc] initWithFrame:CGRectMake(100, 100, 140, 40)];
    [countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [countDownButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    countDownButton.backgroundColor = [UIColor colorWithRed:40/255.0 green:207/255.0 blue:155/255.0 alpha:1];
    [countDownButton addTarget:self action:@selector(sendVerificationCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:countDownButton];
}

- (void)sendVerificationCode:(YQCountDownButton *)countDownButton {
    [countDownButton countDownWithDuration:5 completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
