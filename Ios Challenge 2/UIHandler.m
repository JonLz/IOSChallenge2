//
//  UIHandler.m
//  Ios Challenge 2
//
//  Created by Jon on 8/13/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "UIHandler.h"

@implementation UIHandler

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark UIKit Element Handlers
// Creates a UIButton centered horizontally and vertically
- (UIButton *)buttonInView:(UIView *)view
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 100, 30);
    button.center = view.center;
    
    button.backgroundColor = [UIColor whiteColor];
    
    // Set button's highlighted state to be a solid blue background color
    [button setBackgroundImage:[self imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor colorWithRed:0.24 green:0.47 blue:0.85 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    button.layer.cornerRadius = 5.0f;

    // Needs to be set to YES in order for the button's highlighted state to maintain rounded corners
    button.clipsToBounds = YES;
    
    return button;
}

// Creates a UILabel centered horizontally with a slight vertical adjustment
- (UILabel *)labelInView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.center = view.center;
    CGRect frame = label.frame;
    frame.origin.y -= 60;
    label.frame = frame;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    return label;
}


#pragma mark Gradient Handlers
- (CAGradientLayer *)blueGradientInView:(UIView *)view
{
    CAGradientLayer *gradient = [self gradientWithR:30 g:61 b:74];
    gradient.frame = view.bounds;
    return gradient;
}

- (CAGradientLayer *)greenGradientInView:(UIView *)view
{
    CAGradientLayer *gradient = [self gradientWithR:40 g:69 b:58];
    gradient.frame = view.bounds;
    return gradient;
}

// Creates and animates a gradient layer transition from one set of colors to another
- (void)transitionGradient:(CAGradientLayer *)gradientLayer fromColors:(NSArray *)fromColors toColors:(NSArray *)toColors
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation.fromValue = fromColors;
    animation.toValue = toColors;
    animation.duration	= 2.0;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [gradientLayer addAnimation:animation forKey:@"animateGradient"];
}

#pragma mark
#pragma mark Color Helpers
- (CAGradientLayer *)gradientWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    CAGradientLayer *gradient = [CAGradientLayer layer];

    UIColor *startColor = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
    UIColor *endColor = [UIColor colorWithRed:0.0/255.0f green:0.0/255.0f blue: 0.0/255.0f alpha:1];
    
    gradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
 
    return gradient;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)sharedInstance
{
    static UIHandler *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[UIHandler alloc] init];
    });
    return _sharedInstance;
}

@end
