//
//  LogInController.m
//  Market
//
//  Created by 左梓豪 on 16/10/9.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "LogInController.h"
#import "RegisterController.h"

@interface LogInController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

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
    self.passwordField.textColor = kBlueColor;
    self.phoneNumberField.placeholder = @"手机号码/用户名";
    self.passwordField.placeholder = @"请输入登录密码";
    self.logInButton.backgroundColor = kBlueColor;
    self.logInButton.layer.cornerRadius = 5;
    [self.logInButton addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    cancle.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = cancle;
}

#pragma mark - Actions

- (void)dismiss {
    [self.passwordField resignFirstResponder];
    [self.phoneNumberField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logIn {
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
}


- (IBAction)goRegister:(id)sender {
    [self.navigationController pushViewController:[RegisterController new] animated:YES];
}


- (IBAction)forgetPassword:(id)sender {
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.passwordField resignFirstResponder];
    [self.phoneNumberField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
