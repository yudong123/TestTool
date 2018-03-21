//
//  YDHomeViewController.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDHomeViewController.h"
#import "YDDataViewController.h"
#import "TZImagePickerController.h"
#import "YDPhotoCollectionViewCell.h"
#define YDScreenY [UIApplication sharedApplication].statusBarFrame.size.height + 44.0
@interface YDHomeViewController ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOrginalPhoto;
    
    CGFloat _itemWH;
    CGFloat _margin;
}

@property (nonatomic, strong)UIImagePickerController *imagePickerVc;
@property (nonatomic, strong)UICollectionView *colletcionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *layOut;
@end

@implementation YDHomeViewController
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
/*
- (UIImagePickerController *)imagePickerVc {
    if (!_imagePickerVc) {
        _imagePickerVc = [[UIImagePickerController alloc]init];
        _imagePickerVc.delegate = self;
        // set appearance 改变相册选择页的导航栏外观
        if (iOS7Later) {
            _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        }
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            if (@available(iOS 9.0, *)) {
                tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
                BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
            }
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}
*/
- (UICollectionViewFlowLayout *)layOut {
    if (!_layOut) {
        _margin = 4;
        _layOut = [[UICollectionViewFlowLayout alloc]init];
        _layOut.footerReferenceSize = CGSizeMake(self.view.yd_width, 50.0f);
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layOut.minimumInteritemSpacing = _margin;
        _layOut.minimumLineSpacing = _margin;
    }
    return _layOut;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configConllectionView];
}

#pragma mark ConfigConllectionView
- (void)configConllectionView {
    _margin = 4;
    _itemWH = (self.view.yd_width - 2 * _margin - 4) / 3 - _margin;
    _colletcionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,YDScreenY, self.view.yd_width, self.view.yd_height) collectionViewLayout:self.layOut];
    CGFloat rgb = 244 / 255.0;
    _colletcionView.alwaysBounceVertical = YES;
    _colletcionView.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
    _colletcionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    _colletcionView.dataSource = self;
    _colletcionView.delegate = self;
    _colletcionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [_colletcionView registerClass:[YDPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"YDPhotoCollectionViewCell"];
     [self.view addSubview:_colletcionView];
    //_colletcionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
    
}


#pragma mark UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _selectedPhotos.count +1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YDPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YDPhotoCollectionViewCell" forIndexPath:indexPath];
    
    cell.videoImageView.hidden = YES;
    
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png"];
        cell.deleteBtn.hidden = YES;
        cell.gitLable.hidden = YES;
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.asset = _selectedAssets[indexPath.row];
        cell.deleteBtn.hidden = NO;
        cell.gitLable.hidden = YES;
    }
    
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   // [self pushImagePickerController];
    //
    TZImagePickerController * imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:self];
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        _selectedPhotos =  [NSMutableArray arrayWithArray:photos];
        _selectedAssets =  [NSMutableArray arrayWithArray:assets];
        [_colletcionView reloadData];
        
        //_colletcionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectedPhotos.count == 4) {
        return  CGSizeMake(self.view.yd_width / 2 - 7  ,self.view.yd_width / 2 - 7);
    }
        return  CGSizeMake(self.view.yd_width / 3 - 7  ,self.view.yd_width / 3 - 7);
}

#pragma mark - TZImagePickerControllerDelegate

- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    
}

- (BOOL)isAlbumCanSelect:(NSString *)albumName result:(id)result {
    return YES;
}

- (BOOL)isAssetCanSelect:(id)asset {
    return YES;
}

- (void) pushImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:9 delegate:self pushPhotoPickerVc:YES];
    // imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOrginalPhoto;
    
    // 1.设置目前已经选中的图片数组
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = YES;
    imagePickerVc.allowPickingMultipleVideo = YES; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.yd_width - 2 * left;
    NSInteger top = (self.view.yd_height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - Click Event
- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    
    [_colletcionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_colletcionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_colletcionView reloadData];
    }];
}

#pragma mark YDNavigationBar DataSource
/**头部标题*/
- (NSMutableAttributedString *)ydNavigationBarTitle:(YDNavigationBar *)navigationBar {
    return [self changeTitle:@"首页"];
}

/** 背景色 */
- (UIColor *)ydNavigationBackgroundColor:(YDNavigationBar *)navigationBar {
    return [UIColor darkGrayColor];
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
    YDDataViewController *ac = [YDDataViewController new];
    
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
