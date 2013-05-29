//
//  UIViewController+UIViewControllerNib.h
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIViewControllerNib)

//创建自动适应iphone和iPad的视图控制器
+ (id) createViewController:(Class) className;

@end
