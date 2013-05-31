//
//  ForgetPwdViewController.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPwdViewController : UIViewController <
                                                       UITextFieldDelegate,
                                                       CloudServiceDelegate>
{
    CloudService    *cs;
}

@property (nonatomic, retain) UITextField   *emailFld;
@end
