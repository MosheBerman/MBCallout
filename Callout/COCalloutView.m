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

@end

@implementation COCalloutView

- (id)initWithParentView:(UIView *)parent{
    self =  [self initWithFrame:CGRectMake(0, 0, 200, 50)];
    
    if (self) {
        _parent = parent;
        CGPoint center = parent.center;
        center.y -= [_parent frame].size.height/2;
        [self setCenter:center];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [[self layer] setBorderColor:[UIColor darkGrayColor].CGColor];
    [[self layer] setBorderWidth:1.0];
    [[self layer] setCornerRadius:5];
    
}


@end