//
//  HomeController.m
//  Market
//
//  Created by 左梓豪 on 16/10/9.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "HomeController.h"
#import "LogInController.h"
#import "BaseNavigationController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.bounds = CGRectMake(0, 0, 200, 50);
    button.center = self.view.center;
    [button addTarget:self action:@selector(logInAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)logInAction {
    BaseNavigationController *navigation = [[BaseNavigationController alloc] initWithRootViewController:[LogInController new]];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
