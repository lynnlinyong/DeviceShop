//
//  PwdInputPadView.h
//  DeviceShop
//
//  Created by lynn on 13-6-5.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  PASSWORD_KEY   @"password"

@class PwdInputPadView;
@protocol PwdInputPadViewDelegate <NSObject>

- (void) inputPad:(PwdInputPadView *) pad password:(NSMutableString *) pwd;

@end

@interface PwdInputPadView : UIView
{
    UIImageView   *bgImgView;
    UIImageView   *txtBgImgView;
    UIImageView   *txtNum1BgImgView;
    UIImageView   *txtNum2BgImgView;
    UIImageView   *txtNum3BgImgView;
    UIImageView   *txtNum4BgImgView;
    
    UIButton      *oneBtn;
    UIButton      *secondBtn;
    UIButton      *thirdBtn;
    UIButton      *forthBtn;
    UIButton      *fiveBtn;
    UIButton      *sixBtn;
    UIButton      *sevenBtn;
    UIButton      *eightBtn;
    UIButton      *nineBtn;
    UIButton      *zeroBtn;
    UIButton      *spaceBtn;
    UIButton      *delAndCancelBtn;
    
    NSMutableString *password;
    
    id<PwdInputPadViewDelegate> delegate;
}

@property (nonatomic, assign) BOOL isClean;
@property (nonatomic, assign) id<PwdInputPadViewDelegate> delegate;

@end
