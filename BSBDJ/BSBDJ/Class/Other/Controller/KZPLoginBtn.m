//
//  KZPLoginBtn.m
//  BSBDJ
//
//  Created by khalil  on 16/12/8.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPLoginBtn.h"

@implementation KZPLoginBtn


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.kzp_centerX = self.kzp_width * 0.5;
    self.imageView.kzp_y = 0;
    self.titleLabel.kzp_width = self.kzp_width;
    self.titleLabel.kzp_centerX = self.kzp_width * 0.5;
    self.titleLabel.kzp_y = self.imageView.kzp_height;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
