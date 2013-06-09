//
//  RecoverViewController.h
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecoverViewController : UIViewController<
                                                    UITableViewDelegate,
                                                    UITableViewDataSource>
{
    NSMutableArray    *backListArray;
    UITableView       *backTab;
}

@end
