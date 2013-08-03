//
//  SignInScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "SignInScreen.h"

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
            } else {
                // wtf?
            }
        }
    }
    return YES;
}

@end
