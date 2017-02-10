//
//  AppDelegate.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-4.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "AppDelegate.h"
#import "WantViewController.h"
#import "ChatViewController.h"
#import "FriendViewController.h"
#import "MineViewController.h"
#import <SMS_SDK/SMS_SDK.h>
#import "JianjieViewController.h"
#import "TabbarController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];

	//Mob短信验证
	[SMS_SDK registerApp:@"600977ccfab1" withSecret:@"8ef09e58c84f55a1aeb10048a9e44ac9"];
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);

    
    //判断应用是否为第一次启动
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        NSLog(@"第一次启动");
        //进入简介引导
    JianjieViewController *jianjieVcl=[[JianjieViewController alloc] init];
    self.window.rootViewController=jianjieVcl;
////    }
////    else{
////        NSLog(@"不是第一次启动");
//        //进入主界面
//        TabbarController *Tbc=[[TabbarController alloc] init];
//        self.window.rootViewController=Tbc;
//
//    }
    
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	return YES;
    
    
    
    /**********************************************/
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

@end
