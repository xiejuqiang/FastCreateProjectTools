//
//  NetworkManager.m
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import "NetworkManager.h"

static NSString *kBaseUrl = @"http://192.168.1.54/";
@interface HttpClient : AFHTTPSessionManager
+ (instancetype)shareIntance;

@end

static HttpClient *shareIntance = nil;
@implementation HttpClient

+ (instancetype)shareIntance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareIntance = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        // 接收参数类型
        shareIntance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        //  安全策略
        shareIntance.securityPolicy = [AFSecurityPolicy defaultPolicy];
    });
    return shareIntance;
}

@end

@implementation NetworkManager

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params completeResponse:(nonnull CompleteResponseBlock)completeResponse{
    // 获取完整的路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[HttpClient shareIntance] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        completeResponse(responseObject,error);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        id responseObject = nil;
        completeResponse(responseObject,error);
    }];
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params completeResponse:(nonnull CompleteResponseBlock)completeResponse{
    
    // 获取完整的路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[HttpClient shareIntance] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        completeResponse(responseObject,error);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        id responseObject = nil;
        completeResponse(responseObject,error);
    }];
}

+ (void)downloadWithPath:(NSString *)path completeResponse:(nonnull CompleteResponseBlock)completeResponse progress:(nonnull DownloadProgressBlock)progress{
    
    // 获取完整的路径
    NSString *url = [kBaseUrl stringByAppendingString:path];
    
    NSURL *URL = [NSURL URLWithString:url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [[HttpClient shareIntance] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // 进度的分数
        progress(downloadProgress.fractionCompleted);
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        //获取沙盒cache路径
        NSURL * cachesDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [cachesDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        completeResponse(response,error);
        
    }];
    
    [downloadTask resume];
}

+ (void)uploadIamgeWithPath:(NSString *)path params:(NSDictionary *)params thumImage:(NSString *)imageKey image:(UIImage *)image completeResponse:(nonnull CompleteResponseBlock)completeResponse progress:(nonnull UploadProgressBlock)progress{
    
    // 获取完整路径
    NSString *url = [kBaseUrl stringByAppendingString:path];
    
    NSData *data = UIImagePNGRepresentation(image);
    
    [[HttpClient shareIntance] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:imageKey fileName:@"01.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        completeResponse(responseObject,error);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        id responseObject = nil;
        completeResponse(responseObject,error);
    }];
}

@end
