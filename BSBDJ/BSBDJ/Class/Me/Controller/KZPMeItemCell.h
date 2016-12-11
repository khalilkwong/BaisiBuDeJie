//
//  KZPMeItemCell.h
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import <UIKit/UIKit.h>
@class KZPMeSquareItem;
@interface KZPMeItemCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property(nonatomic,strong)KZPMeSquareItem *item;
@end
