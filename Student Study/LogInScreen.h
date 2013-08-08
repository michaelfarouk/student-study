//
//  LogInScreen.h
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrupalServices.h"

@interface LogInScreen : UIViewController <UITextFieldDelegate, DrupalServicesDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction) logInButtonClicked:(UIButton *) sender;
- (IBAction) forgottenPasswordButtonClicked: (UIButton *) sender;

@end
