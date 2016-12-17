//
//  KZPEssenceController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/4.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPEssenceController.h"
#import "KZPTopicAllController.h"
#import "KZPTopicVideoController.h"
#import "KZPTopicAudioController.h"
#import "KZPTopicPictureController.h"
#import "KZPTopicTextController.h"


@interface KZPEssenceController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak)UIView *titlesView ;
@property(nonatomic,strong)UIButton *selectedBtn;
@property(nonatomic,weak) UIView *indicatorV;
@property(nonatomic,strong)NSMutableArray *btns;
@property(nonatomic,weak)UICollectionView *collectionV;
@end

@implementation KZPEssenceController

#pragma mark - lazyloading
- (NSMutableArray *)btns {
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpCollectionView];
    [self setUptitlesView];
    
    [self addChildVCs];
    [self addTitleBtn];
    [self addIndicatorView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}
#pragma mark - titlesView
-(void)setUptitlesView {
    UIScrollView *titlesView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenW, 35)];
    titlesView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.9];
    self.titlesView = titlesView;
     [self.view addSubview:titlesView];
   }

- (void)addIndicatorView {
    UIView *indicatorV = [[UIView alloc]init];
    indicatorV.backgroundColor = self.selectedBtn.currentTitleColor;
    indicatorV.kzp_height = 2;
    indicatorV.kzp_y = self.titlesView.kzp_height - indicatorV.kzp_height;
    self.indicatorV = indicatorV;
    [self.titlesView addSubview:indicatorV];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.indicatorV.kzp_width = self.selectedBtn.titleLabel.kzp_width;
        self.indicatorV.kzp_centerX = self.selectedBtn.kzp_centerX;
    });
}

#pragma mark - titleBtn
- (void)addTitleBtn {
    NSInteger count = 5;
    CGFloat BtnW = ScreenW / count;
    CGFloat BtnH = self.titlesView.kzp_height;
    
    for (int i = 0; i < count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * BtnW, 0, BtnW, BtnH);
//        btn.backgroundColor = [UIColor randomColor];
        btn.tag = i;
        
        [btn setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btns addObject:btn];
        [self.titlesView addSubview:btn];
        if (i == 0) {
            [self titleBtnClick:btn];
            
        }
    }
    
    
}
- (void)titleBtnClick:(UIButton *)btn {
    int tagOffset = (int)labs(btn.tag - self.selectedBtn.tag);
    [self titleBtnSelect:btn];
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorV.kzp_width = self.selectedBtn.titleLabel.kzp_width;
        self.indicatorV.kzp_centerX = self.selectedBtn.kzp_centerX;
    }];
    
    
    if (tagOffset == 1) {
        [self.collectionV setContentOffset:CGPointMake(btn.tag * ScreenW, 0) animated:YES];
    }else {
         [self.collectionV setContentOffset:CGPointMake(btn.tag * ScreenW, 0) animated:NO];
    }
    
    
    
}
- (void) titleBtnSelect:(UIButton *)btn {
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}
#pragma mark - childVC
- (void)addChildVCs {
    KZPTopicAllController *allVC = [[KZPTopicAllController alloc]init];
    allVC.title = @"全部";
    [self addChildViewController:allVC];
    
    KZPTopicVideoController *videoVC = [[KZPTopicVideoController alloc]init];
    videoVC.title = @"视频";
    [self addChildViewController:videoVC];
    
     KZPTopicAudioController *audioVC = [[KZPTopicAudioController alloc]init];
    audioVC.title = @"声音";
    [self addChildViewController:audioVC];
    
    KZPTopicPictureController *picVC = [[KZPTopicPictureController alloc]init];
    picVC.title = @"图片";
    [self addChildViewController:picVC];
    
    KZP_TopicTextController *textVC = [[KZP_TopicTextController alloc]init];
    textVC.title = @"段子";
    [self addChildViewController:textVC];
}




- (void)setUpNav {
    //设置左边 barButtonItem
    //如果直接用 btn 来包装 barBtnItem  超过 btn 的部分  btn 也会响应
//    用一个 view 来包装
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_item_game_iconN" hightlightedImageName:@"nav_item_game_click_iconN" andAddTarget:self action:@selector(gameBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置 中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置右边
  
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationButtonRandomN" hightlightedImageName:@"navigationButtonRandomClickN" andAddTarget:self action:@selector(randomBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - collectionView
static  NSString * const ID = @"item";

- (void)setUpCollectionView {
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.itemSize = [UIScreen mainScreen].bounds.size;
    fl.minimumLineSpacing = 0;
    fl.minimumInteritemSpacing = 0;
    fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:fl];
    collectionV.backgroundColor = [UIColor yellowColor];
    collectionV.dataSource = self;
    collectionV.delegate = self;
    collectionV.bounces = NO;
    collectionV.pagingEnabled = YES;
    
    //注册 item
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.collectionV = collectionV;
    [self.view addSubview:collectionV];
}
#pragma mark - collectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childViewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    UIViewController *vc = self.childViewControllers[indexPath.item];
    
    [cell.contentView addSubview:vc.view];
    return  cell;
}
#pragma mark - collectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index =  scrollView.contentOffset.x / ScreenW;
    [self titleBtnClick:self.btns[index]];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.indicatorV.kzp_centerX = scrollView.contentOffset.x / 5 + ScreenW / 10;

}

#pragma mark - 导航栏按键点击方法
- (void)gameBtnClick {
    NSLog(@"%s",__func__);
}

- (void)randomBtnClick {
    NSLog(@"%s",__func__);

}



@end
