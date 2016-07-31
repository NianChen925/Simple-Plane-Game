//
//  ArmyPlane.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "ArmyPlane.h"
#import "ArmyBullet.h"

@implementation ArmyPlane
- (instancetype)initWithFrame:(CGRect)frame level:(ARMYPLANE)level
{
    self = [super initWithFrame:frame];
    if (self) {
        self.armyLevel = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"ep_%lu",self.armyLevel]];
        switch (self.armyLevel) {
            case ArmyPlaneOne:
                self.speed = 2;
                self.health = 5;
                break;
            case ArmyPlaneTwo:
                self.speed = 2;
                self.health = 6;
                break;
            case ArmyPlaneThree:
                self.speed = 2;
                self.health = 7;
                break;
            case ArmyPlaneFour:
                self.speed = 2;
                self.health = 10;
                break;
            case ArmyPlaneFive:
                self.speed = 3;
                self.health = 11;
                break;
            case ArmyPlaneSix:
                self.speed = 3;
                self.health = 12;
                break;
            case ArmyPlaneSeven:
                self.speed = 4;
                self.health = 12;
                break;
            case ArmyPlaneEight:
                self.speed = 4;
                self.health = 13;
                break;
            case ArmyPlaneNine:
                self.speed = 5;
                self.health = 13;
                break;
            case ArmyPlaneTen:
                self.speed = 6;
                self.health = 15;
                break;
        }
    }
    return self;
}


- (void)fire {
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(createBullet) userInfo:nil repeats:YES];
}

- (void)createBullet {
    ArmyBullet *armyBullet = [[ArmyBullet alloc] initWithFrame:CGRectMake(self.center.x - 12, self.center.y+20, 20, 20) level:ArmyBulletOne];
    [self.delegate.view addSubview:armyBullet];
    [self.delegate.armyBullets addObject:armyBullet];
    
}

@end
