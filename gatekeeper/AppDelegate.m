//
//  AppDelegate.m
//  gatekeeper
//
//  Created by Shaun Stehly on 6/24/14.
//  Copyright (c) 2014 youtube. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x33549B)];
    
    //LOGIN SCREEN
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
    
    
    // FEED SCREEN
    FeedViewController *feedVC = [[FeedViewController alloc] init];
    UINavigationController *feedNC = [[UINavigationController alloc] initWithRootViewController:feedVC];
    
    
    // REQUESTS SCREEN
    RequestsViewController *requestsVC = [[RequestsViewController alloc] init];
    UINavigationController *requestsNC = [[UINavigationController alloc] initWithRootViewController:requestsVC];
    
    
    // MESSAGES SCREEN
    MessagesViewController *messagesVC = [[MessagesViewController alloc] init];
    UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    
    
    // NOTIFICATIONS SCREEN
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    
    
    // MORE SCREEN
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    UINavigationController *moreNC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    
    
    // TABS VISD
    feedNC.tabBarItem.title = @"News Feed";
    feedNC.tabBarItem.image = [UIImage imageNamed:@"FeedTabImage"];
    requestsNC.tabBarItem.title = @"Requests";
    requestsNC.tabBarItem.image = [UIImage imageNamed:@"RequestsTabImage"];
    messagesNC.tabBarItem.title = @"Messages";
    messagesNC.tabBarItem.image = [UIImage imageNamed:@"MessagesTabImage"];
    notificationsNC.tabBarItem.title = @"Notifications";
    notificationsNC.tabBarItem.image = [UIImage imageNamed:@"NotificationsTabImage"];
    moreNC.tabBarItem.title = @"More";
    moreNC.tabBarItem.image = [UIImage imageNamed:@"MoreTabImage"];
    
    
    // TAB BAR CONTROLLER
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNC, requestsNC, messagesNC, notificationsNC, moreNC];
    feedNC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    self.window.backgroundColor = [UIColor whiteColor];
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
