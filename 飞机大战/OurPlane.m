//
//  OurPlane.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "OurPlane.h"
#import "OurBullet.h"

@implementation OurPlane
- (instancetype)initWithFrame:(CGRect)frame level:(OURPlANE)level
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ourLevel = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"hero%lu",self.ourLevel]];
    }
    return self;
}

- (void)fire {
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(createBullet) userInfo:nil repeats:YES];
}

- (void)createBullet {
    OurBullet *bullet = [[OurBullet alloc] initWithFrame:CGRectMake(self.center.x - 10, self.center.y - 35, 20, 20) level:OurBulletOne];
    [self.delegate.view addSubview:bullet];
    [self.delegate.ourBullets addObject:bullet];
}
@end
