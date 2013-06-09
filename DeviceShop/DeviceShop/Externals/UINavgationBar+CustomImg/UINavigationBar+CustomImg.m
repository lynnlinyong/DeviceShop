//
//  UINavigationBar+CustomImg.m
//  DeviceShop
//
//  Created by lynn on 13-6-6.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "UINavigationBar+CustomImg.h"

#define kSCNavBarImageTag 10

@implementation UINavigationBar (CustomImg)

- (UINavigationBar *) setNavBarBackgroup:(UIViewController *) vc
{
    CGRect frame = vc.navigationController.navigationBar.frame;
    UINavigationBar *navBar = [[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)]autorelease];
    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        //if iOS 5.0 and later
        [navBar setBackgroundImage:[UIImage imageNamed:@"cb_navbar_bg"]
                     forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavBarImageTag];
        if (imageView == nil)
        {
            imageView = [[UIImageView alloc] initWithImage:
                         [UIImage imageNamed:@"cb_navbar_bg"]];
            [imageView setTag:kSCNavBarImageTag];
            [navBar insertSubview:imageView atIndex:0];
            [imageView release];
            
        }
    }
}
@end
