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

@interface WelcomeScreen ()

@end

@implementation WelcomeScreen

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Button Actions

- (IBAction) signUpWithEmailButtonClicked: (UIButton *) sender {
    SignInScreen *signIn = [[SignInScreen alloc] initWithNibName:@"SignInScreen" bundle:[NSBundle mainBundle]]; // create and init sign up screen
    [self.navigationController pushViewController:signIn animated:YES]; //push sign up screen through main navigation controller
}

@end
