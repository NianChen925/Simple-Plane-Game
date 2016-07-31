//
//  OurBullet.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "BaseBullet.h"
typedef enum : NSUInteger {
    OurBulletOne=1,
    OurBulletTwo,
    OurBulletThree
} OURBULLET;

@interface OurBullet : BaseBullet
@property (nonatomic) OURBULLET ourBulletLevel;

- (instancetype)initWithFrame:(CGRect)frame level:(OURBULLET)level;
@end
