//
//  ArmyPlane.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "BasePlane.h"
typedef enum : NSUInteger {
    ArmyPlaneOne=1,
    ArmyPlaneTwo,
    ArmyPlaneThree,
    ArmyPlaneFour,
    ArmyPlaneFive,
    ArmyPlaneSix,
    ArmyPlaneSeven,
    ArmyPlaneEight,
    ArmyPlaneNine,
    ArmyPlaneTen
} ARMYPLANE;

@interface ArmyPlane : BasePlane
@property (nonatomic) ARMYPLANE armyLevel;
@property (nonatomic) float speed;


- (instancetype)initWithFrame:(CGRect)frame level:(ARMYPLANE)level;
@end
