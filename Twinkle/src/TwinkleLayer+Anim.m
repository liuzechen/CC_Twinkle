//
//  TwinkleLayer+Anim.m
//  Twinkle
//
//  Created by v－ling on 15/9/6.
//  Copyright (c) 2015年 LiuZeChen. All rights reserved.
//

#import "TwinkleLayer+Anim.h"

static NSString *TwinkleLayerPositionAnimationKey = @"positionAnimation";
static NSString *TwinkleLayerTransformAnimationKey = @"transformAnimation";
static NSString *TwinkleLayerOpacityAnimationKey = @"opacityAnimation";

@implementation TwinkleLayer (Anim)

- (void)addPositionAnimation {
    [CATransaction begin];
    CAKeyframeAnimation *keyFrameAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnim.duration = 0.3;
    keyFrameAnim.additive = true;
    keyFrameAnim.repeatCount = MAXFLOAT;
    keyFrameAnim.removedOnCompletion = NO;

    keyFrameAnim.beginTime = (CFTimeInterval)(arc4random_uniform(1000) + 1) * 0.2 * 0.25; // random start time, non-zero
    NSArray *points = @[
    [NSValue valueWithCGPoint:[self cc_arc4randomValue:.25]],
    [NSValue valueWithCGPoint:[self cc_arc4randomValue:.25]],
    [NSValue valueWithCGPoint:[self cc_arc4randomValue:.25]],
    [NSValue valueWithCGPoint:[self cc_arc4randomValue:.25]],
    [NSValue valueWithCGPoint:[self cc_arc4randomValue:.25]]];
    keyFrameAnim.values = points;
    [self addAnimation:keyFrameAnim forKey:TwinkleLayerPositionAnimationKey];
    [CATransaction commit];
}

- (void)addRotationAnimation {
    [CATransaction begin];
    CAKeyframeAnimation *keyFrameAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    keyFrameAnim.duration = 0.3;
    keyFrameAnim.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    keyFrameAnim.additive = YES;
    keyFrameAnim.repeatCount = MAXFLOAT;
    keyFrameAnim.removedOnCompletion = NO;
    keyFrameAnim.beginTime = (CFTimeInterval)(arc4random_uniform(1000) + 1) * 0.2 * 0.25; // random start time, non-zero
    CGFloat radians = 0.104; // ~6 degrees
    keyFrameAnim.values = @[@(-radians), @(radians), @(-radians)];
    [self addAnimation:keyFrameAnim forKey:TwinkleLayerTransformAnimationKey];
    [CATransaction commit];
}

- (void)addFadeInOutAnimation:(CFTimeInterval)beginTime {
    [CATransaction begin];
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fadeAnimation.fromValue = 0;
    fadeAnimation.toValue = @(1);
    fadeAnimation.repeatCount = 2;
    fadeAnimation.autoreverses = YES; // fade in then out
    fadeAnimation.duration = 0.4;
    fadeAnimation.fillMode = kCAFillModeForwards;
    fadeAnimation.beginTime = beginTime;
    [CATransaction setCompletionBlock:^{
        [self removeFromSuperlayer];
    }];
    [self addAnimation:fadeAnimation forKey:TwinkleLayerOpacityAnimationKey];
    [CATransaction commit];
}

- (CGPoint)cc_arc4randomValue:(CGFloat)range {
    CGFloat x = -range + arc4random_uniform(1000) / 1000.0 * 2.0 * range;
    CGFloat y = -range + arc4random_uniform(1000) / 1000.0 * 2.0 * range;
    return CGPointMake(x, y);
}


@end
