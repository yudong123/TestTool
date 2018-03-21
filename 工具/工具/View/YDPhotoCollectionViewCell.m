//
//  YDPhotoCollectionViewCell.m
//  工具
//
//  Created by YuDong on 2018/3/20.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDPhotoCollectionViewCell.h"
#import "UIView+Layout.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "TZImagePickerController/TZImagePickerController.h"
@implementation YDPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
        self.clipsToBounds = YES;
        
        _videoImageView = [[UIImageView alloc]init];
        _videoImageView.image = [UIImage imageNamedFromMyBundle:@"MMVideoPreviewPlay"];
        _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _videoImageView.hidden = NO;
        [self.contentView addSubview:_videoImageView];
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"photo_delete"] forState:UIControlStateNormal];
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        _deleteBtn.alpha = 0.6;
        [self.contentView addSubview:_deleteBtn];
        
        _gitLable = [[UILabel alloc]init];
        _gitLable.text = @"GIF";
        _gitLable.textColor = [UIColor whiteColor];
        _gitLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        _gitLable.textAlignment = NSTextAlignmentCenter;
        _gitLable.font = [UIFont systemFontOfSize:10];
        _gitLable.hidden = YES;
        [self.contentView addSubview:_gitLable];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _gitLable.frame = CGRectMake(self.tz_width - 25, self.tz_height - 14, 25, 14);
    _deleteBtn.frame = CGRectMake(self.tz_width - 36, 0, 36, 36);
    CGFloat width = self.tz_width / 3.0;
    _videoImageView.frame = CGRectMake(width, width, width, width);
}
- (void)setAsset:(id)asset {
    _asset = asset;
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
        _videoImageView.hidden = phAsset.mediaType != PHAssetMediaTypeVideo;
        _gitLable.hidden = [[phAsset valueForKey:@"filename"] tz_containsString:@"GIF"];
    }else if ([asset isKindOfClass:[ALAsset class]]) {
        ALAsset *alAsset = asset;
        _videoImageView.hidden = ![[alAsset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo];
        _gitLable.hidden = YES;
    }
}

- (void)setRow:(NSInteger)row {
    _row = row;
    _deleteBtn.tag = row;
}

- (UIView *)snapshotView {
    UIView *snapshotView = [[UIView alloc]init];
    UIView *cellSnapshotView = nil;
    if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
        cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
    }else {
        CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        cellSnapshotView = [[UIImageView alloc]initWithImage:cellSnapshotImage];
    }
    
    snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    [snapshotView addSubview:cellSnapshotView];
    return snapshotView;
}
@end
