//
//  KZPTopicBaseView.h
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZPTopicItem.h"

@interface KZPTopicBaseView : UIView
@property(nonatomic,strong)KZPTopicItem *topicItem;
+ (instancetype)viewFromXib;
@end
