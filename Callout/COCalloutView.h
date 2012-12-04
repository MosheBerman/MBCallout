//
//  COCalloutView.h
//  Callout
//
//  Created by Moshe Berman on 12/4/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COCalloutView : UIView

//
//  Designated initializer
//

- (id)initWithParentView:(UIView *)parent andTitle:(NSString *)title;
- (id)initWithParentView:(UIView *)parent;

- (void)show;

@end
