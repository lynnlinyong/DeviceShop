//
//  UIViewController+ShowInfoDialog.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "UIViewController+ShowInfoDialog.h"

@implementation UIViewController (ShowInfoDialog)

- (void) showAlertWithTitle:(NSString *)title
                    message:(NSString *) message
                   delegate:(id)delegate
          otherButtonTitles:(id)btnTitleObj, ...
{
    UIAlertView *alertView = [[UIAlertView alloc]init];
    [alertView setTitle:title];
    [alertView setMessage:message];
    [alertView setDelegate:delegate];
    
    va_list args;
    va_start(args, btnTitleObj);
    if (btnTitleObj != nil)
    {
        [alertView addButtonWithTitle:btnTitleObj];
        id nextTitle = nil;
        while ((nextTitle = va_arg(args, id)) != nil)
        {
            [alertView addButtonWithTitle:nextTitle];
        }
    }
    [alertView setCancelButtonIndex:0];
    
    [alertView show];
    [alertView release];
}
@end
