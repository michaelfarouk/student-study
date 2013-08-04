//
//  WelcomeScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "WelcomeScreen.h"
#import "SignInScreen.h"
#import "LogInScreen.h"
#import "DIOSNode.h"

@interface WelcomeScreen ()

@end

@implementation WelcomeScreen

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - Button Actions

- (IBAction) signUpWithEmailButtonClicked: (UIButton *) sender {
    SignInScreen *signIn = [[SignInScreen alloc] initWithNibName:@"SignInScreen" bundle:[NSBundle mainBundle]]; // create and init sign up screen
    [self.navigationController pushViewController:signIn animated:YES]; //push sign up screen through main navigation controller
}

- (IBAction) logInButtonClicked: (UIButton *) sender {
    LogInScreen *logIn = [[LogInScreen alloc] initWithNibName:@"LogInScreen" bundle:[NSBundle mainBundle]]; // create and init login screen
    [self.navigationController pushViewController:logIn animated:YES]; // push login through main nav controllerd
}

@end
