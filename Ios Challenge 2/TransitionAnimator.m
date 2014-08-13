//
//  TransitionAnimator.m
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "TransitionAnimator.h"
#import "UIHandler.h"

@implementation TransitionAnimator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // Grab the from and to view controllers from the context
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  
    // Set our starting and ending frames
    // Uses 3 full screen views, one to the left, the visible view, and one to the right
    CGRect onScreenFrame = CGRectMake(0, 0, 320, 568);
    CGRect offScreenRightFrame = CGRectMake(320, 0, 320, 568);
    CGRect offScreenLeftFrame = CGRectMake(-320, 0, 320, 568);
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        [transitionContext.containerView addSubview:fromViewController.view];
        [transitionContext.containerView addSubview:toViewController.view];

        toViewController.view.frame = offScreenRightFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.frame = onScreenFrame;
            fromViewController.view.frame = offScreenLeftFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        toViewController.view.userInteractionEnabled = YES;
        
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
   
        toViewController.view.frame = offScreenLeftFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.frame = onScreenFrame;
            fromViewController.view.frame = offScreenRightFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
}
@end
