//
//  KZPMeSquareItem.h
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZPMeSquareItem : NSObject

/**
 图片地址
 */
@property(nonatomic,strong)NSString *icon;

/**
 模块标题
 */
@property(nonatomic,strong)NSString *name;

/**
 跳转 url
 */
@property(nonatomic,strong)NSString *url;
@end
