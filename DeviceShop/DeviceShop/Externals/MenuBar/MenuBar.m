//
//  MenuBar.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "MenuBar.h"

@implementation MenuBar
@synthesize isSpread;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width  = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.isSpread = YES;
        
        mainBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        mainBtn.tag   = 0;
        [mainBtn addTarget:self
                    action:@selector(doButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        mainBtn.frame = CGRectMake(10, height/3, width/7, height*2/3);
        [mainBtn setTitle:@"首页"
                 forState:UIControlStateNormal];
        [self addSubview:mainBtn];
        
        devLibBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        devLibBtn.tag   = 1;
        [devLibBtn addTarget:self
                      action:@selector(doButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
        devLibBtn.frame = CGRectMake(10*2+width/7, height/3, width/7, height*2/3);
        [devLibBtn setTitle:@"设备库"
                   forState:UIControlStateNormal];
        [self addSubview:devLibBtn];
        
        editBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        editBtn.tag   = 2;
        [editBtn addTarget:self
                    action:@selector(doButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        editBtn.frame = CGRectMake(10*3+width/7*2, height/3, width/7, height*2/3);
        [editBtn setTitle:@"编辑"
                 forState:UIControlStateNormal];
        [self addSubview:editBtn];
        
        networkBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        networkBtn.tag   = 3;
        [networkBtn addTarget:self
                       action:@selector(doButtonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
        networkBtn.frame = CGRectMake(10*4+width/7*3, height/3, width/7, height*2/3);
        [networkBtn setTitle:@"网络"
                    forState:UIControlStateNormal];
        [self addSubview:networkBtn];
        
        setBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        setBtn.tag   = 4;
        [setBtn addTarget:self
                   action:@selector(doButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        setBtn.frame = CGRectMake(10*5+width/7*4, height/3, width/7, height*2/3);
        [setBtn setTitle:@"设置"
                forState:UIControlStateNormal];
        [self addSubview:setBtn];
        
        hidBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        hidBtn.frame = CGRectMake(10*6+width/7*5, height/3, width/7, height*2/3);
        [hidBtn setTitle:@"隐藏"
                forState:UIControlStateNormal];
        [hidBtn addTarget:self
                   action:@selector(doHiddenBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hidBtn];
    }
    return self;
}

#pragma mark 
#pragma mark - Custom Action

- (void) setIsSpread:(BOOL)spread
{
    if (spread)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                 target:self
                                               selector:@selector(doTimerAction:)
                                               userInfo:nil
                                                repeats:NO];
    }
    
    isSpread = spread;
}

- (void) doTimerAction:(id)sender
{
    //停止timer
    [timer invalidate];
    
    [self doHiddenBtnClicked:hidBtn];
}

#pragma mark
#pragma mark - UItouch Event
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /**
     * 监测触摸时,重新记时.
     **/
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                             target:self
                                           selector:@selector(doTimerAction:)
                                           userInfo:nil
                                            repeats:NO];
}

#pragma mark
#pragma mark - UIButton Clicked Action
- (void) doHiddenBtnClicked:(id)sender
{
    CGFloat posY   = self.frame.origin.y;
    CGFloat width  = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    if (isSpread)  //菜单展开
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(-width+width/7-20, posY, width, height);
        }];
    }
    else           //菜单隐藏
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(0, posY, width, height);
        }];
    }
    
    self.isSpread = !isSpread;
}

- (void) doButtonClicked:(id)sender
{
    UIButton *clickBtn = sender;
    if (delegate)
    {
        if ([delegate respondsToSelector:@selector(MenuBar:buttonClicked:)])
        {
            [delegate MenuBar:self
                buttonClicked:clickBtn.tag];
        }
    }
}
@end
