//
//  TwinkleLayer+Anim.h
//  Twinkle
//
//  Created by v－ling on 15/9/6.
//  Copyright (c) 2015年 LiuZeChen. All rights reserved.
//

#import "TwinkleLayer.h"
#import <UIKit/UIKit.h>

@interface TwinkleLayer (Anim)

- (void)addPositionAnimation;
- (void)addRotationAnimation;
- (void)addFadeInOutAnimation:(CFTimeInterval)beginTime;

@end
