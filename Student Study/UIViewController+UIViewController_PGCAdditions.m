//
//  UIViewController+UIViewController_PGCAdditions.m
//  Student Study
//
//  Created by Pavel Gatilov on 8/7/13.
//  Copyright (c) 2013 Pavel Gatilov. All rights reserved.
//

#import "UIViewController+UIViewController_PGCAdditions.h"

@implementation UIViewController (UIViewController_PGCAdditions)

- (void) showLoadingPopup {
    UIView *blackView = [[UIView alloc] initWithFrame:self.view.frame];
    blackView.backgroundColor = [UIColor darkGrayColor];
    blackView.alpha = 0.15;
    blackView.tag = 1024;
    UIActivityIndicatorView *loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loadingIndicator.center = CGPointMake(blackView.frame.size.width-16, blackView.frame.size.height-16);
    [blackView addSubview:loadingIndicator];
    [self.view addSubview:blackView];
}

- (void) hideLoadingPopup {
    UIView *blackView = [self.view viewWithTag:1024];
    if (blackView) {
        [blackView removeFromSuperview];
    }
}

@end
