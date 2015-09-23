![image](https://github.com/liuzechen/CC_Twinkle/raw/master/twinkle.gif)

##### Twinkle(Swift)原创地址:https://github.com/piemonte/Twinkle

## Twinkle(Object-C) :sparkles:

`CC_Twinkle`是仿`Twinkle`写的OC版

```
#import "UIView+Twinkle.h"

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
```	
#### 作者
刘泽琛, 1040981145@qq.com

#### 链接
> 1.网易新闻version5.3.4下拉刷新控件: https://github.com/liuzechen/CCEaseRefresh
