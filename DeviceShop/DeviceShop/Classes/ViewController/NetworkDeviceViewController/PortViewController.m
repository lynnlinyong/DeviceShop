//
//  PortViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "PortViewController.h"

@interface PortViewController ()

@end

@implementation PortViewController

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

- (void) viewDidUnload
{
    portTab.delegate   = nil;
    portTab.dataSource = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [portTab release];
    [super dealloc];
}

#pragma mark
#pragma mark - Custom Action
- (void) initUI
{
    portListArray = [[NSMutableArray alloc]init];
    [portListArray addObject:@"端口1"];
    [portListArray addObject:@"端口2"];
    [portListArray addObject:@"端口3"];
    [portListArray addObject:@"端口4"];
    [portListArray addObject:@"端口5"];
    [portListArray addObject:@"端口6"];
    [portListArray addObject:@"端口7"];
    
    portTab = [[UITableView alloc]init];
    portTab.delegate   = self;
    portTab.dataSource = self;
    portTab.frame = [UIView fitCGRect:CGRectMake(0, 0, 320, 420)];
    [self.view addSubview:portTab];
}


#pragma mark 
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return portListArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel  *titleLab    = nil;
    NSString *idString    = @"idString";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString];
        
        titleLab = [[UILabel alloc]init];
        titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12,
                                                         cell.frame.size.width, 20)];
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.textAlignment   = UITextAlignmentCenter;
        [cell addSubview:titleLab];
    }
    
    NSString *portName = [portListArray objectAtIndex:indexPath.row];
    titleLab.text      = portName;
    [titleLab release];
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
