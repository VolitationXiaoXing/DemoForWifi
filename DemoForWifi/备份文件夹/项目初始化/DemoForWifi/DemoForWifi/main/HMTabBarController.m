//
//  HMTabBarController.m
//  DemoForWifi
//
//  Created by Volitation小星 on 16/7/20.
//  Copyright © 2016年 wangkun. All rights reserved.
//

#import "HMTabBarController.h"

@interface HMTabBarController ()

@end

@implementation HMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadSubControllers];
}



// 封装一个创建TabBarController的子控制器的方法
- (void)loadSubControllers {
    // 加载5个storyboard文件中的导航控制器, 并且把这些导航控制器添加到self中
    
    // 1. sesu
    UINavigationController *sesu = [self navigationControllerWithStoryboardName:@"sesu"];
    sesu.tabBarItem.title = @"测速";
    
    // 2. lishi
    UINavigationController *lishi = [self navigationControllerWithStoryboardName:@"lishi"];
    lishi.tabBarItem.title = @"历史";
    
    // 3. fujin
    UINavigationController *fujin = [self navigationControllerWithStoryboardName:@"fujin"];
    fujin.tabBarItem.title = @"附近";
    
    // 4. wode
    UINavigationController *wode = [self navigationControllerWithStoryboardName:@"wode"];
    wode.tabBarItem.title = @"我的";
    
    // 5. 上上面的这5个控制器添加到tab bar controller中
    self.viewControllers = @[sesu, lishi, fujin, wode];
    
    //设置底部tabbar按钮
    
    
}


// 封装一个根据storyboard文件创建控制器的方法
- (UINavigationController *)navigationControllerWithStoryboardName:(NSString *)name {
    // 加载storyboard文件
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    // 创建storyboard中的初始化控制器
    return [storyboard instantiateInitialViewController];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
