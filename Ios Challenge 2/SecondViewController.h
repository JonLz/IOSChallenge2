//
//  SecondViewController.h
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIHandler.h"
#import "TransitionAnimator.h"

@interface SecondViewController : UIViewController  <UIViewControllerTransitioningDelegate>

// The default background gradient
@property (nonatomic,strong) CAGradientLayer *gradient;
@end
