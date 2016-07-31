//
//  ArmyBullet.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "BaseBullet.h"

typedef enum : NSUInteger {
    ArmyBulletOne=1,
    ArmyBulletTwo
} ARMYBULLET;

@interface ArmyBullet : BaseBullet
@property (nonatomic) ARMYBULLET armyBulletLevel;

- (instancetype)initWithFrame:(CGRect)frame level:(ARMYBULLET)level;
@end
