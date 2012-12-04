//
//  UIButton+Callout.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "UIButton+Callout.h"

#import "COCalloutView.h"

#import <objc/runtime.h>

@implementation UIButton (Callout)



- (void) showCalloutWithText:(NSString *)text{
    
    COCalloutView *callout = [[COCalloutView alloc] initWithParentView:self];
    
    [self setCallout:callout];

    [callout show];
}

#pragma mark - Callout View

static char *kCalloutKey = "callout";

- (void) setCallout:(COCalloutView *)callout{
    objc_setAssociatedObject(self, kCalloutKey, callout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (COCalloutView *) callout{
    objc_getAssociatedObject(self, kCalloutKey);
}

@end
