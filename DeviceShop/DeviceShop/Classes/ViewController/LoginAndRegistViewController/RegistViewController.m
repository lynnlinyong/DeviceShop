//
//  RegistViewController.m
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController
@synthesize pwdFld;
@synthesize rePwdFld;
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
    self.title = @"注册";
    
    //初始化UI
    [self initUI];
    
    //初始化网络服务
    cs = [CloudService sharedInstance];
    cs.delegate = self;
    
//    NSString *requestParam = [NSString stringWithFormat:@"{\"fid\":\"0\",\"userName\":\"123\",\"password\":\"111\"}"];
//    CLog(@"param:%@", requestParam);
//    if (![cs sendRequest:requestParam])
//    {
//        CLog(@"ERROR:Func:%s,Line:%d", __func__, __LINE__);
//    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //显示导航
    self.navigationController.navigationBarHidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    pwdFld.delegate   = nil;
    emailFld.delegate = nil;
    rePwdFld.delegate = nil;
    
    [super viewDidDisappear:animated];
}

- (void) dealloc
{
    [pwdFld   release];
    [emailFld release];
    [rePwdFld release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
#pragma mark - Custom Action
- (void) initUI
{
    UILabel *emailLab = [[UILabel alloc]init];
    emailLab.text     = @"邮箱:";
    emailLab.textAlignment = UITextAlignmentRight;
    emailLab.frame    = [UIView fitCGRect:CGRectMake(60, 50, 40, 20)];
    [self.view addSubview:emailLab];
    [emailLab release];
    
    emailFld  = [[UITextField alloc]init];
    emailFld.delegate      = self;
    emailFld.placeholder   = @"用于找回密码!";
    emailFld.borderStyle   = UITextBorderStyleRoundedRect;
    emailFld.frame  = [UIView fitCGRect:CGRectMake(100, 45, 137, 30)];
    [self.view addSubview:emailFld];
    
    UILabel *pwdLab = [[UILabel alloc]init];
    pwdLab.text     = @"密码:";
    pwdLab.textAlignment = UITextAlignmentRight;
    pwdLab.frame    = [UIView fitCGRect:CGRectMake(60, 85, 40, 20)];
    [self.view addSubview:pwdLab];
    [pwdLab release];
    
    pwdFld = [[UITextField alloc]init];
    pwdFld.delegate     = self;
    pwdFld.placeholder  = @"不少于6位";
    pwdFld.borderStyle  = UITextBorderStyleRoundedRect;
    pwdFld.frame        = [UIView fitCGRect:CGRectMake(100, 80, 137, 30)];
    [self.view addSubview:pwdFld];
    
    UILabel *rePwdLab = [[UILabel alloc]init];
    rePwdLab.text     = @"重复密码:";
    rePwdLab.textAlignment = UITextAlignmentRight;
    rePwdLab.frame    = [UIView fitCGRect:CGRectMake(20, 120, 80, 20)];
    [self.view addSubview:rePwdLab];
    [rePwdLab release];
    
    rePwdFld = [[UITextField alloc]init];
    rePwdFld.delegate     = self;
    rePwdFld.placeholder  = @"再次输入密码!";
    rePwdFld.borderStyle  = UITextBorderStyleRoundedRect;
    rePwdFld.frame        = [UIView fitCGRect:CGRectMake(100, 115, 137, 30)];
    [self.view addSubview:rePwdFld];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cancelBtn setTitle:@"取消"
               forState:UIControlStateNormal];
    cancelBtn.frame     = [UIView fitCGRect:CGRectMake(40, 170, 100, 30)];
    [cancelBtn addTarget:self
                  action:@selector(doCancelBtnClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registBtn setTitle:@"注册"
               forState:UIControlStateNormal];
    registBtn.frame     = [UIView fitCGRect:CGRectMake(170, 170, 100, 30)];
    [registBtn addTarget:self
                  action:@selector(doRegistBtnClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];    
}

-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL) checkRegistInfo
{
    if ((emailFld.text.length == 0) || (pwdFld.text.length == 0)
                                    || (rePwdFld.text.length == 0))
    {
        [self showAlertWithTitle:@"提示"
                         message:@"用户信息不能为空!"
                        delegate:self
               otherButtonTitles:@"确定",nil];
        return NO;
    }
    
    //验证邮箱格式
    if (![self isValidateEmail:emailFld.text])
    {
        [self showAlertWithTitle:@"提示"
                         message:@"请正确填写邮箱地址!"
                        delegate:self
               otherButtonTitles:@"确定",nil];
        return NO;
    }
    
    //验证密码不少于6位
    if (pwdFld.text.length < 6)
    {
        [self showAlertWithTitle:@"提示"
                         message:@"密码太短!"
                        delegate:self
               otherButtonTitles:@"确定",nil];
        return NO;
    }
    
    //验证两次输入密码是否一致
    if (![pwdFld.text isEqualToString:rePwdFld.text])
    {
        [self showAlertWithTitle:@"提示"
                         message:@"两次输入密码不一致!"
                        delegate:self
               otherButtonTitles:@"确定",nil];
        return NO;
    }

    return YES;
}

#pragma mark 
#pragma mark - CloudServiceDelegate
-(BOOL)responseFormNetwork:(NSString *)resJson
{
    NSDictionary *resDict = [resJson JSONValue];
    if (!resDict)
    {
        CLog(@"ERROR:Func:%s, Line:%d", __func__,__LINE__);
        return NO;
    }
    
    NSString *fid    = [resDict objectForKey:@"FuncID"];
    NSString *status = [resDict objectForKey:@"Status"];
    NSString *result = [resDict objectForKey:@"Result"];
    switch (fid.integerValue)
    {
        case kRegistUser:               //注册
        {
            if (status.integerValue == FAILED)
            {
                CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
                return NO;
            }
                
            if (result == FAILED)
            {
                CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
                return NO;
            }
            
            CLog(@"Regist Success!");
            break;
        }
        default:
        {
            CLog(@"ERROR:Func:%s, Line:%d", __func__, __LINE__);
            return NO;
            break;
        }
    }
    
    //记住用户名
    [[NSUserDefaults standardUserDefaults] setObject:emailFld.text
                                              forKey:USER_NAME];
    //跳转到登录页
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

#pragma mark
#pragma mark - UIButton Clicked Action
- (void) doCancelBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) doRegistBtnClicked:(id)sender
{
    //验证输入信息正确性
    if (![self checkRegistInfo])
    {
        return;
    }
    
    FMDatabaseOperate *dbOp = [[FMDatabaseOperate alloc]init];
    NSString *sql = [NSString stringWithFormat:@"insert into User(email,password) values('%@','%@')", emailFld.text,pwdFld.text];
    if ([dbOp insertData:sql])
    {
        CLog(@"Func:%s,insert data success!", __func__);
    }
    else
    {
        [dbOp release];
        CLog(@"Func:%s,query data failed!", __func__);
        return;
    }
    [dbOp release];
    
    //模拟注册时网络请求
    NSString *requestParam = [NSString stringWithFormat:@"{\"fid\":\"0\",\"userName\":\"%@\",\"password\":\"%@\"}", emailFld.text, pwdFld.text];
    CLog(@"param:%@", requestParam);
    if (![cs sendRequest:requestParam])
    {
        CLog(@"ERROR:Func:%s,Line:%d", __func__, __LINE__);
    }
}

#pragma mark
#pragma mark - UITextFieldDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
@end
