//
//  ShareManagerViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "ShareManagerViewController.h"

@interface ShareManagerViewController ()

@end

@implementation ShareManagerViewController

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
    
    //初始化界面
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
    shareTab.delegate   = nil;
    shareTab.dataSource = nil;
    
    [super viewDidUnload];
}

- (void) dealloc
{
    [shareListArray removeAllObjects];
    [shareListArray release];
    
    [shareTab release];
    [super dealloc];
}

#pragma mark 
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"分享管理";
    
    shareListArray = [[NSMutableArray alloc]init];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    [shareListArray addObject:@"lynn.linyong@gmail.com"];
    
    shareTab = [[UITableView alloc]init];
    shareTab.delegate   = self;
    shareTab.dataSource = self;
    shareTab.frame = CGRectMake(0, 0, 320, 460);
    [self.view addSubview:shareTab];
}


#pragma mark 
#pragma mark - UITableViewDelegate and UITableviewDatasource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return shareListArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UILabel *titleLab     = nil;
    NSString *idString    = @"idString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString];
        titleLab = [[UILabel alloc]init];
        [cell addSubview:titleLab];
    }
    
    titleLab.text     = [shareListArray objectAtIndex:indexPath.row];
    titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12,
                                cell.frame.size.width, 20)];
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.textAlignment   = UITextAlignmentCenter;
    [titleLab release];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
