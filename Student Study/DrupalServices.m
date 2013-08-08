//
//  DrupalServices.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/8/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "DrupalServices.h"
#import "AFNetworking.h"

@implementation DrupalServices

- (void) logInWithUsername: (NSString *) username andPassword: (NSString *) password {
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://mywebclass.pavelgatilov.com/mwc_rest_api/user/login"]];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"http://mywebclass.pavelgatilov.com/mwc_rest_api/user/login"
                                                      parameters:@{@"username":username,@"password":password}];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // Print the response body in text
        if (self.delegate && [self.delegate respondsToSelector:@selector(logInSuccessfullyWithServiceResponse:)]) {
            id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            [self.delegate logInSuccessfullyWithServiceResponse:response];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(logInFailedWithError:)]) {
            [self.delegate logInFailedWithError:error];
        }
    }];
    [operation start];
}

- (void) signInWithUsername: (NSString *) username andEmail: (NSString *) email {
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://mywebclass.pavelgatilov.com/mwc_rest_api/user/register"]];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"http://mywebclass.pavelgatilov.com/mwc_rest_api/user/register"
                                    
                                                      parameters:@{@"mail":email,@"name":username}];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // Print the response body in text
        if (self.delegate && [self.delegate respondsToSelector:@selector(signInSuccessfullyWithServiceResponse:)]) {
            id response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            [self.delegate signInSuccessfullyWithServiceResponse:response];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(signInFailedWithError:)]) {
            [self.delegate signInFailedWithError:error];
        }
    }];
    [operation start];
}

@end
