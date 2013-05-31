//
//  UIViewController+ShowInfoDialog.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowInfoDialog)
- (void) showAlertWithTitle:(NSString *)title
                    message:(NSString *) message
                   delegate:(id)delegate
          otherButtonTitles:(id)btnTitleObj, ...;
@end
