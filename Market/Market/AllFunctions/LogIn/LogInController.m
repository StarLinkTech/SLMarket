//
//  LogInController.m
//  Market
//
//  Created by 左梓豪 on 16/10/9.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "LogInController.h"

@interface LogInController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;

@end

@implementation LogInController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self config];
}

- (void)config {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"会员登录";
    self.phoneNumberField.textColor = kBlueColor;
    self.phoneNumberField.keyboardType = UIKeyboardTypePhonePad;
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = cancle;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
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
