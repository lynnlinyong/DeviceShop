//
//  SettingViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    self.title = @"设置";
    
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
    setTab.delegate   = nil;
    setTab.dataSource = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [setTab release];
    [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark
#pragma mark - Custom Action
- (void) initUI
{
    setTab = [[UITableView alloc] initWithFrame:[UIView fitCGRect:CGRectMake(0, 0, 320, 420)]
                                          style:UITableViewStyleGrouped];
    setTab.delegate   = self;
    setTab.dataSource = self;
    [self.view addSubview:setTab];
    
    mb = [[MenuBar alloc]initWithFrame:[UIView fitCGRect:CGRectMake(0, 380, 300, 40)]];
    mb.delegate = self;
    [self.view addSubview:mb];
}

#pragma mark 
#pragma mark UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 5;
            break;
        }
        case 1:
        {
            return 2;
            break;
        }
        case 2:
        {
            return 2;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return @"设置&帮助";
            break;
        }
        case 1:
        {
            return @"备份&恢复";
            break;
        }
        case 2:
        {
            return @"";
            break;
        }
        default:
            break;
    }
    
    return @"";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    switch (indexPath.section)
    {
        case 0:             //设置&帮助
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"更换背景";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12,
                                                    cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 1:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"设置网络控制密码";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 2:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"网络用户名";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 3:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"密码";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 4:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"帮助";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:             //备份&恢复
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"备份";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 1:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"恢复";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:             //注销&分享
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"分享管理";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                case 1:
                {
                    UILabel *titleLab = [[UILabel alloc]init];
                    titleLab.text     = @"注销";
                    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12, cell.frame.size.width, 20)];
                    titleLab.backgroundColor = [UIColor clearColor];
                    titleLab.textAlignment   = UITextAlignmentCenter;
                    [cell addSubview:titleLab];
                    [titleLab release];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section)
    {
        case 0:             //设置&帮助
        {
            switch (indexPath.row)
            {
                case 0:         //更换背景
                {
                    ChangBackgroupViewController *cbVc = [ChangBackgroupViewController createViewController:[ChangBackgroupViewController class]];
                    [self.navigationController pushViewController:cbVc
                                                         animated:YES];
                    break;
                }
                case 1:         //设置网络控制密码
                {
                    break;
                }
                case 2:         //网络用户名
                {
                    break;
                }
                case 3:         //密码
                {
                    break;
                }
                case 4:         //帮助
                {
                    HelpViewController *hpVc = [HelpViewController createViewController:[HelpViewController class]];
                    [self.navigationController pushViewController:hpVc
                                                         animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:             //备份&恢复
        {
            switch (indexPath.row)
            {
                case 0:     //备份
                {
                    break;
                }
                case 1:     //恢复
                {
                    break;
                }
                case 2:     //分享管理&注销
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:             //分享管理&注销
        {
            switch (indexPath.row)
            {
                case 0:     //分享管理
                {
                    ShareManagerViewController *smVc = [ShareManagerViewController createViewController:[ShareManagerViewController class]];
                    [self.navigationController pushViewController:smVc
                                                         animated:YES];
                    break;
                }
                case 1:     //注销
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark 
#pragma mark - MenuBarDelegate
- (void) MenuBar:(MenuBar *)menuBar buttonClicked:(int)index
{
    switch (index)
    {
        case 0:             //首页
        {
            MainNavViewController *mVc = [MainNavViewController createViewController:[MainNavViewController class]];
            [self.navigationController pushViewController:mVc
                                                 animated:YES];
            break;
        }
        case 1:             //设备库
        {
            DeviceLibraryViewController *dlVc = [UIViewController createViewController:[DeviceLibraryViewController class]];
            [self.navigationController pushViewController:dlVc
                                                 animated:YES];
            break;
        }
        case 2:             //编辑
        {
            EditViewController *eVc = [EditViewController createViewController:[EditViewController class]];
            [self.navigationController pushViewController:eVc
                                                 animated:YES];
            break;
        }
        case 3:             //网络设置
        {
            NetworkDeviceViewController *ndVc = [NetworkDeviceViewController createViewController:[NetworkDeviceViewController class]];
            [self.navigationController pushViewController:ndVc
                                                 animated:YES];
            break;
        }
        case 4:             //设置
        {
//            SettingViewController *sVc = [SettingViewController createViewController:[SettingViewController class]];
//            [self.navigationController pushViewController:sVc
//                                                 animated:YES];
            break;
        }
        default:
        {
            CLog(@"ERROR:Func:%s, Line:%d", __func__, __LINE__);
            break;
        }
    }
}
@end
