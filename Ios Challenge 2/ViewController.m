//
//  ViewController.m
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIHandler *handler;
    BOOL presenting;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    handler = [UIHandler sharedInstance];

    self.gradient = [handler blueGradientInView:self.view];
    [self.view.layer insertSublayer:self.gradient atIndex:0];
    
    UILabel *label = [handler labelInView:self.view];
    label.text = @"Home View Controller";
    [self.view addSubview:label];
    
    UIButton *button = [handler buttonInView:self.view];
    [button setTitle:@"Go Forward" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)goForward
{
    // Create the new view controller which we will modally present with a custom transition
    // See TransitionAnimator.h for more details
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    // Make sure the new view controller's gradient is the same for a seamless transition animation
    vc.gradient.colors = self.gradient.colors;
    
    // Flag presenting so the view controller knows to transition its gradient back upon viewWillAppear
    presenting = YES;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Only transition the gradient from green to blue if we've presented the second view controller
    if (presenting) {
        [handler transitionGradient:self.gradient fromColors:[handler greenGradientInView:self.view].colors toColors:[handler blueGradientInView:self.view].colors];
    }
    presenting = NO;
}

#pragma mark
#pragma mark View Transition Handlers
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    TransitionAnimator *animator = [TransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionAnimator *animator = [TransitionAnimator new];
    [self viewWillAppear:YES];
    return animator;
}

#pragma mark
#pragma mark Memory Handling
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
