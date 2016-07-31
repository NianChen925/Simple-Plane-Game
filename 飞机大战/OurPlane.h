//
//  OurPlane.h
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "BasePlane.h"

typedef enum : NSUInteger {
    OurPlaneOne=1,
    OurPlaneTwo,
    OurPlaneThree,
    OurPlaneFour,
    OurPlaneFive,
    OurPlaneSix
} OURPlANE;

@interface OurPlane : BasePlane
@property (nonatomic) OURPlANE ourLevel;
- (instancetype)initWithFrame:(CGRect)frame level:(OURPlANE)level;
@end
