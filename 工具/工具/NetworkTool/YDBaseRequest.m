//
//  YDBaseRequest.m
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import "YDBaseRequest.h"

@implementation YDBaseRequest

- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void (^)(YDBaseResponse *))completion {
    
    YDWeakSelf(self);
    [[YDRequestManager shareManager] GET:URLString parameters:parameters completion:^(YDBaseResponse *response) {
        if (!weakself) {
            return ;
        }
        
        !completion ?: completion(response);
        
    }];
}


- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void (^)(YDBaseResponse *))completion {
    
    YDWeakSelf(self);
    [[YDRequestManager shareManager] POST:URLString parameters:parameters completion:^(YDBaseResponse *response) {
        if (!weakself) {
            return ;
        }
        
        !completion ?: completion(response);
        
    }];
}

@end
