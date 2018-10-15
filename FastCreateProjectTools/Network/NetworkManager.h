//
//  NetworkManager.h
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompleteResponseBlock)(id obj,NSError *error);
typedef void(^DownloadProgressBlock)(CGFloat progress);
typedef void(^UploadProgressBlock)(CGFloat progress);

@interface NetworkManager : NSObject

/**
 *  get网络请求
 *
 *  @param path    请求路径
 *  @param params  url参数 NSDictinory类型
 *  @param completeResponse 请求回调
 */
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params completeResponse:(CompleteResponseBlock)completeResponse;

/**
 *  post网络请求
 *
 *  @param path    请求路径
 *  @param params  url参数 NSDictinory类型
 *  @param completeResponse 请求回调
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params completeResponse:(CompleteResponseBlock)completeResponse;

/**
 *  下载文件
 *
 *  @param path     下载路径
 *  @param completeResponse 请求回调
 *  @param progress 下载进度
 */
+ (void)downloadWithPath:(NSString *)path completeResponse:(CompleteResponseBlock)completeResponse progress:(DownloadProgressBlock)progress;

/**
 *  上传图片
 *
 *  @param path     上传路径
 *  @param params   上传参数
 *  @param imageKey 关键字
 *  @param image    上传的图片
 *  @param completeResponse 请求回调
 *  @param progress 上传进度
 */
+ (void)uploadIamgeWithPath:(NSString *)path params:(NSDictionary *)params thumImage:(NSString *)imageKey image:(UIImage *)image completeResponse:(CompleteResponseBlock)completeResponse progress:(UploadProgressBlock)progress;
@end

NS_ASSUME_NONNULL_END
