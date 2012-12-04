//
//  COViewController.m
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "MBViewController.h"

#import "UIButton+Callout.h"

@interface MBViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    [button addTarget:button action:@selector(showCalloutWithText:) forControlEvents:UIControlEventTouchUpInside];
    [button setCenter:[[self view] center]];

    _button = button;
    
    [[self view] addSubview:[self button]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
