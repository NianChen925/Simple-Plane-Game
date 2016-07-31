//
//  ViewController.m
//  飞机大战
//
//  Created by orange on 16/7/31.
//  Copyright © 2016年 orange. All rights reserved.
//

#import "ViewController.h"
#import "Interface.h"
#import "OurPlane.h"
#import "OurBullet.h"
#import "ArmyPlane.h"
#import "ArmyBullet.h"

#define FPS ((1)/(30.0))


@interface ViewController ()
//飞机等级
@property (nonatomic) OURPlANE ourLevel;
// 场景等级
@property (nonatomic) LEVEL interfaceLevel;
//主场景
@property (nonatomic,strong) UIImageView *mainIVOne;
@property (nonatomic,strong) UIImageView *mainIVTwo;
//屏幕宽度
@property (nonatomic) float width;
//屏幕高低
@property (nonatomic) float height;
//我方飞机
@property (nonatomic,strong) OurPlane *ourPlane;
//上次点击点
@property (nonatomic) CGPoint lastPosition;
@end

@implementation ViewController


#pragma mark - 生命周期 life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    self.width = self.view.bounds.size.width;
    self.height = self.view.bounds.size.height;
    self.interfaceLevel = LevelOne;
    self.ourLevel = OurPlaneOne;
    self.ourBullets = [NSMutableArray array];
    self.armyBullets = [NSMutableArray array];
    self.armyPlanes = [NSMutableArray array];
    //初始化场景
    [self initInterface];
    //初始化我方飞机
    [self initOurPlane];
    //初始化敌方飞机
    [self initArmyPlane];
    //子弹移动
    [NSTimer scheduledTimerWithTimeInterval:FPS target:self selector:@selector(bulletsMove) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (BOOL)prefersStatusBarHidden {
    return  YES;
}

#pragma mark - 界面场景
- (void)initInterface {
    Interface *mainIVOne = [Interface interfaceWithLevel:self.interfaceLevel frame:self.view.frame];
    self.mainIVOne = mainIVOne;
    Interface *mainIVTwo = [Interface interfaceWithLevel:self.interfaceLevel frame:CGRectMake(0, -self.height, self.width, self.height)];
    self.mainIVTwo = mainIVTwo;
    [self.view addSubview:self.mainIVOne];
    [self.view addSubview:self.mainIVTwo];
    [self moveInterface];
}

- (void)moveInterface {
    [NSTimer scheduledTimerWithTimeInterval:FPS target:self selector:@selector(move) userInfo:nil repeats:YES];
}

- (void)move {
    self.mainIVTwo.frame = CGRectMake(0, self.mainIVTwo.frame.origin.y + 3, self.width, self.height);
    self.mainIVOne.frame = CGRectMake(0, self.mainIVOne.frame.origin.y + 3, self.width, self.height);
    if (self.mainIVOne.frame.origin.y >= self.height) {
        self.mainIVOne.frame = CGRectMake(0, -self.height + self.mainIVTwo.frame.origin.y, self.width, self.height);
    }
    if (self.mainIVTwo.frame.origin.y >= self.height) {
        self.mainIVTwo.frame = CGRectMake(0, -self.height + self.mainIVOne.frame.origin.y, self.width, self.height);
    }
}

#pragma mark - 初始化 敌 我 飞机

//我方
- (void)initOurPlane {
    OurPlane *ourPlane = [[OurPlane alloc] initWithFrame:CGRectMake(self.width * 0.5 - 50, self.height - 80, 100, 80) level:self.ourLevel];
    ourPlane.delegate = self;
    self.ourPlane = ourPlane;
    [self.view addSubview:self.ourPlane];
    [ourPlane fire];
    
    
}

//敌方
- (void)initArmyPlane {
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(createArmyPlane) userInfo:nil repeats:YES];
    
}

- (void)createArmyPlane {
    ArmyPlane *armyPlane = [[ArmyPlane alloc] initWithFrame:CGRectMake(arc4random_uniform(self.width - 60),arc4random_uniform(self.height - 80) - self.height, 60, 80) level:arc4random_uniform(10)+1];
    armyPlane.delegate = self;
    [self.view addSubview:armyPlane];
    [self.armyPlanes addObject:armyPlane];
    [armyPlane fire];
}
#pragma mark - 飞机移动
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    self.lastPosition = [t locationInView:self.view];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint nowPosition = [t locationInView:self.view];
    CGFloat x = self.ourPlane.center.x - (self.lastPosition.x - nowPosition.x);
    CGFloat y = self.ourPlane.center.y - (self.lastPosition.y - nowPosition.y);
    
    if (x < 0) {
        x = 0;
    }
    if (x > self.width) {
        x = self.width;
    }
    if (y < 0) {
        y = 0;
    }
    if (y > self.height) {
        y = self.height;
    }
    if (x >= 0 && x <= self.width && y >= 0 && y <= self.height) {
        self.ourPlane.center = CGPointMake( x,  y);
    }
    
    
    self.lastPosition = nowPosition;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastPosition = CGPointZero;
}
#pragma mark - 子弹移动
- (void)bulletsMove {
    for (int i = 0; i < self.ourBullets.count; i++) {
        OurBullet *bullet = self.ourBullets[i];
        bullet.center = CGPointMake(bullet.center.x, bullet.center.y - bullet.speed);
        
        
        
        if (bullet.frame.origin.y < 0) {
            [self.ourBullets removeObject:bullet];
            [bullet removeFromSuperview];
        }
    }
    
    for (int i = 0; i < self.armyPlanes.count; i++) {
        ArmyPlane *armyPlane = self.armyPlanes[i];
        armyPlane.center = CGPointMake(armyPlane.center.x, armyPlane.center.y + armyPlane.speed);
        if (armyPlane.frame.origin.y > self.height) {
            [self.armyPlanes removeObject:armyPlane];
            [armyPlane removeFromSuperview];
        }
    }

    for (int i = 0; i < self.armyBullets.count; i++) {
        ArmyBullet *armyBullet = self.armyBullets[i];
        armyBullet.center = CGPointMake(armyBullet.center.x, armyBullet.center.y + armyBullet.speed);
        if (armyBullet.frame.origin.y > self.height) {
            [self.armyBullets removeObject:armyBullet];
            [armyBullet removeFromSuperview];
        }
    }
}
@end
