//
//  KZPEssenceController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPEssenceController.h"


@interface KZPEssenceController ()
@property(nonatomic,weak)UIView *titleView ;
@end

@implementation KZPEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpScrollView];
    [self setUptitlesView];
    [self addTitleBtn];

    
}

-(void)setUptitlesView {
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 375, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleView = titleView;
     [self.view addSubview:titleView];
   }

- (void)addTitleBtn {
    NSInteger count = 5;
    CGFloat BtnW = ScreenW / count;
    CGFloat BtnH = self.titleView.kzp_height;
    
    for (int i = 0; i < count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * BtnW, 0, BtnW, BtnH);
        btn.backgroundColor = [UIColor randomColor];
        btn.tag = i;
        [self.titleView addSubview:btn];
    }
}


- (void)addChildVCs {
    
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
- (void)setUpScrollView {
    UIScrollView *scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    scrollV.contentInset = UIEdgeInsetsMake(64 + _titleView.kzp_height,0 , 0, 0);
    scrollV.backgroundColor = [UIColor randomColor];
    [self.view addSubview:scrollV];
}


#pragma mark - 导航栏按键点击方法
- (void)gameBtnClick {
    NSLog(@"%s",__func__);
}

- (void)randomBtnClick {
    NSLog(@"%s",__func__);

}



@end
