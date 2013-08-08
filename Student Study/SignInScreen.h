//
//  SignInScreen.h
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrupalServices.h"

@interface SignInScreen : UIViewController <UITextFieldDelegate, DrupalServicesDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)signUpButtonClicked:(UIButton *)sender;

@end
