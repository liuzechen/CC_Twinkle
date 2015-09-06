//
//  TwinkleLayer.m
//  Twinkle
//
//  Created by v－ling on 15/9/6.
//  Copyright (c) 2015年 LiuZeChen. All rights reserved.
//

#import "TwinkleLayer.h"
#import <UIKit/UIKit.h>

static NSString *TwinkleLayerEmitterShapeKey = @"circle";
static NSString *TwinkleLayerEmitterModeKey = @"surface";
static NSString *TwinkleLayerRenderModeKey = @"unordered";
static NSString *TwinkleLayerMagnificationFilter = @"linear";
static NSString *TwinkleLayerMinificationFilter = @"trilinear";

@implementation TwinkleLayer

- (instancetype)init {
    if (self = [super init]) {
        [self loadComponent];
    }
    return self;
}

- (void)loadComponent {
    UIImage *twinkleImage = [UIImage imageNamed:@"TwinkleImage"];

    NSArray *emitterCells = @[[[CAEmitterCell alloc]init], [[CAEmitterCell alloc] init]];

    [emitterCells enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CAEmitterCell *cell = (CAEmitterCell *)obj;
        cell.birthRate = 8;
        cell.lifetime = 1.25;
        cell.lifetimeRange = 0;
        cell.emissionRange = (CGFloat)M_PI_4;
        cell.velocity = 2;
        cell.velocityRange = 18;
        cell.scale = 0.65;
        cell.scaleRange = 0.7;
        cell.scaleSpeed = 0.6;
        cell.spin = 0.9;
        cell.spinRange = (CGFloat)M_PI;
        cell.color = [UIColor colorWithWhite:1 alpha:.3].CGColor;
        cell.alphaSpeed = -0.8;
        cell.contents = (__bridge id)(twinkleImage.CGImage);
        cell.magnificationFilter = TwinkleLayerMagnificationFilter;
        cell.minificationFilter = TwinkleLayerMinificationFilter;
        cell.enabled = true;
    }];

    self.emitterCells = emitterCells;

    self.emitterPosition = CGPointMake((self.bounds.size.width * 0.5), (self.bounds.size.height * 0.5));
    self.emitterSize = self.bounds.size;
    self.emitterShape = TwinkleLayerEmitterShapeKey;
    self.emitterMode = TwinkleLayerEmitterModeKey;
    self.renderMode = TwinkleLayerRenderModeKey;
}

@end
