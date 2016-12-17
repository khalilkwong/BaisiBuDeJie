//
//  KZPRefreshHeader.m
//  BSBDJ
//
//  Created by khalil  on 16/12/17.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPRefreshHeader.h"

@implementation KZPRefreshHeader


//初始化
- (void)prepare {
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.automaticallyChangeAlpha = YES;
    
}



- (void)placeSubviews {
    [super placeSubviews];
    
}
@end
