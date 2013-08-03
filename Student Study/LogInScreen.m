//
//  LogInScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "LogInScreen.h"

@interface LogInScreen ()

@end

@implementation LogInScreen

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Button Actions

- (IBAction) logInButtonClicked:(UIButton *) sender {
    
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
        } else {
            // wtf ?
        }
    }
    return YES;
}

@end
