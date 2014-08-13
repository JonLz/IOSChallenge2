//
//  ViewController.h
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimator.h"
#import "UIHandler.h"

@interface ViewController : UIViewController <UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) CAGradientLayer *gradient;
@end
