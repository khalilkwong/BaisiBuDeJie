//
//  UIBarButtonItem+KZPItem.m
//  BSBDJ
//
//  Created by khalil  on 16/12/5.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "UIBarButtonItem+KZPItem.h"

@implementation UIBarButtonItem (KZPItem)


+ (instancetype)barButtonItemWithImageName:(NSString *)image hightlightedImageName:(NSString *)hightlightedImage andAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:hightlightedImage] forState:UIControlStateHighlighted];
     
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:events];
    UIView *barBtnItemView = [[UIView alloc]initWithFrame:btn.bounds];
    [barBtnItemView addSubview:btn];
    
    return [[UIBarButtonItem alloc]initWithCustomView:barBtnItemView];
}

+ (instancetype)barButtonItemWithImageName:(NSString *)image selectedImageName:(NSString *)selectedImage andAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:events];
    UIView *barBtnItemView = [[UIView alloc]initWithFrame:btn.bounds];
    [barBtnItemView addSubview:btn];
    
    return [[self alloc]initWithCustomView:barBtnItemView];
}


@end
