//
//  RegistViewController.h
//  DeviceShop
//
//  Created by lynn on 13-5-29.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController <
                                                    UITextFieldDelegate,
                                                    CloudServiceDelegate>
{
    CloudService *cs;
}

@property (nonatomic, retain) UITextField *pwdFld;
@property (nonatomic, retain) UITextField *emailFld;
@property (nonatomic, retain) UITextField *rePwdFld;
@end
