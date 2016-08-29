//
//  ViewController.m
//  10_无限图片轮播器
//
//  Created by shuangyuan on 15/11/28.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "HMCollectionViewCell.h"
#define HMImageCount 4

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

// 这个是用来维护当前显示的是第几张图片的索引
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return HMImageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // indexPaht.item 肯定就2中情况: 0（前一张） 2（后一张）
    // 0 - 1 = -1
    // 2 - 1 = 1
    //    indexPath.item
    
    
    //    self.index - 1
    //    self.index + 1
    
    // next中的值只有两种：-1 或者 1
    NSInteger next = indexPath.item - 1;
    next = ((self.index + next) + HMImageCount) % HMImageCount;
    
    NSLog(@"%@", @(self.index));
    //NSLog(@"%@", @(indexPath.item));
    
    // 1. 拼接图片名称
    NSString *img_name = [NSString stringWithFormat:@"img%02ld", next + 1];
    UIImage *img = [UIImage imageNamed:img_name];
    
    // 2. 创建Cell
    HMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"img_cell" forIndexPath:indexPath];
    
    // 3. 把图片设置给cell
    cell.image = img;
    
    // 4. 返回Cell
    return cell;
}


// 滚动减速完成事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 获取滚动的偏移的x值
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 计算偏移的倍数（这个偏移的倍数可能性为: 0  、 2）
    int offset = offsetX / scrollView.bounds.size.width - 1;
    
    
    // 修改self.index （ +1   或 -1）
    self.index = (self.index + offset + HMImageCount) % HMImageCount;
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 滚动到第二个cell
        [self collectionViewScrollToSecondCell];
    });
    
}

- (void)collectionViewScrollToSecondCell {
    // 滚动到第二个cell
    NSIndexPath *idxPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:idxPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置布局对象
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    // 设置最小行间距
    self.flowLayout.minimumLineSpacing = 0;
    // 设置滚动方向为水平方向
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置去掉弹簧效果
    self.collectionView.bounces = NO;
    // 设置去掉水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 设置自动分页
    self.collectionView.pagingEnabled = YES;
    
    
    
    // 滚动到第二个Cell的位置
    [self collectionViewScrollToSecondCell];
    
    self.index = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
