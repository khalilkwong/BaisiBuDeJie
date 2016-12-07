//
//  KZPNavController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPNavController.h"
#import "KZPNavBar.h"

@interface KZPNavController () <UIGestureRecognizerDelegate>

@end

@implementation KZPNavController



+ (void)load {
    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:25];
    [bar setTitleTextAttributes:dict];

   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     [self setValue:[[KZPNavBar alloc]init] forKey:@"navigationBar"];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    <UIScreenEdgePanGestureRecognizer: 0x7fbf23f21570; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fbf23f20940>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fbf23f0c460>)>>
    KZPLog(@"%@",self.interactivePopGestureRecognizer);
    //如果直接设置手势的代理为 nil 那么手势就有效果了  但是  会有 bug  根控制器会卡住
//            self.interactivePopGestureRecognizer.delegate = nil ;
    //自己设置代理
//    self.interactivePopGestureRecognizer.delegate = self;
    
    //实现全屏滑动返回
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *fullScreenPanGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:fullScreenPanGes];
    fullScreenPanGes.delegate = self;
    //禁用边缘滑动
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {

        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[KZPBackView viewWithTarget:self action:@selector(back)]];
    }
    [super pushViewController:viewController animated:animated];
    
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
   return  [super popViewControllerAnimated:YES];
}
- (void)back {
    [self popViewControllerAnimated:YES];
}




#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1 ;
   
}

@end
