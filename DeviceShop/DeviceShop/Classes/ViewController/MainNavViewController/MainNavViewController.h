//
//  MainNavViewController.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainNavViewController : UIViewController<
                                                    MenuBarDelegate,
                                                    UIScrollViewDelegate,
                                                    BJGridItemDelegate,
                                                    PwdInputPadViewDelegate,
                                                    UIGestureRecognizerDelegate>
{
    
}

@property (nonatomic, retain) MenuBar       *mb;
@property (nonatomic, retain) UIPageControl *pageCtrl;
@property (nonatomic, retain) UIScrollView  *deviceScrollView;
@end
