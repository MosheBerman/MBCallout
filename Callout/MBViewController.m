//
//  COViewController.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "MBViewController.h"

//
//  This category is where the magic happens
//

#import "UIButton+Callout.h"

@interface MBViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //
    //  Create a UIButton
    //
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    //
    //  Tell the button to show a callout on tap
    //
    
    [button addTarget:button action:@selector(showCalloutWithText:) forControlEvents:UIControlEventTouchUpInside];
    
    //
    //  Position
    //
    
    [button setCenter:[[self view] center]];
    
    //
    //  "Retain" a reference to the button
    //  (not in the memory management sense,
    //  just hang on to it.)
    //
    
    _button = button;
    
    //
    //  Show the button
    //
    
    [[self view] addSubview:[self button]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
