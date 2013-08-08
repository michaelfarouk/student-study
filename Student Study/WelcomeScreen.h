//
//  WelcomeScreen.h
//  Student Study
//
//  Created by Pavel Gatilov on 8/3/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrupalServices.h"

@interface WelcomeScreen : UIViewController <DrupalServicesDelegate>

- (IBAction) signUpWithEmailButtonClicked: (UIButton *) sender;
- (IBAction) logInButtonClicked: (UIButton *) sender;
- (IBAction) connectWithFacebookButtonClicked: (UIButton *) sender;

@end
