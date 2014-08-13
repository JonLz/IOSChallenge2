//
//  SecondViewController.m
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    UIHandler *handler;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    handler = [UIHandler sharedInstance];
    
    self.gradient = [handler greenGradientInView:self.view];
    [self.view.layer insertSublayer:self.gradient atIndex:0];
    
    UILabel *label = [handler labelInView:self.view];
    label.text = @"Second View Controller";
    [self.view addSubview:label];
    
    UIButton *button = [handler buttonInView:self.view];
    [button setTitle:@"Go Back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Transition background gradient color to green
    [handler transitionGradient:self.gradient fromColors:[handler blueGradientInView:self.view].colors  toColors:[handler greenGradientInView:self.view].colors];
}


#pragma mark
#pragma mark View Transition Handlers
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    TransitionAnimator *animator = [TransitionAnimator new];
    animator.presenting = NO;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionAnimator *animator = [TransitionAnimator new];
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
