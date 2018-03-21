//
//  YDBaseResponse.h
//  工具
//
//  Created by YuDong on 2018/3/18.
//  Copyright © 2018年 YuDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDBaseResponse : NSObject

/** */
@property (nonatomic, strong) NSError *error;

/** */
@property (nonatomic, copy) NSString  *errorMsg;

/** */
@property (assign, nonatomic) NSInteger statusCode;

/** */
@property (nonatomic, copy) NSMutableDictionary *headers;

/** */
@property (nonatomic, strong) id responseObject;

@end
