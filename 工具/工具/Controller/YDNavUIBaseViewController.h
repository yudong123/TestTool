//
//  YDNavUIBaseViewController.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDNavigationBar.h"

@class YDNavUIBaseViewController;
@protocol YDNavUIBaseViewControllerDataSource<NSObject>

@optional
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(YDNavUIBaseViewController *)navUIBaseViewController;

- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(YDNavUIBaseViewController *)navUIBaseViewController;

@end

@interface YDNavUIBaseViewController : UIViewController<YDNavigationBarDelegate,YDNavigationBarDataSource,YDNavUIBaseViewControllerDataSource>
/*默认的导航栏字体*/
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
/**  */
@property (weak, nonatomic) YDNavigationBar *yd_navgationBar;
@end
