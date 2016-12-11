//
//  KZPLoginAndRegisterController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/8.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPLoginAndRegisterController.h"
#import "KZPLoginView.h"
#import "KZPQuickLoginView.h"

@interface KZPLoginAndRegisterController ()

@property (weak, nonatomic) IBOutlet UIView *midV;

@property (weak, nonatomic) IBOutlet UIView *quickLoginV;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;


@end

@implementation KZPLoginAndRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    KZPLoginView *kzpLoginV = [KZPLoginView loginView];
        kzpLoginV.frame = CGRectMake(0, 0, ScreenW, kzpLoginV.kzp_height);
    [self.midV addSubview:kzpLoginV];
    
    
    KZPLoginView *kzpRegisterV = [KZPLoginView registerView];
    kzpRegisterV.frame = CGRectMake(ScreenW, 0, ScreenW, kzpRegisterV.kzp_height);
    [self.midV addSubview:kzpRegisterV];
    
    KZPQuickLoginView *kzpQuickLoginV = [KZPQuickLoginView quickLoginView];
    kzpQuickLoginV.frame = CGRectMake(0, 0, ScreenW, kzpQuickLoginV.kzp_height);
    [self.quickLoginV addSubview:kzpQuickLoginV];
    
  

    
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancelBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerBtnClick:(id)sender {
    self.registerBtn.selected = !self.registerBtn.selected;

        [UIView animateWithDuration:0.25 animations:^{
              if (self.registerBtn.selected) {
            self.midV.bounds = CGRectMake(ScreenW, 0, ScreenW, self.midV.kzp_height);
              }
              else {
                  self.midV.bounds = CGRectMake(0, 0, ScreenW, self.midV.kzp_height);
              }
        }];
}

@end
