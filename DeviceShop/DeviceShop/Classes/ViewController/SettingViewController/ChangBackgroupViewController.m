//
//  ChangBackgroupViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "ChangBackgroupViewController.h"

@interface ChangBackgroupViewController ()

@end

@implementation ChangBackgroupViewController

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
 
    [self initUI];
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
    self.title = @"更换背景";
    
    UINavigationBar *navBar = [self.navigationController.navigationBar setNavBarBackgroup:self];
}
@end
