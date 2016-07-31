//
//  Interface.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "Interface.h"



@implementation Interface

- (instancetype)initWithLevel:(LEVEL)level frame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.level = level;
        self.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_bg_level_%lu",level]];
    }
    return self;
}
+ (instancetype)interfaceWithLevel:(LEVEL)level frame:(CGRect)frame{
    return [[self alloc] initWithLevel:level frame:frame];
}


@end
