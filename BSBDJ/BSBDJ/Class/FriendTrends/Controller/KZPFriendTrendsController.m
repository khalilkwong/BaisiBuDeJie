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
#warning 记得改回来
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loginBtnClick];
    });
}
- (void)viewDidAppear:(BOOL)animated{


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
- (IBAction)loginBtnClick {
    KZPLoginAndRegisterController *vc = [[KZPLoginAndRegisterController alloc]init];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end
