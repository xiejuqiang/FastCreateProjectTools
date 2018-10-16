//
//  UIImageView+URLImageView.h
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 监听下载完成block

 @param image 图片
 @param error 错误信息
 @param cacheType 缓存类型
 @param imageURL 图片路径
 */
typedef void(^DownloadImageViewCompleteBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);

/**
 *  监听下载进度的Block
 *
 *  @param progress 返回下载进度
 */
typedef void(^DownImageProgressBlock)(CGFloat progress);

@interface UIImageView (URLImageView)
- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName;

- (void)downloadImage:(NSString *)urlStr placeholder:(NSString *)imageName success:(DownloadImageViewCompleteBlock)completed progress:(DownImageProgressBlock)progress;
@end

NS_ASSUME_NONNULL_END
