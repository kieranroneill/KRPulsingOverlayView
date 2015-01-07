//
//  AppDelegate.m
//  KRPulsingOverlayViewDemo
//
//  Created by Kieran O'Neill on 07/01/2015.
//  Copyright (c) 2015 Kieran O'Neill. All rights reserved.
//

#import "AppDelegate.h"

#import "KRPulsingOverlayViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = (KRPulsingOverlayViewController*) [[KRPulsingOverlayViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
