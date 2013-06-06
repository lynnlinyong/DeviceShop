//
//  PwdInputPadView.m
//  DeviceShop
//
//  Created by lynn on 13-6-5.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "PwdInputPadView.h"

@implementation PwdInputPadView
@synthesize isClean;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        bgImgView = [[UIImageView alloc]init];
        bgImgView.image = [UIImage imageNamed:@"ip_bg"];
        bgImgView.frame = CGRectMake(   0,   -20, 640/2, 960/2);
        [self addSubview:bgImgView];
        
        txtBgImgView = [[UIImageView alloc]init];
        txtBgImgView.image = [UIImage imageNamed:@"ip_txt_bg"];
        txtBgImgView.frame = CGRectMake(  0, 507/2-20, 640/2,  85/2);
        [self addSubview:txtBgImgView];
        
        txtNum1BgImgView = [[UIImageView alloc]init];
        txtNum1BgImgView.image = [UIImage imageNamed:@"ip_txt_fld1"];
        txtNum1BgImgView.frame = CGRectMake(  83/2, 515/2-20,  90/2,  70/2);
        [self addSubview:txtNum1BgImgView];
        
        txtNum2BgImgView = [[UIImageView alloc]init];
        txtNum2BgImgView.image = [UIImage imageNamed:@"ip_txt_fld2"];
        txtNum2BgImgView.frame = CGRectMake( 211/2, 515/2-20,  90/2,  70/2);
        [self addSubview:txtNum2BgImgView];
        
        txtNum3BgImgView = [[UIImageView alloc]init];
        txtNum3BgImgView.image = [UIImage imageNamed:@"ip_txt_fld3"];
        txtNum3BgImgView.frame = CGRectMake( 338/2, 515/2-20,  90/2,  70/2);
        [self addSubview:txtNum3BgImgView];
        
        txtNum4BgImgView = [[UIImageView alloc]init];
        txtNum4BgImgView.image = [UIImage imageNamed:@"ip_txt_fld4"];
        txtNum4BgImgView.frame = CGRectMake( 466/2, 515/2-20,  90/2,  70/2);
        [self addSubview:txtNum4BgImgView];
        
        oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        oneBtn.tag = 1;
        [oneBtn setImage:[UIImage imageNamed:@"ip_num1"]
                forState:UIControlStateNormal];
        [oneBtn setImage:[UIImage imageNamed:@"ip_num1_hl"]
                forState:UIControlStateHighlighted];
        [oneBtn setFrame:CGRectMake(  32/2, 598/2-20, 188/2,  82/2)];
        [oneBtn addTarget:self
                   action:@selector(numBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:oneBtn];
        
        secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        secondBtn.tag = 2;
        [secondBtn setImage:[UIImage imageNamed:@"ip_num2"]
                   forState:UIControlStateNormal];
        [secondBtn setImage:[UIImage imageNamed:@"ip_num2_hl"]
                   forState:UIControlStateHighlighted];
        [secondBtn setFrame:CGRectMake( 227/2, 598/2-20, 188/2,  82/2)];
        [secondBtn addTarget:self
                      action:@selector(numBtnClicked:)
            forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:secondBtn];
        
        thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        thirdBtn.tag = 3;
        [thirdBtn setImage:[UIImage imageNamed:@"ip_num3"]
                  forState:UIControlStateNormal];
        [thirdBtn setImage:[UIImage imageNamed:@"ip_num3_hl"]
                  forState:UIControlStateHighlighted];
        [thirdBtn setFrame:CGRectMake( 421/2, 598/2-20, 188/2,  82/2)];
        [thirdBtn addTarget:self
                     action:@selector(numBtnClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:thirdBtn];
        
        forthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        forthBtn.tag = 4;
        [forthBtn setImage:[UIImage imageNamed:@"ip_num4"]
                  forState:UIControlStateNormal];
        [forthBtn setImage:[UIImage imageNamed:@"ip_num4_hl"]
                  forState:UIControlStateHighlighted];
        [forthBtn setFrame:CGRectMake(  32/2, 688/2-20, 188/2,  82/2)];
        [forthBtn addTarget:self
                     action:@selector(numBtnClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forthBtn];
        
        fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        fiveBtn.tag = 5;
        [fiveBtn setImage:[UIImage imageNamed:@"ip_num5"]
                 forState:UIControlStateNormal];
        [fiveBtn setImage:[UIImage imageNamed:@"ip_num5_hl"]
                 forState:UIControlStateHighlighted];
        [fiveBtn setFrame:CGRectMake( 227/2, 688/2-20, 188/2,  82/2)];
        [fiveBtn addTarget:self
                    action:@selector(numBtnClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fiveBtn];
        
        sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sixBtn.tag = 6;
        [sixBtn setImage:[UIImage imageNamed:@"ip_num6"]
                forState:UIControlStateNormal];
        [sixBtn setImage:[UIImage imageNamed:@"ip_num6_hl"]
                forState:UIControlStateHighlighted];
        [sixBtn setFrame:CGRectMake( 421/2, 687/2-20, 188/2,  82/2)];
        [sixBtn addTarget:self
                   action:@selector(numBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sixBtn];
        
        sevenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sevenBtn.tag = 7;
        [sevenBtn setImage:[UIImage imageNamed:@"ip_num7"]
                  forState:UIControlStateNormal];
        [sevenBtn setImage:[UIImage imageNamed:@"ip_num7_hl"]
                  forState:UIControlStateHighlighted];
        [sevenBtn setFrame:CGRectMake(  32/2, 778/2-20, 188/2,  82/2)];
        [secondBtn addTarget:self
                      action:@selector(numBtnClicked:)
            forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sevenBtn];
        
        eightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        eightBtn.tag = 8;
        [eightBtn setImage:[UIImage imageNamed:@"ip_num8"]
                  forState:UIControlStateNormal];
        [eightBtn setImage:[UIImage imageNamed:@"ip_num8_hl"]
                  forState:UIControlStateHighlighted];
        [eightBtn setFrame:CGRectMake( 227/2, 778/2-20, 188/2,  82/2)];
        [eightBtn addTarget:self
                     action:@selector(numBtnClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:eightBtn];
        
        nineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        nineBtn.tag = 9;
        [nineBtn setImage:[UIImage imageNamed:@"ip_num9"]
                 forState:UIControlStateNormal];
        [nineBtn setImage:[UIImage imageNamed:@"ip_num9_hl"]
                 forState:UIControlStateHighlighted];
        [nineBtn setFrame:CGRectMake( 421/2, 777/2-20, 188/2,  82/2)];
        [nineBtn addTarget:self
                    action:@selector(numBtnClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:nineBtn];
        
        zeroBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        zeroBtn.tag = 0;
        [zeroBtn setImage:[UIImage imageNamed:@"ip_num0"]
                 forState:UIControlStateNormal];
        [zeroBtn setImage:[UIImage imageNamed:@"ip_num0_hl"]
                 forState:UIControlStateHighlighted];
        [zeroBtn setFrame:CGRectMake( 227/2, 868/2-20, 188/2,  82/2)];
        [zeroBtn addTarget:self
                    action:@selector(numBtnClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:zeroBtn];
        
        spaceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [spaceBtn setImage:[UIImage imageNamed:@"ip_space"]
                  forState:UIControlStateNormal];
        [spaceBtn setImage:[UIImage imageNamed:@"ip_space_hl"]
                  forState:UIControlStateHighlighted];
        [spaceBtn setFrame:CGRectMake(  33/2, 868/2-20, 186/2,  80/2)];
        [self addSubview:spaceBtn];
        
        delAndCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [delAndCancelBtn setImage:[UIImage imageNamed:@"ip_cancel"]
                         forState:UIControlStateNormal];
        [delAndCancelBtn setImage:[UIImage imageNamed:@"ip_cancel_hl"]
                         forState:UIControlStateHighlighted];
        [delAndCancelBtn setFrame:CGRectMake( 420/2, 868/2-20, 188/2,  82/2)];
        [delAndCancelBtn addTarget:self
                            action:@selector(delOrCancelBtnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:delAndCancelBtn];
        
        password = [[NSMutableString alloc]init];
        [self setValue:password
                forKey:PASSWORD_KEY];
        [self addObserver:self
                   forKeyPath:PASSWORD_KEY
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    }
    return self;
}

- (void) dealloc
{
    [bgImgView release];
    [password  release];
    [txtBgImgView release];
    [txtNum1BgImgView release];
    [txtNum2BgImgView release];
    [txtNum3BgImgView release];
    [txtNum4BgImgView release];
    
    [self removeObserver:self
              forKeyPath:PASSWORD_KEY];
    [super dealloc];
}

#pragma mark 
#pragma mark Custom Action
- (void) setIsClean:(BOOL)clean
{
    if (clean)
    {
        [password release];
        password = [[NSMutableString alloc]init];
    }
    
    isClean = clean;
}

#pragma mark
#pragma mark - UIButton Clicked Action
- (void) numBtnClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [password appendString:[NSString stringWithFormat:@"%d", button.tag]];
    [self setValue:password
            forKey:PASSWORD_KEY];
}

- (void) delOrCancelBtnClicked:(id)sender
{
    
}

#pragma mark 
#pragma mark KVO
- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object change:(NSDictionary *)change
                        context:(void *)context
{
    if ([keyPath isEqualToString:PASSWORD_KEY])
    {
        NSMutableString *pwd = [self valueForKey:PASSWORD_KEY];
        if (pwd.length == 4)
        {
            if (delegate)
            {
                if ([delegate respondsToSelector:@selector(inputPad:password:)])
                {
                    [delegate inputPad:self password:pwd];
                }
                else
                {
                    CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
                }
            }
            else
            {
                CLog(@"ERROR:Func:%s, LINE:%d", __func__, __LINE__);
            }
        }
    }
}
@end
