//
//  YDContactsViewController.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDContactsViewController.h"
#import "YDNewsViewController.h"

@interface YDContactsViewController ()

@end

@implementation YDContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - YDNavigationBar DataSource
/**头部标题*/
- (NSMutableAttributedString *)ydNavigationBarTitle:(YDNavigationBar *)navigationBar {
    
    return [self changeTitle:@"联系人"];
}

/** 背景色 */
- (UIColor *)ydNavigationBackgroundColor:(YDNavigationBar *)navigationBar {
    return [UIColor brownColor];
}

- (UIImage *)ydNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(YDNavigationBar *)navigationBar {
    [leftButton setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [leftButton sizeToFit];
    leftButton.yd_width   = 44;
    leftButton.yd_height  = 44;
    return nil;
}

/** 导航条右边的按钮 */
- (UIImage *)ydNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(YDNavigationBar *)navigationBar {
    [rightButton setImage:[UIImage imageNamed:@"nav_coin_icon"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"nav_coin_icon_click"] forState:UIControlStateHighlighted];
    [rightButton sizeToFit];
    
    rightButton.yd_width  = 44 ;
    rightButton.yd_height = 44;
    
    return nil;
}

#pragma mark - YDNavigationBar Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar
{
    
}

/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar
{
    YDNewsViewController *ac = [YDNewsViewController new];
    
    [self.navigationController pushViewController:ac animated:YES];
    
}

/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(YDNavigationBar *)navigationBar
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
