//
//  COAppDelegate.h
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class COViewController;

@interface COAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) COViewController *viewController;

@end
