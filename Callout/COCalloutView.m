//
//  COCalloutView.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "COCalloutView.h"

#import <QuartzCore/QuartzCore.h>

@interface COCalloutView ()

@property (nonatomic, assign) UIView *parent;
@property (nonatomic, strong) NSString *title;

@end

@implementation COCalloutView

- (id)initWithParentView:(UIView *)parent{
    self = [self initWithParentView:parent andTitle:@""];
    return self;
}

//
//  Designated initializer
//

- (id)initWithParentView:(UIView *)parent andTitle:(NSString *)title{
    self =  [self initWithFrame:CGRectMake(0, 0, 290, 50)];
    
    if (self) {
        _parent = parent;
        _title = title;
        [self setCenter:[self adjustedCenter]];
        
        [[self layer] setBorderColor:[UIColor darkGrayColor].CGColor];
        [[self layer] setBorderWidth:1.0];
        [[self layer] setCornerRadius:5];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


#pragma mark - Show in view

- (void) show{
    
    //
    //  Shrink to hide
    //
    
    CGAffineTransform t = CGAffineTransformScale([self transform], 0.1, 0.1);
    [self setTransform:t];
    
    //
    //  Add to the parent view
    //
    
    [[[self parent] superview] addSubview:self];
    
    /*
     
     Action      Scale   Duration
     
     Grow        1.05    0.2
     Shrink      0.9     1/15.0
     Grow        1.0     1/7.5
     
     */

    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGAffineTransform t = CGAffineTransformScale(CGAffineTransformIdentity, 1.05, 1.05);
        [self setTransform:t];
        
        [self setAlpha:0.8];
        
    }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:1/15.0 animations:^{
                             
                             CGAffineTransform t = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
                             [self setTransform:t];
                             
                             [self setAlpha:0.8];
                         }
                                          completion:^(BOOL finished) {
                                              [UIView animateWithDuration:1/7.5 animations:^{
                                                  
                                                  CGAffineTransform t = CGAffineTransformIdentity;
                                                  [self setTransform:t];
                                                  
                                                  [self setAlpha:1.0];
                                              }];
                                              
                                          }];
                     }];
    
    
    
}

//
//  Helper method to keep the popping callout centered.
//

- (CGPoint) adjustedCenter{
    CGPoint center = [self parent].center;
    center.y -= ([[self parent] frame].size.height + [_parent frame].size.height);
    return center;
}


@end
