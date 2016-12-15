//
//  KZPFileManager.h
//  BSBDJ
//
//  Created by khalil  on 16/12/12.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 这是一个管理文件的业务类,可以删除指定文件夹,或者计算文件下的尺寸大小
 */
@interface KZPFileManager : NSObject

/**
 计算一个指定文件夹的尺寸
 
 @param path 指定的文件夹
 计算好的文件夹的尺寸
 */

+(void)getDirectorySize:(NSString*)path :(void(^)(NSInteger result))finishBlock;

/**
 清除一个文件夹的文件
 */
+ (void)cleanDirectory:(NSString*)path;
@end
