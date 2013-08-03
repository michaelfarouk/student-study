//
//  AppDelegate.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeScreen.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:[[WelcomeScreen alloc] initWithNibName:@"WelcomeScreen" bundle:[NSBundle mainBundle]]]; // create main navigation controller with root welcome screen
    self.window.rootViewController = mainNav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
