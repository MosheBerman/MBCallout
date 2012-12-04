//
//  UIButton+Callout.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "UIButton+Callout.h"

#import "MBCalloutView.h"

#import <objc/runtime.h>

@implementation UIButton (Callout)

- (void) showCalloutWithText:(NSString *)text{

    
    if (![self callout]) {
        MBCalloutView *callout = [[MBCalloutView alloc] initWithParentView:self];
        [self setCallout:callout];
    }
    
    [[self callout] show];
}

#pragma mark - Callout View

static char *kCalloutKey = "callout";

- (void) setCallout:(MBCalloutView *)callout{
    objc_setAssociatedObject(self, kCalloutKey, callout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBCalloutView *) callout{
   return objc_getAssociatedObject(self, kCalloutKey);
}

#pragma mark - Callout Title

static char *kCalloutTitleKey = "callout title";

- (void) setCalloutTitle:(NSString *)title{
    objc_setAssociatedObject(self, kCalloutTitleKey, title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)calloutTitle{
    return objc_getAssociatedObject(self, kCalloutTitleKey);
}

@end
