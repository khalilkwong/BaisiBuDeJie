//
//  KZPADController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/7.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPADController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>

#import "KZPMainController.h"


#define iPhone6P  ScreenH == 736
#define iPhone6   ScreenH == 667
#define iPhone5   ScreenH == 568
#define iPhone4   ScreenH == 480
#define code2  @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface KZPADController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImagV;
@property (weak, nonatomic) IBOutlet UIImageView *adImageV;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

@end

@implementation KZPADController

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配屏幕
    UIImage *image = nil;
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iPhone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    }else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    }else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    self.launchImagV.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - downloadAD 
- (void)downloadAD {
    //创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager kzp_manager];
    //设置参数
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"code2"] = code2;
    //发送请求
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        KZPLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KZPLog(@"%@",error);
    }];
}
- (IBAction)skipBtnClick {
    KZPMainController *mainC = [[KZPMainController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainC;

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
