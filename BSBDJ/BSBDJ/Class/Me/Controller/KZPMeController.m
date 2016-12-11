//
//  KZPMeController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPMeController.h"
#import "KZPSettingController.h"
#import "KZPMeItemCell.h"
#import "KZPMeSquareItem.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "KZPWebViewController.h"
#import <WebKit/WebKit.h>

static NSUInteger const cols = 4;
static NSUInteger const margin = 1;
#define itemWH  ((ScreenW - (cols - 1) * margin) / cols)

@interface KZPMeController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray *meItemArray;
@property(nonatomic,weak)UICollectionView *collectionV;
@end

@implementation KZPMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    [self setUpCollectionView];
    [self downLoadItem];
    self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpCollectionView {
    //加到 tableView 的 footView
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
       fl.itemSize = CGSizeMake(itemWH, itemWH);
    fl.minimumLineSpacing = margin;
    fl.minimumInteritemSpacing = margin;
    
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:fl];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    collectionV.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = collectionV;
    self.collectionV = collectionV;
    [collectionV registerNib:[UINib nibWithNibName:@"KZPMeItemCell" bundle:nil] forCellWithReuseIdentifier:@"MeItemCell"];
}

- (void)downLoadItem {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //拼接参数
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"a"] = @"square";
    dictM[@"c"] = @"topic";
    //发送请求
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dictArray = responseObject[@"square_list"];
        NSMutableArray *itemArray = [KZPMeSquareItem mj_objectArrayWithKeyValuesArray:dictArray];
        self.meItemArray = itemArray;
        //计算行数
        NSInteger rows = (self.meItemArray.count + 3)/ cols;
        CGFloat h = (itemWH + margin) * rows;
        self.collectionV.kzp_height = h;
        
        NSInteger num = self.meItemArray.count % cols;
        if (num == 0) {
            
        }else {
            num = cols - num;
        }
        for (int i = 0; i < num; i ++) {
            [self.meItemArray addObject:[[KZPMeSquareItem alloc]init]];
        }
        
        self.tableView.tableFooterView = self.collectionV;
        
        [self.collectionV reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KZPLog(@"%@",error);
    }];
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
#pragma mark - UICollectionViewDataSource 

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.meItemArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KZPMeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MeItemCell" forIndexPath:indexPath];
    
    cell.item = self.meItemArray[indexPath.item];
    
    return  cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    KZPMeSquareItem *item = self.meItemArray[indexPath.row];
  
    KZPWebViewController *wbV = [[KZPWebViewController alloc]initWithNibName:@"KZPWebViewController" bundle:nil];
    wbV.url = item.url;
    [self.navigationController pushViewController:wbV animated:YES];
    self.navigationController.navigationBar.hidden = YES;
}



@end
