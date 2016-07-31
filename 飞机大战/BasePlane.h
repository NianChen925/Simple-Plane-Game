//
//  BasePlane.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface BasePlane : UIImageView
@property (nonatomic,weak) ViewController *delegate;
@property (nonatomic) CGFloat health;
@property (nonatomic,strong) NSTimer *timer;
- (void)fire;
- (void)stopTimer;
@end
