//
//  OurBullet.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "OurBullet.h"

@implementation OurBullet

- (instancetype)initWithFrame:(CGRect)frame level:(OURBULLET)level {
    if (self = [super initWithFrame:frame]) {
        self.ourBulletLevel = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"bullet_%lu",self.ourBulletLevel]];
        switch (self.ourBulletLevel) {
            case OurBulletOne:
                self.damageHp = 1;
                self.speed = 5;
                break;
            case OurBulletTwo:
                self.damageHp = 2;
                self.speed = 8;
                break;
            case OurBulletThree:
                self.damageHp = 3;
                self.speed = 11;
                break;
        }
    }
    return self;
}

@end
