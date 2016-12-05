//
//  KZPBackView.m
//  BSBDJ
//
//  Created by khalil  on 16/12/6.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPBackView.h"

@implementation KZPBackView

+ (instancetype)viewWithTarget:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [btn setTitle:@"返回" forState: UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    KZPBackView *view = [[self alloc]initWithFrame:btn.bounds];
    [view addSubview:btn];
    
    return view;
    
}
@end
