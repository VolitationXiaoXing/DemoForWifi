//
//  HMCollectionViewCell.m
//  10_无限图片轮播器
//
//  Created by shuangyuan on 15/11/28.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "VXXCollectionViewCell.h"

@interface VXXCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;

@end


@implementation VXXCollectionViewCell

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imgViewIcon.image = image;
}


@end
