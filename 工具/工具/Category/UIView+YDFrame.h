//
//  UIView+YDFrame.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YDFrame)
@property (nonatomic) CGFloat yd_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat yd_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat yd_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat yd_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat yd_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat yd_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat yd_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat yd_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint yd_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  yd_size;        ///< Shortcut for frame.size.
@end
