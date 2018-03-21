//
//  YDNavUIBaseViewController.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDNavUIBaseViewController.h"

@interface YDNavUIBaseViewController ()

@end

@implementation YDNavUIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.yd_navgationBar.yd_width = self.view.yd_width;
    [self.view bringSubviewToFront:self.yd_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = [self navUIBaseViewControllerPreferStatusBarStyle:self];
}

#pragma mark -YDNavUIBaseViewControllerDataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(YDNavUIBaseViewController *)navUIBaseViewController {
    return YES;
}

- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(YDNavUIBaseViewController *)navUIBaseViewController {
    
          //UIStatusBarStyleDefault
    return UIStatusBarStyleLightContent;
}

#pragma mark - YDNavigationBar DataSource
/**头部标题*/
- (NSMutableAttributedString *)ydNavigationBarTitle:(YDNavigationBar *)navigationBar {
    return [self changeTitle:self.title ?: self.navigationItem.title];
}

/** 背景图片 */
//- (UIImage *)ydNavigationBarBackgroundImage:(YDNavigationBar *)navigationBar {
//
//}

/** 背景色 */
- (UIColor *)ydNavigationBackgroundColor:(YDNavigationBar *)navigationBar {
    return  [UIColor whiteColor];
}

/** 是否显示底部黑线 */
//-(BOOL)ydNavigationIsHideBottomLine:(YDNavigationBar *)navigationBar {
//    return NO;
//}

/** 导航条的高度 */
- (CGFloat)ydNavigationHeight:(YDNavigationBar *)navigationBar {
    return  [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}
/** 导航条的左边的 view */
//- (UIView *)ydNavigationBarLeftView:(YDNavigationBar *)navigationBar {
//
//}
/** 导航条右边的 view */
//- (UIView *)ydNavigationBarRightView:(YDNavigationBar *)navigationBar {
//
//}
/** 导航条中间的 View */
//- (UIView *)ydNavigationBarTitleView:(YDNavigationBar *)navigationBar {
//
//}
/** 导航条左边的按钮 */
//- (UIImage *)ydNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(YDNavigationBar *)navigationBar {
//
//}
/** 导航条右边的按钮 */
//- (UIImage *)ydNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(YDNavigationBar *)navigationBar {
//
//}

#pragma mark - YDNavigationBar Delegate
/** 左边的按钮的点击 */
- (void)leftButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar {
    
}

/** 右边的按钮的点击 */
- (void)rightButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar {
    
}

/** 中间如果是 label 就会有点击 */
- (void)titleClickEvent:(UILabel *)sender navigationBar:(YDNavigationBar *)navigationBar {
    
}

- (YDNavigationBar *)yd_navgationBar {
    // 父类控制器必须是导航控制器
    if(!_yd_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]] && [self navUIBaseViewControllerIsNeedNavBar:self])
    {
        YDNavigationBar *navigationBar = [[YDNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _yd_navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.ydDelegate = self;

    }
    return _yd_navgationBar;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.yd_navgationBar.title = [self changeTitle:title];
}

#pragma mark 自定义代码
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle {
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:NSMakeRange(0, title.length)];
    
    return title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
