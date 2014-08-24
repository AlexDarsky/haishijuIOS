//
//  HaishijuAppDelegate.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuAppDelegate.h"

#import "HaishijuViewController.h"

@implementation HaishijuAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20)];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    // Override point for customization after application launch.
    if ([[UIScreen mainScreen] bounds].size.height>480.00)
    {
        self.viewController = [[HaishijuViewController alloc] initWithNibName:@"HaishijuViewController_4" bundle:nil];
 
    }else
    {
        self.viewController = [[HaishijuViewController alloc] initWithNibName:@"HaishijuViewController" bundle:nil];

    }
        UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = navigationController;
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

@end
