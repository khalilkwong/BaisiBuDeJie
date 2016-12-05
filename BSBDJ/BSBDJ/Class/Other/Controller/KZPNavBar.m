//
//  KZPNavBar.m
//  BSBDJ
//
//  Created by khalil  on 16/12/6.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPNavBar.h"

@implementation KZPNavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view class] == NSClassFromString(@"KZPBackView")) {
            view.kzp_x = 0;
        }
    }
}
@end
