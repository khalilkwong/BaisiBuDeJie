//
//  KZPFileManager.m
//  BSBDJ
//
//  Created by khalil  on 16/12/12.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPFileManager.h"

@implementation KZPFileManager


+(void)getDirectorySize:(NSString*)path :(void(^)(NSInteger result))finishBlock {
    //有一个文件管理者
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSFileManager* mgr = [NSFileManager defaultManager];
        
        //判断路径是否和法
        
        BOOL isDirectory;
        [mgr fileExistsAtPath:path isDirectory:&isDirectory];
        if (!isDirectory){ //路径不是一个文件夹
            //        NSException* except = [NSException exceptionWithName:@"路径error" reason:@",小傻瓜,路径都错了,计算毛线啊!!!" userInfo:nil];
            //        [except raise];
            
            @throw  [NSException exceptionWithName:@"路径error" reason:@"小傻瓜,路径都错了,计算毛线啊!!!" userInfo:nil];
            
        }
        //获得指定路径下的所有文件名
        NSArray* paths =  [mgr subpathsAtPath:path];
        //遍历所有的子路径
        NSUInteger size =0;
        
        for (NSString* filename in paths) {
            //忽略隐藏文件
            if(  [filename containsString:@"Snapshots"]) continue;
            
            if( [filename containsString:@".DS"]) continue;
            //忽略掉文件夹
            NSString* filePath = [path stringByAppendingPathComponent:filename];
            BOOL isDirectory;
            BOOL isExistFile = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExistFile||isDirectory) continue;
            
            //获得属性字典
            NSDictionary* dic = [mgr attributesOfItemAtPath:filePath error:nil];
            
            // 累加计算的size
            size +=[dic fileSize];;
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                
                finishBlock(size);
            }
        });
        
        
    });
    
}

+ (void)cleanDirectory:(NSString*)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    //获得缓存路径
   
    //获取路径下的所有文件名
    NSArray *fileArray = [manager subpathsAtPath:path];
    //遍历获得所有子路径
    
    for (NSString *fileName in fileArray) {
        //拼接 路径
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        //删除 cache
        [manager removeItemAtPath:filePath error:nil];
           }

}
@end
