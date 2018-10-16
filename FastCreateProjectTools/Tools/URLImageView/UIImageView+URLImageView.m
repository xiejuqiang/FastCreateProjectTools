//
//  UIImageView+URLImageView.m
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import "UIImageView+URLImageView.h"

@implementation UIImageView (URLImageView)
- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName {
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName success:(DownloadImageViewCompleteBlock)completed progress:(DownImageProgressBlock)progress {
    
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        progress(receivedSize * 1.0 / expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        completed(image,error,cacheType,imageURL);
        
    }];
}
@end
