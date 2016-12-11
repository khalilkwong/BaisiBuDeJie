//
//  KZPMainController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPMainController.h"
#import "KZPEssenceController.h"
#import "KZPFriendTrendsController.h"
#import "KZPNewController.h"
#import "KZPPublishController.h"
#import "KZPMeController.h"
#import "UIImage+Render.h"
#import "UIColor+RandomColor.h"
#import "KZPNavController.h"
#import "KZPLoginView.h"

@interface KZPMainController ()
@property(nonatomic,strong)UIButton *publishBtn;
@property(nonatomic,strong)UIViewController *modalViewC;
@end

@implementation KZPMainController
- (UIButton *)publishBtn {
    if (!_publishBtn) {
        _publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _publishBtn.backgroundColor = [UIColor redColor];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_publishBtn sizeToFit];
        [_publishBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _publishBtn.bounds = CGRectMake(0, 0, self.tabBar.frame.size.width * 0.2, self.tabBar.frame.size.height);
        _publishBtn.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
    }
    return _publishBtn;
}
+ (void)load {
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *dict0 = [NSMutableDictionary dictionary];
    dict0[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    dict0[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:dict0 forState:UIControlStateNormal];
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
//    dict1[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    dict1[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:dict1 forState:UIControlStateSelected];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildVC];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
//    self.selectedIndex = 4;
    
}
- (void)viewWillAppear:(BOOL)animated {

    [self.tabBar addSubview:self.publishBtn];
}
- (void)viewDidAppear:(BOOL)animated {
    
}
//-(void)addPublishBtn {
//    UIButton *publishBtn = [[UIButton alloc]init];
//    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
//    [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
//    [publishBtn sizeToFit];
//    publishBtn.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
//    [self.tabBar addSubview:publishBtn];
//}
#pragma mark - 添加子控制器
-(void)setUpOneChildVC:(UIViewController *)vc WithTitle:(NSString *)title normalImageName:(NSString *)normalImageName selectImageName:(NSString *)selectImageName {
    
    if ([@"KZPPublishController" isEqualToString:NSStringFromClass([vc class])]) {
                    vc.tabBarItem.enabled = NO;
         [self addChildViewController:vc];
    }
    
    else {
    KZPNavController *nav = [[KZPNavController alloc]initWithRootViewController:vc];
//    nav.tabBarItem.enabled = NO;
    vc.view.backgroundColor = [UIColor randomColor];

    [nav.tabBarItem setTitle:title];
    if (normalImageName.length) {
        [nav.tabBarItem setImage:[UIImage imageWithRenderImageName:normalImageName]];
    }
    if (selectImageName.length) {
    [nav.tabBarItem setSelectedImage:[UIImage imageWithRenderImageName:selectImageName]];
    }
//     [nav addChildViewController:vc];  错误写法
    [self addChildViewController:nav];
    }
}
-(void)setUpAllChildVC {
    [self setUpOneChildVC: [[KZPEssenceController alloc]init] WithTitle:@"精华" normalImageName:@"tabBar_essence_icon" selectImageName:@"tabBar_essence_click_icon"];
    [self setUpOneChildVC: [[KZPNewController alloc]init] WithTitle:@"新帖" normalImageName:@"tabBar_new_icon" selectImageName:@"tabBar_new_click_icon"];
    
    [self setUpOneChildVC:[[KZPPublishController alloc]init]  WithTitle:@"" normalImageName:@"" selectImageName:@""];
   
    [self setUpOneChildVC: [[KZPFriendTrendsController alloc]init] WithTitle:@"关注" normalImageName:@"tabBar_friendTrends_icon" selectImageName:@"tabBar_friendTrends_click_icon"];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"KZPMeController" bundle:nil];
   KZPMeController *vc =  [sb instantiateViewControllerWithIdentifier:@"KZPMeController"];
    [self setUpOneChildVC: vc WithTitle:@"我的" normalImageName:@"tabBar_me_icon" selectImageName:@"tabBar_me_click_icon"];
}

#pragma mark - addBtnClick
- (void)addBtnClick {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor randomColor];
        self.modalViewC = vc;
    });
    
    [self presentViewController:self.modalViewC animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.modalViewC dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

@end
