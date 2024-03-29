//
//  UIButton+Callout.h
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Callout)

- (void) showCalloutWithTitle:(NSString *)title;
- (void) showCallout;

- (void) setCalloutTitle:(NSString *)title;
- (NSString *)calloutTitle;

@end
