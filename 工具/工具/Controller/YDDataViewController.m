//
//  YDDataViewController.m
//  工具
//
//  Created by YuDong on 2018/3/19.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDDataViewController.h"
#define YDScreenY [UIApplication sharedApplication].statusBarFrame.size.height + 44.0
@interface YDDataViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YDDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self configCollectionview];
    
}

- (void)configCollectionview {
    //创建一个layout布局类
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(self.view.yd_width /3 - 7  , self.view.yd_width /3 - 7);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0,YDScreenY, self.view.yd_width, self.view.yd_height) collectionViewLayout:layout];
    collect.backgroundColor = [UIColor clearColor];
    collect.alwaysBounceVertical = YES;
    //collect.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    layout.footerReferenceSize = CGSizeMake(collect.contentSize.width , collect.contentSize.height - collect.frame.size.height);
    //代理设置
    collect.delegate=self;
    collect.dataSource=self;
    //注册item类型 这里使用系统的类型
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    [self.view addSubview:collect];
}

//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - YDNavigationBar DataSource
/**头部标题*/
- (NSMutableAttributedString *)ydNavigationBarTitle:(YDNavigationBar *)navigationBar {
    
    return [self changeTitle:@"数据"];
}

/** 背景色 */
- (UIColor *)ydNavigationBackgroundColor:(YDNavigationBar *)navigationBar {
    return [UIColor clearColor];
}

/** 导航条左边的按钮 */
- (UIImage *)ydNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(YDNavigationBar *)navigationBar {
    [leftButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    
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

- (CGFloat)ydNavigationHeight:(YDNavigationBar *)navigationBar {
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}
#pragma mark - YDNavigationBar Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(YDNavigationBar *)navigationBar
{

}

/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(YDNavigationBar *)navigationBar
{
    
}





@end
