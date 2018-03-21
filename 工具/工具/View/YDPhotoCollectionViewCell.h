//
//  YDPhotoCollectionViewCell.h
//  工具
//
//  Created by YuDong on 2018/3/20.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UIButton * deleteBtn;
@property (nonatomic, strong) UILabel *gitLable;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, strong) id asset;

- (UIView *)snapshotView;
@end
