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
#import <FacebookSDK/FacebookSDK.h>
#import "UIViewController+UIViewController_PGCAdditions.h"

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

- (IBAction) connectWithFacebookButtonClicked: (UIButton *) sender {
    NSArray *permissions = [NSArray arrayWithObjects:@"email", nil];
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                      /* handle success + failure in block */
                                      if (status == FBSessionStateOpen) {
                                          [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                                              if (!error) {
                                                  [self showLoadingPopup];
                                                  DrupalServices *drupalServices = [DrupalServices new];
                                                  drupalServices.delegate = self;
                                                  [drupalServices signInWithUsername:[user objectForKey:@"email"] andEmail:[user objectForKey:@"email"]];
                                              }
                                          }];
                                      }
                                  }];
}

#pragma mark - DrupalServicesDelegate

- (void) signInSuccessfullyWithServiceResponse: (NSDictionary *) response {
    [self hideLoadingPopup];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You for registration" message:@"Read email message to complete registration" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (void) signInFailedWithError: (NSError *) error {
    [self hideLoadingPopup];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Some error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
}

@end
