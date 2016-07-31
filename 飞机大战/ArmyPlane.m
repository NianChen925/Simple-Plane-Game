//
//  ArmyPlane.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "ArmyPlane.h"

@implementation ArmyPlane
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"ep_%lu",self.armyLevel]];
    }
    return self;
}
@end
