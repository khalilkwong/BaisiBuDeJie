//
//  KZPTopicBaseView.m
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTopicBaseView.h"

@implementation KZPTopicBaseView

+ (instancetype)viewFromXib {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
