//
//  KZPEssenceController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPEssenceController.h"

@interface KZPEssenceController ()

@end

@implementation KZPEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    [self setUpNav];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithWhite:0.5 alpha:0.1]];
    
}

-(void)setUpViews {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 375, 44)];
    view.backgroundColor = [UIColor blueColor];
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 375, 603)];
    [self.view addSubview:tableV];
    [self.view addSubview:view];
}
- (void)setUpNav {
    //设置左边 barButtonItem
    //如果直接用 btn 来包装 barBtnItem  超过 btn 的部分  btn 也会响应
//    用一个 view 来包装
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_item_game_iconN" hightlightedImageName:@"nav_item_game_click_iconN" andAddTarget:self action:@selector(gameBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置 中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置右边
  
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationButtonRandomN" hightlightedImageName:@"navigationButtonRandomClickN" andAddTarget:self action:@selector(randomBtnClick) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - 导航栏按键点击方法
- (void)gameBtnClick {
    NSLog(@"%s",__func__);
}

- (void)randomBtnClick {
    NSLog(@"%s",__func__);

}



@end
