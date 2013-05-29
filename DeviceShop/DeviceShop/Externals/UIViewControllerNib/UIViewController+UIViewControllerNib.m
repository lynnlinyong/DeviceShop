//
//  UIViewController+UIViewControllerNib.m
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "UIViewController+UIViewControllerNib.h"

@implementation UIViewController (UIViewControllerNib)

+ (id) createViewController:(Class) className
{
    NSAssert(className, @"Function Parameter can't is NULL!");
    NSString *nibName = NSStringFromClass(className);
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        nibName = [NSString stringWithFormat:@"%@_Ipad", nibName];
    }
    
    id viewCtr = [[[className alloc]initWithNibName:nibName
                                             bundle:NULL]autorelease];
    return viewCtr;
}

@end
