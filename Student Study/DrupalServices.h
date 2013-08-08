//
//  DrupalServices.h
//  Student Study
//
//  Created by Pavel Gatilov on 8/8/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DrupalServicesDelegate <NSObject>

@optional

- (void) logInSuccessfullyWithServiceResponse: (NSDictionary *) response;
- (void) logInFailedWithError: (NSError *) error;

- (void) signInSuccessfullyWithServiceResponse: (NSDictionary *) response;
- (void) signInFailedWithError: (NSError *) error;

@end


@interface DrupalServices : NSObject <DrupalServicesDelegate>

@property (nonatomic, assign) NSObject<DrupalServicesDelegate> *delegate;

- (void) logInWithUsername: (NSString *) username andPassword: (NSString *) password;
- (void) signInWithUsername: (NSString *) username andEmail: (NSString *) email;

@end