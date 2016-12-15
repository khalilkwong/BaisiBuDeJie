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
@property(nonatomic,weak) WKWebView *wkV;
@property (weak, nonatomic) IBOutlet UIProgressView *progressV;


@end

@implementation KZPWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.autoresizingMask = NO;
    
     WKWebView * wkV = [[WKWebView alloc]initWithFrame:self.contentV.bounds];

        [wkV loadRequest:[NSURLRequest requestWithURL:self.url.kzp_url]];
    self.wkV = wkV;
    self.navigationItem.title = self.titleText;
       [self.contentV addSubview:wkV];
    
    
    //kvo 监听 能否前进后退   进度
    [wkV addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [wkV addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [wkV addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - BtnClick
- (IBAction)refreshBtnClick:(id)sender {
    [self.wkV reload];
}
- (IBAction)backBtnClick:(id)sender {
    if ([self.wkV canGoBack]) {
        [self.wkV goBack];
    
    }
    else {
//        [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
        

    }
}
- (IBAction)forwardBtnClick:(id)sender {
    if ([self.wkV canGoForward]) {
        [self.wkV goForward];
    }
}

#pragma mark - kvo 回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
//    self.backBtn.enabled = self.wkV.canGoBack;
    self.forwardBtn.enabled = self.wkV.canGoForward;
    self.progressV.progress = self.wkV.estimatedProgress;
    self.progressV.hidden = self.wkV.estimatedProgress == 1.0? YES : NO;
    
}



#pragma mark - dealloc

- (void)dealloc {
    [self.wkV removeObserver:self forKeyPath:@"canGoBack"];
    [self.wkV removeObserver:self forKeyPath:@"canGoForward"];
    [self.wkV removeObserver:self forKeyPath:@"estimatedProgress"];
}
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
