//
//  YDTabBarController.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDTabBarController.h"
#import "YDNavigationController.h"
#import "YDHomeViewController.h"
#import "YDNewsViewController.h"
#import "YDContactsViewController.h"
#import "YDYiBoViewController.h"
#import "YDPublishViewController.h"
@interface YDTabBarController ()<UITabBarControllerDelegate>

@end

@implementation YDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor redColor];
    [self addTabBarItems];
    [self addChildViewControllers];
    
    self.delegate = self;
}

- (void)addTabBarItems {
    NSDictionary * firstTabBarItemsAttributes = @{CYLTabBarItemTitle : @"首页",
                                                  CYLTabBarItemImage : @"tabBar_essence_icon",
                                                  CYLTabBarItemSelectedImage : @"tabBar_essence_click_icon"
                                                  };
    NSDictionary * secondTabBarItemsAttributes = @{CYLTabBarItemTitle : @"新闻",
                                                  CYLTabBarItemImage : @"tabBar_new_icon",
                                                  CYLTabBarItemSelectedImage : @"tabBar_new_click_icon"
                                                  };
    NSDictionary * thirdTabBarItemsAttributes = @{CYLTabBarItemTitle : @"",
                                                  CYLTabBarItemImage : @"tabBar_publish_icon",
                                                  CYLTabBarItemSelectedImage : @"tabBar_publish_click_icon"
                                                  };
    NSDictionary * fourthTabBarItemsAttributes = @{CYLTabBarItemTitle : @"易博",
                                                  CYLTabBarItemImage : @"tabBar_me_icon",
                                                  CYLTabBarItemSelectedImage : @"tabBar_me_click_icon"
                                                  };
    NSDictionary * fifthTabBarItemsAttributes = @{CYLTabBarItemTitle : @"联系人",
                                                  CYLTabBarItemImage : @"tabBar_friendTrends_icon",
                                                  CYLTabBarItemSelectedImage : @"tabBar_friendTrends_click_icon"
                                                  };
    
    self.tabBarItemsAttributes = [NSArray arrayWithObjects:firstTabBarItemsAttributes,
                                                           secondTabBarItemsAttributes,
                                                           thirdTabBarItemsAttributes,
                                                           fourthTabBarItemsAttributes,
                                                           fifthTabBarItemsAttributes, nil];
}

- (void)addChildViewControllers {
    
    YDNavigationController *oneNav   = [[YDNavigationController alloc]initWithRootViewController:[[YDHomeViewController alloc]init]];
    YDNavigationController *twoNav   = [[YDNavigationController alloc]initWithRootViewController:[[YDNewsViewController alloc]init]];
    YDNavigationController *threeNav = [[YDNavigationController alloc]initWithRootViewController:[[YDPublishViewController alloc]init]];
    YDNavigationController *fourNav  = [[YDNavigationController alloc]initWithRootViewController:[[YDYiBoViewController alloc]init]];
    YDNavigationController *fiveNav  = [[YDNavigationController alloc]initWithRootViewController:[[YDContactsViewController alloc]init]];
    
    self.viewControllers = @[oneNav,twoNav,threeNav,fourNav,fiveNav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
