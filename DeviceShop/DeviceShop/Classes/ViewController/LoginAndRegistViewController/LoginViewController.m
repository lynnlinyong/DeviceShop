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
@synthesize pwdFld;
@synthesize emailFld;

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
    
    //初始化网络框架
    cs = [CloudService sharedInstance];
    cs.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航条
    self.navigationController.navigationBarHidden = YES;
    
    //初始化UI
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    emailFld.delegate = nil;
    pwdFld.delegate   = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [pwdFld   release];
    [emailFld release];
    [super dealloc];
}

#pragma mark 
#pragma mark Custom Action
- (void) initUI
{
    UILabel *emailLab = [[UILabel alloc]init];
    emailLab.text     = @"用户名:";
    emailLab.frame    = [UIView fitCGRect:CGRectMake(60, 50, 60, 20)];
    emailLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:emailLab];
    [emailLab release];
    
    //取得用户名
    NSString *userName    = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    emailFld = [[UITextField alloc]init];
    emailFld.text         = userName;
    emailFld.frame        = [UIView fitCGRect:CGRectMake(124, 45, 137, 30)];
    emailFld.delegate     = self;
    emailFld.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:emailFld];
    
    UILabel *pwdLab = [[UILabel alloc]init];
    pwdLab.text     = @"密码:";
    pwdLab.frame    = [UIView fitCGRect:CGRectMake(60, 90, 60, 20)];
    pwdLab.textAlignment = UITextAlignmentRight;
    [self.view addSubview:pwdLab];
    [pwdLab release];
    
    pwdFld = [[UITextField alloc]init];
    pwdFld.frame        = [UIView fitCGRect:CGRectMake(124, 85, 137, 30)];
    pwdFld.delegate     = self;
    pwdFld.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:pwdFld];
    [pwdFld becomeFirstResponder];

    UIButton *fgPwdBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fgPwdBtn setTitle:@"忘记密码"
              forState:UIControlStateNormal];
    fgPwdBtn.frame      = [UIView fitCGRect:CGRectMake(190, 145, 100, 30)];
    [fgPwdBtn addTarget:self
                 action:@selector(doFgPwdBtnClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fgPwdBtn];
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registBtn setTitle:@"注册"
               forState:UIControlStateNormal];
    registBtn.frame     = [UIView fitCGRect:CGRectMake(30, 205, 100, 30)];
    [registBtn addTarget:self
                  action:@selector(doRegistBtnClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    UIButton *loginBtn  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn  setTitle:@"登录"
               forState:UIControlStateNormal];
    loginBtn.frame      = [UIView fitCGRect:CGRectMake(190, 205, 100, 30)];
    [loginBtn addTarget:self
                 action:@selector(doLoginBtnClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (BOOL) checkLoginInfo
{
    if ((emailFld.text.length == 0) || (pwdFld.text.length == 0))
    {
        return NO;
    }
    
    return YES;
}

#pragma mark
#pragma mark - UIButton Clicked Action
- (void) doFgPwdBtnClicked:(id) sender
{
    ForgetPwdViewController *fpViewCtr = [ForgetPwdViewController createViewController:[ForgetPwdViewController class]];
    [self presentModalViewController:fpViewCtr animated:YES];
}

- (void) doRegistBtnClicked:(id)sender
{
    RegistViewController *rgViewCtr = [RegistViewController createViewController:[RegistViewController class]];
    [self.navigationController pushViewController:rgViewCtr
                                         animated:YES];
}

- (void) doLoginBtnClicked:(id)sender
{
    //检查登录信息
    if (![self checkLoginInfo])
    {
        CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
        [self showAlertWithTitle:@"提示"
                         message:@"登录信息不能为空!"
                        delegate:self
               otherButtonTitles:@"确定",nil];
        return;
    }
    
    NSString *paramJson = [NSString stringWithFormat:@"{\"fid\":\"1\",\"userName\":\"%@\",\"password\":\"%@\"}",
                                                                               emailFld.text,pwdFld.text];
    if (![cs sendRequest:paramJson])
    {
        CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
        return;
    }
}

#pragma mark 
#pragma mark - CloudServiceDelegate
- (BOOL) responseFormNetwork:(NSString *)resJson
{
    NSDictionary *resDict = [resJson JSONValue];
    if (!resDict)
    {
        CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
        return NO;
    }
    
    NSString *fid    = [resDict objectForKey:@"FuncID"];
    NSString *status = [resDict objectForKey:@"Status"];
    NSString *result = [resDict objectForKey:@"Result"];
    switch (fid.integerValue)
    {
        case kLoginSystem:          //登陆系统
        {
            if (status.integerValue == FAILED)
            {
                CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
                return NO;
            }
            
            if (result.integerValue == FAILED)
            {
                CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
                return NO;
            }
            
            CLog(@"Login Sunccess!");
            break;
        }
        default:
        {
            CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
            return NO;
            break;
        }
    }
    
    //登录成功
    MainNavViewController *mnVc = [MainNavViewController createViewController:[MainNavViewController class]];
    [self.navigationController pushViewController:mnVc
                                         animated:YES];
    return YES;
}

#pragma mark 
#pragma mark - UITextFieldDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
@end
