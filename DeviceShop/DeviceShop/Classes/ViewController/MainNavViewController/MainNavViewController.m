//
//  MainNavViewController.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "MainNavViewController.h"

@interface MainNavViewController ()

@end

@implementation MainNavViewController
@synthesize mb;
@synthesize pageCtrl;
@synthesize deviceScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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

- (void) viewDidUnload
{
    deviceScrollView.delegate = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [pageCtrl release];
    [deviceScrollView  release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark 
#pragma mark - Custom Action
- (void) initUI
{
    CGRect bounds = self.view.frame;                //获取界面区域
    
    deviceScrollView = [[UIScrollView alloc]init];
    [deviceScrollView setContentSize:CGSizeMake(bounds.size.width*3, bounds.size.height)];
    deviceScrollView.frame         = [UIView fitCGRect:CGRectMake(0, 0, 320, 460-30)];
    deviceScrollView.delegate      = self;
    deviceScrollView.pagingEnabled = YES;
    deviceScrollView.showsHorizontalScrollIndicator = NO;
    deviceScrollView.showsVerticalScrollIndicator   = NO;
    [self.view addSubview:deviceScrollView];
    
    //创建UIPageControl
    pageCtrl       = [[UIPageControl alloc] init];
    pageCtrl.frame = [UIView fitCGRect:CGRectMake(0, 460-30, 320, 30)];                                           //创建UIPageControl,位置在屏幕最下方
    pageCtrl.numberOfPages   = 3;                       //总的图片页数
    pageCtrl.currentPage     = 0;                       //当前页
    pageCtrl.backgroundColor = [UIColor blackColor];
    [pageCtrl addTarget:self
                 action:@selector(pageTurn:)
       forControlEvents:UIControlEventValueChanged];    //用户点击UIPageControl的响应函数
    [self.view addSubview:pageCtrl];                    //将UIPageControl添加到主界面上。
    
    mb = [[MenuBar alloc]initWithFrame:[UIView fitCGRect:CGRectMake(0, 380, 300, 40)]];
    mb.delegate = self;
    [self.view addSubview:mb];
    
//    PwdInputPadView *ip = [[PwdInputPadView alloc]initWithFrame:[UIView fitCGRect:CGRectMake(0, 0, 320, 460)]];
//    ip.delegate = self;
//    [self.view addSubview:ip];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds  = scrollView.frame;
    [pageCtrl setCurrentPage:offset.x / bounds.size.width];
}

- (void)pageTurn:(UIPageControl*)sender
{
    //令UIScrollView做出相应的滑动显示
    CGSize viewSize = deviceScrollView.frame.size;
    CGRect rect     = CGRectMake(sender.currentPage*viewSize.width,
                                                                 0,
                                                    viewSize.width,
                                                    viewSize.height);
    [deviceScrollView scrollRectToVisible:rect
                                 animated:YES];
}

#pragma mark 
#pragma mark MenuBarDelegate
- (void) MenuBar:(id)menuBar buttonClicked:(int)index
{
    switch (index)
    {
        case 0:             //首页
        {
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
            SettingViewController *sVc = [SettingViewController createViewController:[SettingViewController class]];
            [self.navigationController pushViewController:sVc
                                                 animated:YES];
            break;
        }
        default:
        {
            CLog(@"ERROR:Func:%s, Line:%d", __func__, __LINE__);
            break;
        }
    }
}

#pragma mark 
#pragma mark - PwdInputPadViewDelegate
- (void) inputPad:(PwdInputPadView *)pad password:(NSMutableString *)pwd
{
    if ([pwd isEqualToString:@"1234"])
    {
        CLog(@"That's good!");
    }
    else
    {
        CLog(@"it's error!");
        
        //清除密码
        pad.isClean = YES;
    }
}
@end
