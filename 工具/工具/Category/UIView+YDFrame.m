//
//  UIView+YDFrame.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "UIView+YDFrame.h"

@implementation UIView (YDFrame)

- (void)setYd_x:(CGFloat)yd_x {
    CGRect frame = self.frame;
    frame.origin.x = yd_x;
    self.frame = frame;
}
- (CGFloat)yd_x {
    return self.frame.origin.x;
}

- (void)setYd_y:(CGFloat)yd_y {
    CGRect frame = self.frame;
    frame.origin.y = yd_y;
    self.frame = frame;
}

- (CGFloat)yd_y {
    return self.frame.origin.y;
}

- (void)setYd_right:(CGFloat)yd_right {
    CGRect frame = self.frame;
    frame.origin.x = yd_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yd_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYd_bottom:(CGFloat)yd_bottom {
    CGRect frame = self.frame;
    frame.origin.y = yd_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yd_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYd_size:(CGSize)yd_size {
    CGRect frame = self.frame;
    frame.size = yd_size;
    self.frame = frame;
}

- (CGSize)yd_size {
    return self.frame.size;
}

- (void)setYd_height:(CGFloat)yd_height {
    CGRect frame = self.frame;
    frame.size.height = yd_height;
    self.frame = frame;
}

- (CGFloat)yd_height {
    return self.frame.size.height;
}

- (void)setYd_width:(CGFloat)yd_width {
    CGRect frame = self.frame;
    frame.size.width = yd_width;
    self.frame = frame;
}

- (CGFloat)yd_width {
    return self.frame.size.width;
}

- (void)setYd_centerX:(CGFloat)yd_centerX {
    self.center = CGPointMake(yd_centerX, self.center.y);
}

- (CGFloat)yd_centerX {
    return self.center.x;
}

- (void)setYd_centerY:(CGFloat)yd_centerY {
    self.center = CGPointMake(self.center.x, yd_centerY);
}

- (CGFloat)yd_centerY {
    return self.center.y;
}

- (void)setYd_origin:(CGPoint)yd_origin {
    CGRect frame = self.frame;
    frame.origin = yd_origin;
    self.frame = frame;
}

- (CGPoint)yd_origin {
    return self.frame.origin;
}
@end
