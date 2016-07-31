//
//  OurPlane.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "OurPlane.h"

@implementation OurPlane
- (instancetype)initWithFrame:(CGRect)frame level:(OURPlANE)level
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ourLevel = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"hero%lu",self.ourLevel]];
        [self fire];
    }
    return self;
}

- (void)fire {

}
@end
