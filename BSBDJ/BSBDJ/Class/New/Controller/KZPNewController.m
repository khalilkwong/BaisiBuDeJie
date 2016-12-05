//
//  KZPNewController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPNewController.h"

@interface KZPNewController ()

@end

@implementation KZPNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
//    self.tabBarItem.enabled = NO;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav {
    //设置左边 barButtonItem
    //如果直接用 btn 来包装 barBtnItem  超过 btn 的部分  btn 也会响应
    //    用一个 view 来包装
    
    
    self.navigationItem.leftBarButtonItem = [KZPBarBtnItem barButtonItemWithImageName:@"MainTagSubIcon" hightlightedImageName:@"MainTagSubIconClick" andAddTarget:self action:@selector(mainTagBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置 中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}
- (void)mainTagBtnClick {
    
}
@end
