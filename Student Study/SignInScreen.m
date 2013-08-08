//
//  SignInScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "SignInScreen.h"
#import "AFNetworking.h"
#import "MainScreen.h"
#import "UIViewController+UIViewController_PGCAdditions.h"

@interface SignInScreen ()

@end

@implementation SignInScreen

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    if (textField == self.usernameTextField) {
        // return tap when first responder = username text field
        [self.emailTextField becomeFirstResponder];//assign next tf first responder
    } else {
        if (textField == self.emailTextField) {
            // return tap when first responder = email text field
            [self.passwordField becomeFirstResponder];//assign next tf first responder
        } else {
            if (textField == self.passwordField) {
                // return tap when first responder = password text field
                /*show next VC*/
                [self signUp];
            } else {
                // wtf?
            }
        }
    }
    return YES;
}

#pragma mark - Button Actions

- (IBAction) signUpButtonClicked: (UIButton *) sender {
    [self signUp];
}

#pragma mark - Main Actions

- (void) signUp {
    NSString *email = self.emailTextField.text; //take email
    NSString *username = self.usernameTextField.text; //take username
    DrupalServices *drupalServices = [DrupalServices new];
    drupalServices.delegate = self;
    if (![email isEqualToString:@""]) {
        if (![username isEqualToString:@""]) {
            [self showLoadingPopup];
            [drupalServices signInWithUsername:username andEmail:email];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill username field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill email field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark - DrupalServicesDelegate

- (void) signInSuccessfullyWithServiceResponse: (NSDictionary *) response {
    [self hideLoadingPopup];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You for registration" message:@"Read email message to complete registration" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) signInFailedWithError: (NSError *) error {
    [self hideLoadingPopup];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Some error (maybe wrong email address)" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

@end
