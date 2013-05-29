//
//  LoginViewController.m
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化UI
    [self initUI];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航条
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initUI
{
    UILabel *emailLab = [[UILabel alloc]init];
    emailLab.text     = @"用户名:";
    emailLab.frame    = [UIView fitCGRect:CGRectMake(60, 50, 60, 20)];
    emailLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:emailLab];
    [emailLab release];
    
    UITextField *emailFld = [[UITextField alloc]init];
    emailFld.frame        = [UIView fitCGRect:CGRectMake(124, 45, 137, 30)];
    emailFld.delegate     = self;
    emailFld.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:emailFld];
    [emailFld release];
    
    UILabel *pwdLab = [[UILabel alloc]init];
    pwdLab.text     = @"密码:";
    pwdLab.frame    = [UIView fitCGRect:CGRectMake(60, 90, 60, 20)];
    pwdLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:pwdLab];
    [pwdLab release];
    
    UITextField *pwdFld = [[UITextField alloc]init];
    pwdFld.frame        = [UIView fitCGRect:CGRectMake(124, 85, 137, 30)];
    pwdFld.delegate     = self;
    pwdFld.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:pwdFld];
    [pwdFld release];
    
    UIButton *rmPwdBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rmPwdBtn setTitle:@"记住密码"
              forState:UIControlStateNormal];
    rmPwdBtn.frame      = [UIView fitCGRect:CGRectMake(30, 145, 100, 30)];
    [self.view addSubview:rmPwdBtn];

    UIButton *fgPwdBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fgPwdBtn setTitle:@"忘记密码"
              forState:UIControlStateNormal];
    fgPwdBtn.frame      = [UIView fitCGRect:CGRectMake(190, 145, 100, 30)];
    [self.view addSubview:fgPwdBtn];
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registBtn setTitle:@"注册"
               forState:UIControlStateNormal];
    registBtn.frame     = [UIView fitCGRect:CGRectMake(30, 205, 100, 30)];
    [self.view addSubview:registBtn];
    
    UIButton *loginBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn  setTitle:@"登录"
               forState:UIControlStateNormal];
    loginBtn.frame      = [UIView fitCGRect:CGRectMake(190, 205, 100, 30)];
    [self.view addSubview:loginBtn];
}

#pragma mark UITextFieldDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
@end
