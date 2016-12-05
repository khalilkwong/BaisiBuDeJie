//
//  KZPBarBtnItem.m
//  BSBDJ
//
//  Created by khalil  on 16/12/5.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPBarBtnItem.h"

@implementation KZPBarBtnItem

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)image hightlightedImageName:(NSString *)hightlightedImage andAddTarget:(id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)events {
UIButton *btn = [[UIButton alloc]init];
    if (image.length) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (hightlightedImage.length) {
        [btn setImage:[UIImage imageNamed:hightlightedImage] forState:UIControlStateHighlighted];
    }

[btn sizeToFit];

[btn addTarget:target action:action forControlEvents:events];

UIView *barBtnItemView = [[UIView alloc]initWithFrame:btn.bounds];
[barBtnItemView addSubview:btn];

 return [[UIBarButtonItem alloc]initWithCustomView:barBtnItemView];
}

@end
