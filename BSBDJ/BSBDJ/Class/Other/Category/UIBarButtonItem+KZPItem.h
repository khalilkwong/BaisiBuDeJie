//
//  UIBarButtonItem+KZPItem.h
//  BSBDJ
//
//  Created by khalil  on 16/12/5.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KZPItem)
/**
 封装一个有高亮状态的barButtonItem
 
 @param image 默认图片
 @param hightlightedImage 高亮图片
 @param target 响应者
 @param action 响应方法
 @param events 触发事件
 @return barButtonItem
 */
+ (instancetype) barButtonItemWithImageName:(NSString *)image hightlightedImageName:(NSString *)hightlightedImage andAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events;


/**
 封装一个有选中状态的barButtonItem
 
 @param image 默认图片
 @param selectedImage 高亮图片
 @param target 响应者
 @param action 响应方法
 @param events 触发事件
 @return barButtonItem
 */
+ (instancetype)barButtonItemWithImageName:(NSString *)image selectedImageName:(NSString *)selectedImage andAddTarget:(id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)events;
@end
