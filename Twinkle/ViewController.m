//
//  ViewController.m
//  Twinkle
//
//  Created by v－ling on 15/9/6.
//  Copyright (c) 2015年 LiuZeChen. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Twinkle.h"

@interface ViewController ()

// UIView子类UIButton
@property (weak, nonatomic) IBOutlet UIButton *touchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置Button标题
    _touchView.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:32];
}

- (IBAction)handleButton:(id)sender {
    UIButton *btn = (UIButton *)sender;
    // 动画开始
    [btn twinkle];
}

@end
