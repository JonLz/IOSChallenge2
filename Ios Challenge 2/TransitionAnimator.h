//
//  TransitionAnimator.h
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign) BOOL presenting;
@end
