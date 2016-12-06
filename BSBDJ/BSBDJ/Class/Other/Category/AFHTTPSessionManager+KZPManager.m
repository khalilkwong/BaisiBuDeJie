//
//  AFHTTPSessionManager+KZPManager.m
//  BSBDJ
//
//  Created by khalil  on 16/12/7.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "AFHTTPSessionManager+KZPManager.h"

@implementation AFHTTPSessionManager (KZPManager)


/**
 增加分类  给系统的类添加text/html类型的 json

 @return  添加好的解析类型的网络管理对象
 */
+ (instancetype)kzp_manager {
    AFHTTPSessionManager *manager = [self manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    return manager;
}
@end
