//
//  YDRequestManager.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class YDBaseResponse;

typedef YDBaseResponse *(^ResponseFormat)(YDBaseResponse *response);

@interface YDRequestManager : AFHTTPSessionManager

+ (instancetype)shareManager;

/**本地数据模式*/
@property (assign, nonatomic) BOOL isLocal;


/**预处理返回的数据*/
@property (nonatomic, copy) ResponseFormat responseFormat;

- (void)POST:(NSString *)urlString parameters:(id)parameters completion:(void (^)(YDBaseResponse *response))completion;

- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(YDBaseResponse *response))completion;


/**
 data   对应的二进制数据
 name   服务器需要参数
 */
- (void)upload:(NSString *)urlString parameters:(id)parameters formDataBlock:(void (^)(id<AFMultipartFormData> formData))formDataBlock progress:(void (^)(NSProgress *progress))progress completion:(void (^)(YDBaseResponse *response))completion;

@end
