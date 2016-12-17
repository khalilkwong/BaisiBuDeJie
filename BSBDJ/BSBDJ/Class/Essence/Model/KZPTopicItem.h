//
//  KZPTopicItem.h
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZPTopicItem : NSObject

/**
 用户头像
 */
@property(nonatomic,strong)NSString *profile_image;

/**
 用户名
 */
@property(nonatomic,strong)NSString *name;

/**
发表时间
 */
@property(nonatomic,strong)NSString *created_at;

/**
 正文
 */
@property(nonatomic,strong)NSString *text;




/**
 踩
 */
@property(nonatomic,assign) NSInteger cai;

/**
 顶
 */
@property(nonatomic,assign) NSInteger ding;

/**
 转发
 */
@property(nonatomic,assign) NSInteger repose;

/**
 评论数
 */
@property(nonatomic,assign) NSInteger comment;



@end
