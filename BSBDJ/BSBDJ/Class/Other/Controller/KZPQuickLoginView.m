//
//  KZPQuickLoginView.m
//  BSBDJ
//
//  Created by khalil  on 16/12/8.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPQuickLoginView.h"

@implementation KZPQuickLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)quickLoginView {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}


@end
