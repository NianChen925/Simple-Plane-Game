//
//  ArmyBullet.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "ArmyBullet.h"

@implementation ArmyBullet
- (instancetype)initWithFrame:(CGRect)frame level:(ARMYBULLET)level {
    if (self = [super initWithFrame:frame]) {
        self.armyBulletLevel = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"epb_%lu",self.armyBulletLevel]];
        switch (self.armyBulletLevel) {
            case ArmyBulletOne:
                self.damageHp = 1;
                self.speed = 10;
                break;
            case ArmyBulletTwo:
                self.damageHp = 2;
                self.speed = 11;
                break;
        }
    }
    return self;
}

@end
