//
//  KZPNavController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPNavController.h"
#import "KZPNavBar.h"

@interface KZPNavController ()

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
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {

        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[KZPBackView viewWithTarget:self action:@selector(back)]];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
