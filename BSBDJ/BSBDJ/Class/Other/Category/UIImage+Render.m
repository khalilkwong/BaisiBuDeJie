//
//  UIImage+Render.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "UIImage+Render.h"

@implementation UIImage (Render)
+(instancetype)imageWithRenderImageName:(NSString *)image {
    UIImage *im = [UIImage imageNamed:image];
    return [im imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
