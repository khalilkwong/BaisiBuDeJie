//
//  KZPMeController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPMeController.h"
#import "KZPSettingController.h"

@interface KZPMeController ()

@end

@implementation KZPMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav {
       //设置 中间
    self.navigationItem.title = @"我的";
    //设置右边 barButtonItem
    UIBarButtonItem *nightBtn = [UIBarButtonItem barButtonItemWithImageName:@"mine-moon-icon" hightlightedImageName:@"mine-moon-icon-click" andAddTarget:self action:@selector(nightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *settingBtn = [UIBarButtonItem barButtonItemWithImageName:@"mine-setting-icon" hightlightedImageName:@"mine-setting-icon-click" andAddTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[settingBtn,nightBtn];
    

}
#pragma mark - BtnClick
- (void)nightBtnClick:(UIButton *)btn {
    KZPLog(@"nightBtnClick");
    
          btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"mine-sun-icon"] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted | UIControlStateSelected];
    }else {
        [btn setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    }
   
  
    
}
- (void)settingBtnClick {
    KZPLog(@"settingBtnClick");
    KZPSettingController *settingVC = [[KZPSettingController alloc]init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];

}



@end
