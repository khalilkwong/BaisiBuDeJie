//
//  KZPFollowItem.h
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZPFollowItem : NSObject
/*
 返回值字段	字段类型	字段说明
 uid	string	推荐的用户id
 fans_count	string	此用户的被关注数量
 is_follow	int	是否是已经关注的对象,1为是 0为否
 gender	string	用户的性别
 plat_flag	string	平台标记
 screen_name	string	用户的昵称
 header	string	用户头像的url
 id	string	用户id
 introduction	string	个性标签、描述
 tiezi_count	int	发过的帖子总数
 */

//昵称
@property(nonatomic,strong)NSString *theme_name;
//粉丝数
@property(nonatomic,strong)NSString *sub_number;
//头像
@property(nonatomic,strong)NSString *image_list;
//是否关注
@property(nonatomic,assign) BOOL is_follow;

@end
