//
//  AppDelegate.m
//  DeviceShop
//
//  Created by lynn on 13-5-28.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //删除数据库
    if ([[[[FMDatabaseOperate alloc]init]autorelease] removeLocalDB])
    {
        CLog(@"remove db success!");
    }
    
    //第一次启动软件,拷贝数据库
    [[[FMDatabaseOperate alloc]init]autorelease];
    
    /**
     *第一次进入登陆页面，之后直接进入导航页面
     **/
    LoginViewController *lgVc  = [LoginViewController createViewController:[LoginViewController class]];
    UINavigationController *nc = [[[UINavigationController alloc]initWithRootViewController:lgVc]autorelease];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor    = [UIColor whiteColor];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 
#pragma mark - Custom Action
- (BOOL) isFirstLauncher
{
    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:LAUNCHERED];
    if (isFirst)
    {
        //表示不是第一次启动软件
        return NO;
    }
    
    //表示第一次启动软件
    [[NSUserDefaults standardUserDefaults] setBool:YES
                                            forKey:LAUNCHERED];
    
    return YES;
}
@end
