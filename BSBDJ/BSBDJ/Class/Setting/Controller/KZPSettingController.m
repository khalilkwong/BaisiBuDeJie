//
//  KZPSettingController.m
//  BSBDJ
//
//  Created by khalil  on 16/12/5.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPSettingController.h"
#import "KZPFileManager.h"
#import "KZPClearCacheCell.h"
static NSString * const ID = @"Cell";
@interface KZPSettingController ()
@property(nonatomic,assign) NSUInteger size;

@end

@implementation KZPSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[KZPBackView view]];
    [self.tableView registerClass:[KZPClearCacheCell class] forCellReuseIdentifier:ID];
}
- (void)viewWillAppear:(BOOL)animated {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 缓存字符串
//缓存字符串
-(NSString*)getCacheStr{
    
    //缓存尺寸
    //1MB=1000KB=1000*1000B
    //1KB =1000B
    NSString*  cacheStr = @"清除缓存";
    NSInteger  size = 0;
    //block 捕获
    
    size = self.size;
    CGFloat sizeF = 0;
    if (size>=1000*1000) {//大于1MB
        sizeF = size/1000.0/1000.0;
        cacheStr = [NSString stringWithFormat:@"%@(%.1fMB)",cacheStr,sizeF];
        
    }else if (size>=1000){//大于1KB
        sizeF = size/1000.0;
        cacheStr = [NSString stringWithFormat:@"%@(%.1fKB)",cacheStr,sizeF];
        
        
    }else if (size>0){//大于0B
        cacheStr = [NSString stringWithFormat:@"%@(%zdB)",cacheStr,size];
    }
    
    cacheStr  = [cacheStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
    
    return cacheStr;
    
    
    
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KZPClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
//    cell.textLabel.text = [KZPFileManager ];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
//        [KZPFileManager cleanCache];
        [self.tableView reloadData];
    }
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
