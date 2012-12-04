//
//  COCalloutView.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "MBCalloutView.h"

#import <QuartzCore/QuartzCore.h>

@interface MBCalloutView ()

@property (nonatomic, assign) UIView *parent;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MBCalloutView

//
//  These values closele approximate the maximum
//  size of an MKAnnotationView's callout.
//

const double kCalloutHeight = 44;
const double kCalloutWidth = 307.5;

- (id)initWithParentView:(UIView *)parent{
    self = [self initWithParentView:parent andTitle:@""];
    return self;
}

//
//  Designated initializer
//

- (id)initWithParentView:(UIView *)parent andTitle:(NSString *)title{
    
    self =  [self initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
    
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
    //  Add to the parent view
    //
    
    [[[self parent] superview] addSubview:self];
    
    //
    //  Animate the view into place
    //
    
    [self popAndFade];
    
}

//
//  This method animates
//  a view to mimic the
//  style of a UIAlertView
//  as it animates into view.
//

- (void) popAndFade{
    //
    //  Shrink to hide
    //
    
    CGAffineTransform t = CGAffineTransformScale([self transform], 0.1, 0.1);
    [self setTransform:t];
    
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
