//
//  KZPADItem.h
//  BSBDJ
//
//  Created by khalil  on 16/12/7.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZPADItem : NSObject
//广告图片路径
@property(nonatomic,strong)NSString *w_picurl;
//点击后跳转路径
@property(nonatomic,strong)NSString *ori_curl;
@property(nonatomic,assign) CGFloat w;
@property(nonatomic,assign) CGFloat h;
@end
