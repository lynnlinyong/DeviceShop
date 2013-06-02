//
//  ForgetPwdViewController.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "ForgetPwdViewController.h"

@interface ForgetPwdViewController ()

@end

@implementation ForgetPwdViewController
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
    
    //初始化UI
    [self initUI];
    
    //初始化网络服务框架
    cs = [CloudService sharedInstance];
    cs.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    emailFld.delegate = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [emailFld release];
    [super dealloc];
}

#pragma mark 
#pragma mark - Custom Action
- (void) initUI
{
    UILabel *fgPwdLab = [[UILabel alloc]init];
    fgPwdLab.text     = @"忘记密码?";
    fgPwdLab.frame    = [UIView fitCGRect:CGRectMake(110, 80, 100, 30)];
    fgPwdLab.font     = [UIFont systemFontOfSize:20];
    fgPwdLab.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:fgPwdLab];
    [fgPwdLab release];
    
    UILabel *fgInfoLab = [[UILabel alloc]init];
    fgInfoLab.text     = @"请输入您的注册邮箱,系统将会把密码重置邮件发送到您的注册邮箱中!";
    fgInfoLab.frame    = [UIView fitCGRect:CGRectMake(50, 120, 220, 60)];
    fgInfoLab.textAlignment = UITextAlignmentCenter;
    fgInfoLab.lineBreakMode = UILineBreakModeWordWrap;
    fgInfoLab.numberOfLines = 0;
    [self.view addSubview:fgInfoLab];
    [fgInfoLab release];
    
    emailFld = [[UITextField alloc]init];
    emailFld.delegate     = self;
    emailFld.frame        = [UIView fitCGRect:CGRectMake(70, 200, 180, 30)];
    emailFld.borderStyle  = UITextBorderStyleRoundedRect;
    [self.view addSubview:emailFld];

    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = [UIView fitCGRect:CGRectMake(40, 250, 100, 30)];
    [cancelBtn setTitle:@"取消"
               forState:UIControlStateNormal];
    [cancelBtn addTarget:self
                  action:@selector(doCancelBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendBtn.frame = [UIView fitCGRect:CGRectMake(180, 250, 100, 30)];
    [sendBtn setTitle:@"发送"
             forState:UIControlStateNormal];
    [sendBtn addTarget:self
                action:@selector(doSendBtnClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
}

-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark 
#pragma mark - UIButton Clicked Action
- (void) doCancelBtnClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) doSendBtnClicked:(id)sender
{
    if (emailFld.text.length == 0)
    {
        CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
        return;
    }
    
    if (![self isValidateEmail:emailFld.text])
    {
        CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
        return;
    }
    
    NSString *paramJson = [NSString stringWithFormat:@"{\"fid\":\"2\",\"email\":\"%@\"}", emailFld.text];
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
        case kRequestPassword:          //忘记密码
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
            
            //发送成功
            CLog(@"send forget password success!");
            break;
        }
        default:
        {
            CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
            return NO;
            break;
        }
    }
    
    [self dismissModalViewControllerAnimated:YES];
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
