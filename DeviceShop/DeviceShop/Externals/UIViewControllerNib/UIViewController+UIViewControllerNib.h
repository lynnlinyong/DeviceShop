//
//  UIViewController+UIViewControllerNib.h
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIViewControllerNib)
+ (id) createViewController:(Class) className;
@end
