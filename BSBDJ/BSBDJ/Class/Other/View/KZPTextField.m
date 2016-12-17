//
//  KZPTextField.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTextField.h"
#import "UITextField+KZPPlaceHolderColor.h"
@implementation KZPTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    self.placeholderColor = [UIColor grayColor];
}

- (BOOL)becomeFirstResponder {
 
    self.placeholderColor = [UIColor whiteColor];
    
    return    [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    self.placeholderColor = [UIColor grayColor];
      return    [super resignFirstResponder];
}




@end
