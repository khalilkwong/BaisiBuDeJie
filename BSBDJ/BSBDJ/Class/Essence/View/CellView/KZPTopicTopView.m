//
//  KZPTopicTopView.m
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTopicTopView.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "NSDate+KZPDealTime.h"
@interface KZPTopicTopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *creatTime;
@property (weak, nonatomic) IBOutlet UILabel *textL;

@end
@implementation KZPTopicTopView

- (void)setTopicItem:(KZPTopicItem *)topicItem {
    
    [self.iconV sd_setImageWithURL:topicItem.profile_image.kzp_url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIImage *NewImage = [image roundImage];
        [[SDImageCache sharedImageCache] storeImage:NewImage forKey:topicItem.profile_image];
    }];
    self.name.text = topicItem.name;
    self.creatTime.text = [self dealTime];
    self.textL.text = topicItem.text;

}



- (NSString *)dealTime {
    NSString *creatTime = self.topicItem.created_at;
    //日期格式化
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate* creatDate = [formatter dateFromString:creatTime];
    //如果是今年
    if ( [creatDate isThisYear ]) {
        //今天
        if ([creatDate isToday]) {
            NSDateComponents *comp = [creatDate dealTime];
            if (!comp.hour) {//一小时之内
                if (comp.minute <= 1) { //一分钟之内
                    creatTime = @"刚刚";
                } else {
                    creatTime = [NSString stringWithFormat:@"%ld分钟之前",comp.minute];
                }
            }else {//一小时之外
                creatTime = [NSString stringWithFormat:@"%ld小时之前",comp.hour];
            }
        }else if ([creatDate isYesterToday]) {//昨天
            formatter.dateFormat = @"昨天 HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        } else { //今年前天以前
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        }
    }
    return creatTime;
  
}

@end
