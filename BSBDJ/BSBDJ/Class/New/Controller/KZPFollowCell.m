//
//  KZPFollowCell.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPFollowCell.h"
#import "KZPFollowItem.h"
#import <UIImageView+WebCache.h>
@interface KZPFollowCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;


@end
@implementation KZPFollowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setItem:(KZPFollowItem *)item {
    _item = item;
    [self.iconV sd_setImageWithURL:item.image_list.kzp_url placeholderImage:[UIImage imageNamed:@"item.image_list.kzp_url"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        image = [image roundImage];
        self.iconV.image = image;
    }];
    self.nameLabel.text = item.theme_name;
    
    CGFloat count = item.sub_number.floatValue ;
        if (count >= 10000) {
        count = count / 10000;
        NSString *string = [NSString stringWithFormat:@"%.1f万人关注",count];
            string = [string stringByReplacingOccurrencesOfString:@".0" withString:@" "];

        self.fansLabel.text = string;
    }else {
        self.fansLabel.text = [NSString stringWithFormat:@"%.0f人关注",count];
    }
    
    
    self.followBtn.selected = item.is_follow;
}


@end
