//
//  YDNavigationBar.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDNavigationBar.h"

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

#define kDefaultNavBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44.0)

#define kSmallTouchSizeHeight 44.0

#define kLeftRightViewSizeMinWidth 60.0

#define kLeftMargin 0.0

#define kRightMargin 0.0

#define kNavBarCenterY(H) ((self.frame.size.height - kStatusBarHeight - H) * 0.5 + kStatusBarHeight)

#define kViewMargin 5.0

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation YDNavigationBar

#pragma mark - system

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupYDNavigationBarUIOnce];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupYDNavigationBarUIOnce];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.superview bringSubviewToFront:self];
    
    self.leftView.frame = CGRectMake(0, kStatusBarHeight, self.leftView.yd_width, self.leftView.yd_height);
    
    self.rightView.frame = CGRectMake(self.yd_width - self.rightView.yd_width, kStatusBarHeight, self.rightView.yd_width, self.rightView.yd_height);
    
    self.titleView.frame = CGRectMake(0, kStatusBarHeight + (44.0 - self.titleView.yd_height) * 0.5, MIN(self.yd_width - MAX(self.leftView.yd_width, self.rightView.yd_width) * 2 - kViewMargin * 2, self.titleView.yd_width), self.titleView.yd_height);
    
    self.titleView.yd_x = (self.yd_width * 0.5 - self.titleView.yd_width * 0.5);
    
    self.bottomBlackLineView.frame = CGRectMake(0, self.yd_height, self.yd_width, 0.5);
    
}

#pragma mark - Setter
- (void)setTitleView:(UIView *)titleView {
    
    [_titleView removeFromSuperview];
    
    [self addSubview:titleView];
    
    _titleView = titleView;
    
    __block BOOL isHaveTapGes = NO;
    
    [titleView.gestureRecognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[UITapGestureRecognizer class]]) {
            
            isHaveTapGes = YES;
            
            *stop = YES;
        }
    }];
    
    if (!isHaveTapGes) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
        
        [titleView addGestureRecognizer:tap];
    }
    [self layoutIfNeeded];
}

- (void)setTitle:(NSMutableAttributedString *)title {
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBarTitleView:)]) {
        return;
    }
    /**头部标题*/
     UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.yd_width * 0.4, 44)];
    
        navTitleLabel.numberOfLines=0;//可能出现多行的标题
        [navTitleLabel setAttributedText:title];
        navTitleLabel.textAlignment = NSTextAlignmentCenter;
        navTitleLabel.backgroundColor = [UIColor clearColor];
        navTitleLabel.userInteractionEnabled = YES;
        navTitleLabel.lineBreakMode = NSLineBreakByClipping;
        self.titleView = navTitleLabel;
}

- (void)setLeftView:(UIView *)leftView {
    [_leftView removeFromSuperview];
    [self addSubview:leftView];
    _leftView = leftView;
    
    if ([leftView isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)leftView;
        [btn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self layoutIfNeeded];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundImage = backgroundImage;
    self.layer.contents = (id)backgroundImage.CGImage;
}

- (void)setRightView:(UIView *)rightView {
    [_rightView removeFromSuperview];
    [self addSubview:rightView];
    _rightView = rightView;
    
    if ([rightView isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)rightView;
        [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self layoutIfNeeded];
}

- (void)setDataSource:(id<YDNavigationBarDataSource>)dataSource {
    _dataSource = dataSource;
    [self setupDataSourceUI];
}

#pragma mark - getter
- (UIView *)bottomBlackLineView {
    if (!_bottomBlackLineView) {
        CGFloat height = 0.5;
        UIView *bottomBlackLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, height)];
        [self addSubview:bottomBlackLineView];
        [self bringSubviewToFront:bottomBlackLineView];
        bottomBlackLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomBlackLineView;
}

- (void)leftBtnClick:(UIButton *)btn {
    if ([self.ydDelegate respondsToSelector:@selector(leftButtonEvent:navigationBar:)]) {
        [self.ydDelegate leftButtonEvent:btn navigationBar:self];
    }
}

- (void)rightBtnClick:(UIButton *)btn {
    if ([self.ydDelegate respondsToSelector:@selector(rightButtonEvent:navigationBar:)]) {
        [self.ydDelegate rightButtonEvent:btn navigationBar:self];
    }
}

-(void)titleClick:(UIGestureRecognizer*)Tap
{
    UILabel *view = (UILabel *)Tap.view;
    if ([self.ydDelegate respondsToSelector:@selector(titleClickEvent:navigationBar:)]) {
        
        [self.ydDelegate titleClickEvent:view navigationBar:self];
        
    }
}

#pragma mark - custom

- (void)setupDataSourceUI {
    /** 导航条的高度 */
    
    if ([self.dataSource respondsToSelector:@selector(ydNavigationHeight:)]) {
        
        self.yd_size = CGSizeMake(kScreenWidth, [self.dataSource ydNavigationHeight:self]);
        
    }else
    {
        self.yd_size = CGSizeMake(kScreenWidth, kDefaultNavBarHeight);
    }
    
    /** 是否显示底部黑线 */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationIsHideBottomLine:)]) {
        
        if ([self.dataSource ydNavigationIsHideBottomLine:self]) {
            self.bottomBlackLineView.hidden = YES;
        }
        
    }
    
    /** 背景图片 */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBarBackgroundImage:)]) {
        
        self.backgroundImage = [self.dataSource ydNavigationBarBackgroundImage:self];
    }
    
    /** 背景色 */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBackgroundColor:)]) {
        self.backgroundColor = [self.dataSource ydNavigationBackgroundColor:self];
    }
    
    /** 导航条中间的 View */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBarTitleView:)]) {
        
        self.titleView = [self.dataSource ydNavigationBarTitleView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(ydNavigationBarTitle:)])
    {
        /**头部标题*/
        self.title = [self.dataSource ydNavigationBarTitle:self];
    }
    
    /** 导航条的左边的 view */
    /** 导航条左边的按钮 */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBarLeftView:)]) {
        
        self.leftView = [self.dataSource ydNavigationBarLeftView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(ydNavigationBarLeftButtonImage:navigationBar:)])
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kSmallTouchSizeHeight, kSmallTouchSizeHeight)];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = [self.dataSource ydNavigationBarLeftButtonImage:btn navigationBar:self];
        
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
        
        self.leftView = btn;
    }
    
    /** 导航条右边的 view */
    /** 导航条右边的按钮 */
    if ([self.dataSource respondsToSelector:@selector(ydNavigationBarRightView:)]) {
        
        self.rightView = [self.dataSource ydNavigationBarRightView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(ydNavigationBarRightButtonImage:navigationBar:)])
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kLeftRightViewSizeMinWidth, kSmallTouchSizeHeight)];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = [self.dataSource ydNavigationBarRightButtonImage:btn navigationBar:self];
        
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
        
        self.rightView = btn;
    }
    
}

- (void)setupYDNavigationBarUIOnce {
    self.backgroundColor = [UIColor whiteColor];
}

@end
