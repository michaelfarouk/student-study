//
//  MainScreen.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/7/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "MainScreen.h"

@interface MainScreen () {
    NSDictionary *dataSourceDictionary;
}

@end

@implementation MainScreen

- (id) initWithLoginData: (NSDictionary *) loginData {
    self = [super initWithNibName:@"MainScreen" bundle:[NSBundle mainBundle]];
    if (self) {
        dataSourceDictionary = loginData;
    }
    return self;
}

#pragma mark - View Life Cycle

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    self.title = [NSString stringWithFormat:@"Hello, %@!",dataSourceDictionary[@"user"][@"name"]];
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Button Actions

@end
