//
//  YDBaseRequest.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDBaseResponse;

@interface YDBaseRequest : NSObject

- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(YDBaseResponse *response))completion;

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(YDBaseResponse *response))completion;

@end
