MBCallout
=========

A custom UIView subclass that can be shown as a callout to a UIButton.

**How To Use:**

0. Add MBCalloutView.h, MBCalloutView.m, UIButton+Callout.h and UIButton+Callout.m to your project.
1. #import "UIButton+Callout.h"
2. // Create any UIButton you'd like
3. [button setCalloutTitle:@"This is a callout with some text in it."];
4. [button addTarget:button action:@selector(showCallout) forControlEvents:UIControlEventTouchUpInside];
5. // Position and show the button. 
