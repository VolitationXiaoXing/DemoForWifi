//
//  HMCollectionViewCell.m
//  10_无限图片轮播器
//
//  Created by shuangyuan on 15/11/28.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "HMCollectionViewCell.h"

@interface HMCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;

@end


@implementation HMCollectionViewCell

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imgViewIcon.image = image;
}


@end
