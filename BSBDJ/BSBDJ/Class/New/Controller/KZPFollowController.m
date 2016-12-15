//
//  KZPFollowController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/9.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPFollowController.h"
#import "KZPFollowItem.h"
#import "KZPFollowCell.h"
#import <MJExtension.h>
#import "UIView+KZPViewController.h"
#import <SVProgressHUD.h>



@interface KZPFollowController ()
@property(nonatomic,strong)NSArray *followArray;
@end

@implementation KZPFollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关注列表";
//    self.tableView.contentInset = UIEdgeInsetsMake(64,0 , 0, 0);
    self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
    
    [self downloadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"KZPFollowCell" bundle:nil] forCellReuseIdentifier:@"FollowCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *view = [[UIView alloc]init];
    KZPLog(@"%@",view.viewController) ;
    
}


#pragma mark - 获取数据
- (void)downloadData {
//    http://api.budejie.com/api/api_open.php
//    a tags_list   c		subscribe
    
    
    /*
    返回值字段	字段类型	字段说明
    uid	string	推荐的用户id
    fans_count	string	此用户的被关注数量
    is_follow	int	是否是已经关注的对象,1为是 0为否
    gender	string	用户的性别
    plat_flag	string	平台标记
    screen_name	string	用户的昵称
    header	string	用户头像的url
    id	string	用户id
    introduction	string	个性标签、描述
    tiezi_count	int	发过的帖子总数
     */
    
    
    //创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置参数
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"a"] = @"tags_list";
    dictM[@"c"] = @"subscribe";
    
    //提示正在下载关注列表
    [SVProgressHUD showWithStatus:@"正在更新关注列表,请稍候..."];
    
    //发送请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [responseObject writeToFile:@"/Users/khalil/Desktop/follow.plist" atomically:YES];
            NSArray *dictArray = responseObject[@"rec_tags"];
            NSMutableArray *followArray = [KZPFollowItem  mj_objectArrayWithKeyValuesArray:dictArray];
            self.followArray = followArray;
            [self.tableView reloadData];
            
            [SVProgressHUD showSuccessWithStatus: @"更新成功"];
            
            [SVProgressHUD dismissWithDelay:1.0];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            KZPLog(@"%@",error);

            [SVProgressHUD showErrorWithStatus:@"更新失败"];
             [SVProgressHUD dismissWithDelay:0.25];
        }];

    });
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.followArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KZPFollowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FollowCell" forIndexPath:indexPath];
    KZPFollowItem *item = self.followArray[indexPath.row];
    cell.item = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75 + 1;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
