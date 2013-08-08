//
//  LogInScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "LogInScreen.h"
#import "AFNetworking.h"
#import "MainScreen.h"
#import "UIViewController+UIViewController_PGCAdditions.h"

@interface LogInScreen ()

@end

@implementation LogInScreen

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Button Actions

- (IBAction) logInButtonClicked: (UIButton *) sender {
    [self logIn];
}

- (IBAction) forgottenPasswordButtonClicked: (UIButton *) sender {
    
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    if (textField == self.emailTextField) {
        //return tap on email text field
        [self.passwordTextField becomeFirstResponder];//assign new fr
    } else {
        if (textField == self.passwordTextField) {
            //go to next VC
            [self logIn];
        } else {
            // wtf ?
        }
    }
    return YES;
}

#pragma mark - Main Actions

- (void) logIn {
    NSString *username = self.emailTextField.text; //take username
    NSString *password = self.passwordTextField.text; //take password
    DrupalServices *drupalServices = [[DrupalServices alloc] init];
    drupalServices.delegate = self;
    if (![username isEqualToString:@""]) {
        if (![password isEqualToString:@""]) {
            [self showLoadingPopup];
            [drupalServices logInWithUsername:username andPassword:password];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill password field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill username field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark - DrupalServicesDelegate

- (void) logInSuccessfullyWithServiceResponse: (NSDictionary *) response {
    [self hideLoadingPopup];
    MainScreen *mainScreen = [[MainScreen alloc] initWithLoginData:response];
    [self.navigationController pushViewController:mainScreen animated:YES];
}

- (void) logInFailedWithError: (NSError *) error {
    [self hideLoadingPopup];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect user data or server not responding" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

@end
