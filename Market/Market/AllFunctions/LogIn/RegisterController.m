//
//  RegisterController.m
//  Market
//
//  Created by 左梓豪 on 16/10/9.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "RegisterController.h"
#import "RegisterTableViewCell.h"

#define kCellHeight 50

@interface RegisterController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation RegisterController {
    UIImageView *_check;
    UIImageView *_uncheck;
    UIButton *_getCode;
    NSTimer *_timer;
    NSInteger _currentTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(235, 235, 235, 1);
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)initView {
    self.title = @"注册账号";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kAppScreenWidth, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"RegisterTableViewCell" bundle:nil] forCellReuseIdentifier:@"RegisterCell"];
    [self.view addSubview:_tableView];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAppScreenWidth, kAppScreenHeight)];
    footer.backgroundColor = self.view.backgroundColor;
    _check = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 20, 20)];
    _check.image = [UIImage imageNamed:@"check"];
    _check.hidden = YES;
    _check.userInteractionEnabled = YES;
    [footer addSubview:_check];
    UITapGestureRecognizer *goUncheck = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uncheck)];
    [_check addGestureRecognizer:goUncheck];
    
    _uncheck = [[UIImageView alloc] initWithFrame:_check.frame];
    _uncheck.image = [UIImage imageNamed:@"uncheck"];
    _uncheck.userInteractionEnabled = YES;
    UITapGestureRecognizer *goCheck = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(check)];
    [footer addSubview:_uncheck];
    [_uncheck addGestureRecognizer:goCheck];
    
    UILabel *msg = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_check.frame)+10, CGRectGetMinY(_check.frame), 165, _check.frame.size.height)];
    msg.font = [UIFont systemFontOfSize:11];
    msg.text = @"我已阅读并同意弘基创富GO商城";
    [footer addSubview:msg];
    
    UIButton *protocol = [UIButton buttonWithType:UIButtonTypeCustom];
    protocol.frame = CGRectMake(CGRectGetMaxX(msg.frame), CGRectGetMinY(_check.frame), 120, _check.frame.size.height);
    [protocol setTitleColor:kBlueColor forState:UIControlStateNormal];
    [protocol setTitle:@"《用户使用协议》" forState:UIControlStateNormal];
    protocol.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    protocol.titleLabel.font = [UIFont systemFontOfSize:11];
    [footer addSubview:protocol];
    
    UIButton *registerNow = [UIButton buttonWithType:UIButtonTypeCustom];
    registerNow.frame = CGRectMake(20, CGRectGetMaxY(_check.frame)+10, kAppScreenWidth - 40, 40);
    registerNow.layer.cornerRadius = 5;
    [registerNow setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerNow setBackgroundColor:kBlueColor];
    [registerNow addTarget:self action:@selector(registerNow) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:registerNow];
    
    _tableView.tableFooterView = footer;
}

#pragma mark - Actions

- (void)uncheck {
    _uncheck.hidden = NO;
    _check.hidden = YES;
}

- (void)check {
    _check.hidden = NO;
    _uncheck.hidden = YES;
}

- (void)registerNow {
    NSLog(@"----");
}

- (void)countTime {
    NSLog(@"start");
    
    _currentTime = 60;
    
    _getCode.userInteractionEnabled = NO;
    _getCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_getCode setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
}

- (void)timeChange:(NSTimer *)timer {
    _currentTime--;
    
    [_getCode setTitle:[NSString stringWithFormat:@"%lds重新发送",_currentTime] forState:UIControlStateNormal];
    
    NSLog(@"%ld",_currentTime);
    if (_currentTime == 0) {
        _getCode.userInteractionEnabled = YES;
        [_getCode setTitle:@"发送验证码" forState:UIControlStateNormal];
        _getCode.layer.borderColor = kBlueColor.CGColor;
        [_getCode setTitleColor:kBlueColor forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RegisterCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[RegisterTableViewCell alloc] init];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textField.textColor = kBlueColor;
    
    switch (indexPath.row) {
        case 0:
            cell.nameLabel.text = @"手机号码";
            cell.textField.placeholder = @"请输入正确的手机号码";
            break;
        case 1:
            cell.nameLabel.text = @"验证码";
            cell.textField.placeholder = @"请输入验证码";
            break;
        case 2:
            cell.nameLabel.text = @"设置密码";
            cell.textField.placeholder = @"设置登录密码";
            cell.textField.secureTextEntry = YES;
            break;
        case 3:
            cell.nameLabel.text = @"重复密码";
            cell.textField.placeholder = @"重复输入登录密码";
            cell.textField.secureTextEntry = YES;
            break;
        
        default:
            break;
    }
    
    if (_getCode == nil) {
        _getCode = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    _getCode.layer.borderColor = kBlueColor.CGColor;
    _getCode.layer.borderWidth = 0.5f;
    [_getCode setTitleColor:kBlueColor forState:UIControlStateNormal];
    _getCode.frame = CGRectMake(kAppScreenWidth - 110, 15, 90, 30);
    _getCode.titleLabel.font = [UIFont systemFontOfSize:13];
    [_getCode setTitle:@"发送验证码" forState:UIControlStateNormal];
    
    if (_getCode.userInteractionEnabled == NO) {
        _getCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_getCode setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    
    if (indexPath.row == 1) {
        [cell.contentView addSubview:_getCode];
    }
    [_getCode addTarget:self action:@selector(countTime) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
