//
//  KZPWebViewController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPWebViewController.h"
#import <WebKit/WebKit.h>

@interface KZPWebViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBtn;
@property (weak, nonatomic) IBOutlet UIView *contentV;

@end

@implementation KZPWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView * wkV = [[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    [wkV loadRequest:[NSURLRequest requestWithURL:self.url.kzp_url]];
    [self.contentV addSubview:wkV];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - BtnClick
- (IBAction)refreshBtnClick:(id)sender {
}
- (IBAction)backBtnClick:(id)sender {
}
- (IBAction)forwardBtnClick:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
