//
//  MenuBar.h
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuBar;
@protocol MenuBarDelegate <NSObject>

- (void)MenuBar:(MenuBar *)menuBar buttonClicked:(int) index;

@end


@interface MenuBar : UIView
{
    BOOL        isSpread;     //是否展开
    NSTimer     *timer;
    
    UIButton    *mainBtn;     //首页
    UIButton    *devLibBtn;   //设备库
    UIButton    *editBtn;     //编辑
    UIButton    *networkBtn;  //网络
    UIButton    *setBtn;      //设置按钮
    UIButton    *hidBtn;      //隐藏按钮
    
    id<MenuBarDelegate> delegate;
}

@property (nonatomic, assign) BOOL isSpread;
@property (nonatomic, assign) id<MenuBarDelegate> delegate;

@end
