//
//  KZPMainCellBtn.m
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPMainCellBtn.h"

@implementation KZPMainCellBtn



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [self.titleLabel setTextColor:[UIColor grayColor]];
}
@end
