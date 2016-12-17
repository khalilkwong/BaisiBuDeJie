//
//  KZPTopicCell.m
//  BSBDJ
//
//  Created by khalil  on 16/12/15.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTopicCell.h"
#import "KZPTopicItem.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "NSDate+KZPDealTime.h"
#import "KZPMainCellBtn.h"
@interface KZPTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *creatTime;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@property (weak, nonatomic) IBOutlet KZPMainCellBtn *dingBtn;
@property (weak, nonatomic) IBOutlet KZPMainCellBtn *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

@end
@implementation KZPTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//通过注册会来到这个方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *backView = [[UIImageView alloc]initWithFrame:self.bounds];
        UIImage *image = [UIImage imageNamed:@"mainCellBackground"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        backView.image = image;
        self.backgroundView = backView;
    }
   
    
    return self;
    
}
- (void)setTopicItem:(KZPTopicItem *)topicItem {
    _topicItem = topicItem;
    
    
    [self.iconV sd_setImageWithURL:topicItem.profile_image.kzp_url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        UIImage *NewImage = [image roundImage];
        self.iconV.image = NewImage;
        [[SDImageCache sharedImageCache] storeImage:NewImage forKey:topicItem.profile_image];
    }];
    self.nameL.text = topicItem.name;
    self.creatTime.text = [self dealTime];
    self.textL.text = topicItem.text;
    if (topicItem.ding) {
         [self.dingBtn setTitle:[NSString stringWithFormat:@"%zd",topicItem.ding] forState:UIControlStateNormal];
    }
    if (topicItem.cai) {
         [self.caiBtn setTitle:[NSString stringWithFormat:@"%zd",topicItem.cai] forState:UIControlStateNormal];
    }
    if (topicItem.repose) {
         [self.repostBtn setTitle:[NSString stringWithFormat:@"%zd",topicItem.repose] forState:UIControlStateNormal];
    }
    if (topicItem.comment) {
        [self.commentBtn setTitle:[NSString stringWithFormat:@"%zd",topicItem.comment] forState:UIControlStateNormal];
    }
    
    
    
}

- (NSString *)dealTime {
    NSString *creatTime = self.topicItem.created_at;
    //日期格式化
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate* creatDate = [formatter dateFromString:creatTime];
    //如果是今年
    if ( [creatDate isThisYear ]) {
        //今天
        if ([creatDate isToday]) {
            NSDateComponents *comp = [creatDate dealTime];
            if (!comp.hour) {//一小时之内
                if (comp.minute <= 1) { //一分钟之内
                    creatTime = @"刚刚";
                } else {
                    creatTime = [NSString stringWithFormat:@"%ld分钟之前",comp.minute];
                }
            }else {//一小时之外
                creatTime = [NSString stringWithFormat:@"%ld小时之前",comp.hour];
            }
        }else if ([creatDate isYesterToday]) {//昨天
            formatter.dateFormat = @"昨天 HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        } else { //今年前天以前
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            creatTime = [formatter stringFromDate:creatDate];
        }
    }
    return creatTime;
    
}
#pragma mark - Btn Click
- (IBAction)seeMoreBtnClick:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle: nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"关注" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        KZPLog(@"点击了关注");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        KZPLog(@"点击了举报");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        KZPLog(@"点击了取消");
    }];
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [alertVC addAction:action3];
    
    [self.window.rootViewController presentViewController:alertVC animated:YES completion:^{
        
    }];
}
- (IBAction)dingBtnClick:(id)sender {
}
- (IBAction)caiBtnClick:(id)sender {
}
- (IBAction)reposeBtnClick:(id)sender {
}
- (IBAction)commentBtnClick:(id)sender {
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
