//
//  UIHandler.h
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHandler : NSObject
- (UIButton *)buttonInView:(UIView *)view;
- (UILabel *)labelInView:(UIView *)view;

- (void)transitionGradient:(CAGradientLayer *)gradientLayer fromColors:(NSArray *)fromColors toColors:(NSArray *)toColors;

- (CAGradientLayer *)blueGradientInView:(UIView *)view;
- (CAGradientLayer *)greenGradientInView:(UIView *)view;

+ (instancetype)sharedInstance;
@end
