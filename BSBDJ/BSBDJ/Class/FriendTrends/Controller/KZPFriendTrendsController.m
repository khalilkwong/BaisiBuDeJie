//
//  KZPFriendTrendsController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPFriendTrendsController.h"

@interface KZPFriendTrendsController ()

@end

@implementation KZPFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpNav {
    //设置左边 barButtonItem
    //如果直接用 btn 来包装 barBtnItem  超过 btn 的部分  btn 也会响应
    //    用一个 view 来包装
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"friendsRecommentIcon" hightlightedImageName:@"friendsRecommentIcon-click" andAddTarget:self action:@selector(friendsRecommentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置 中间
    self.navigationItem.title = @"我的关注";
    
}
- (void)friendsRecommentBtnClick {
    
}

@end
