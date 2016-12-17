//
//  KZPTopicAllController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTopicAllController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "KZPTopicItem.h"
#import "KZPTopicCell.h"
#import "KZPRefreshHeader.h"
#import "KZPRefreshFooter.h"

static NSString * const ID = @"topCell";

@interface KZPTopicAllController ()
@property(nonatomic,strong)NSMutableArray *topicItemArray;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)NSString *maxtime;
@end

@implementation KZPTopicAllController


#pragma mark - lazyLoading 
- (NSMutableArray *)topicItemArray {
    if (!_topicItemArray) {
        _topicItemArray = [NSMutableArray array];
    }
    return _topicItemArray;

}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor randomColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"KZPTopicCell" bundle:nil] forCellReuseIdentifier:ID];
    [self setUpRefresh];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.frame = [UIScreen mainScreen].bounds;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.rowHeight = 250;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置刷新
- (void)setUpRefresh {
    self.tableView.mj_header = [KZPRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self loadNewData];
    
    self.tableView.mj_footer = [KZPRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

}


- (void)loadNewData {
    //创建管理者
    
    //设置参数  a	true	string	参数值为list  c	true	string	data
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"a"] = @"list";
    dictM[@"c"] = @"data";
    //发送请求
    [self.manager GET:kzp_baseUrl parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        NSArray *dictArray = responseObject[@"list"];
        NSMutableArray *topicItemArray = [KZPTopicItem mj_objectArrayWithKeyValuesArray:dictArray];
        self.topicItemArray = topicItemArray;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KZPLog(@"%@",error);
    }];

}

- (void)loadMoreData {
    //创建管理者
    
    //设置参数  a	true	string	参数值为list  c	true	string	data
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"a"] = @"list";
    dictM[@"c"] = @"data";
    dictM[@"maxtime"] = self.maxtime;
    //发送请求
    [self.manager GET:kzp_baseUrl parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dictArray = responseObject[@"list"];
        NSMutableArray *topicItemArray = [KZPTopicItem mj_objectArrayWithKeyValuesArray:dictArray];
        self.topicItemArray = topicItemArray;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KZPLog(@"%@",error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.topicItemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     KZPTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.topicItem = self.topicItemArray[indexPath.row];
    
    return cell;
}






@end
