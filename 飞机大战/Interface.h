//
//  Interface.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

typedef enum : NSUInteger {
    LevelOne=1,
    LevelTwo,
    LevelThree,
    LevelFour,
    LevelFive
} LEVEL;

@interface Interface : UIImageView
//场景等级
@property (nonatomic) LEVEL level;

+ (instancetype)interfaceWithLevel:(LEVEL)level frame:(CGRect)frame;
- (instancetype)initWithLevel:(LEVEL)level frame:(CGRect)frame;

@end
