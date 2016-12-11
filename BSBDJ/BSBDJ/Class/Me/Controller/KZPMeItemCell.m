//
//  KZPMeItemCell.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPMeItemCell.h"
#import "KZPMeSquareItem.h"
#import <UIImageView+WebCache.h>
@implementation KZPMeItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(KZPMeSquareItem *)item {
    _item = item;
    [self.iconV sd_setImageWithURL:item.icon.kzp_url];
    self.nameL.text = item.name;
}

@end
