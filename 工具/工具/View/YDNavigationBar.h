//
//  YDNavigationBar.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YDNavigationBar;

@protocol YDNavigationBarDataSource<NSObject>

@optional

/**头部标题*/
- (NSMutableAttributedString*)ydNavigationBarTitle:(YDNavigationBar *)navigationBar;

/** 背景图片 */
- (UIImage *)ydNavigationBarBackgroundImage:(YDNavigationBar *)navigationBar;
/** 背景色 */
- (UIColor *)ydNavigationBackgroundColor:(YDNavigationBar *)navigationBar;
/** 是否显示底部黑线 */
- (BOOL)ydNavigationIsHideBottomLine:(YDNavigationBar *)navigationBar;
/** 导航条的高度 */
- (CGFloat)ydNavigationHeight:(YDNavigationBar *)navigationBar;


/** 导航条的左边的 view */
- (UIView *)ydNavigationBarLeftView:(YDNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)ydNavigationBarRightView:(YDNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)ydNavigationBarTitleView:(YDNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)ydNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(YDNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)ydNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(YDNavigationBar *)navigationBar;

@end

@protocol YDNavigationBarDelegate <NSObject>

@optional

/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(YDNavigationBar *)navigationBar;

@end



@interface YDNavigationBar : UIView


/** 底部的黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/** <#digest#> */
@property (weak, nonatomic) UIView *titleView;

/** <#digest#> */
@property (weak, nonatomic) UIView *leftView;

/** <#digest#> */
@property (weak, nonatomic) UIView *rightView;

/** <#digest#> */
@property (nonatomic, copy) NSMutableAttributedString *title;

/** <#digest#> */
@property (weak, nonatomic) id<YDNavigationBarDataSource> dataSource;

/** <#digest#> */
@property (weak, nonatomic) id<YDNavigationBarDelegate> ydDelegate;

/** <#digest#> */
@property (weak, nonatomic) UIImage *backgroundImage;
@end
