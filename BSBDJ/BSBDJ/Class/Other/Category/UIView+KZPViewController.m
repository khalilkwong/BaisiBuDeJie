//
//  UIView+KZPViewController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/14.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "UIView+KZPViewController.h"

@implementation UIView (KZPViewController)

- (UIViewController *)viewController
{  UIViewController *viewController = nil;
    UIResponder *next = self.nextResponder;  while (next)
    {    if ([next isKindOfClass:[UIViewController class]])
    {
        viewController = (UIViewController *)next;
        break;
    }
        next = next.nextResponder;
    }
    return viewController;
}
@end
