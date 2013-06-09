//
//  RecoverViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "RecoverViewController.h"

@interface RecoverViewController ()

@end

@implementation RecoverViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void) viewDidUnload
{
    backTab.delegate   = nil;
    backTab.dataSource = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [backListArray removeAllObjects];
    [backListArray release];
    
    [super dealloc];
}

#pragma mark
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"备份列表";
    
    backListArray = [[NSMutableArray alloc]init];
    
    backTab = [[UITableView alloc]init];
    backTab.delegate   = self;
    backTab.dataSource = self;
    backTab.frame      = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:backTab];
}



@end
