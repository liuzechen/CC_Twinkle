//
//  UIView+Twinkle.m
//  Twinkle
//
//  Created by v－ling on 15/9/6.
//  Copyright (c) 2015年 LiuZeChen. All rights reserved.
//

#import "UIView+Twinkle.h"
#import "TwinkleLayer.h"
#import "TwinkleLayer+Anim.h"

@implementation UIView (Twinkle)

- (void)twinkle {

    NSMutableArray *twinkleLayers = [NSMutableArray array];

    UInt32 upperBound = 10;
    UInt32 lowerBound = 5;
    UInt8 count = (UInt8)(arc4random_uniform(upperBound) + lowerBound);

    for (int i = 0; i < count; i++) {
        TwinkleLayer *twinkleLayer = [[TwinkleLayer alloc] init];

        CGFloat x = arc4random_uniform((UInt32)self.layer.bounds.size.width);
        CGFloat y = arc4random_uniform((UInt32)self.layer.bounds.size.height);

        twinkleLayer.position = CGPointMake(x, y);
        twinkleLayer.opacity = 0;
        [twinkleLayers addObject:twinkleLayer];
        [self.layer addSublayer:twinkleLayer];

        [twinkleLayer addPositionAnimation];
        [twinkleLayer addRotationAnimation];
        [twinkleLayer addFadeInOutAnimation:CACurrentMediaTime() + (CFTimeInterval)0.15 *(i)];
    }

    [twinkleLayers removeAllObjects];
}

@end
