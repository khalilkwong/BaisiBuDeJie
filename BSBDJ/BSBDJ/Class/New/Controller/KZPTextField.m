//
//  KZPTextField.m
//  BSBDJ
//
//  Created by khalil  on 16/12/10.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPTextField.h"

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
    [self setValue:[UIColor colorWithWhite:0.7 alpha:1] forKeyPath:@"placeholderLabel.textColor"];
}

- (BOOL)becomeFirstResponder {
 
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    
    return    [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self setValue:[UIColor colorWithWhite:0.7 alpha:1] forKeyPath:@"placeholderLabel.textColor"];
      return    [super resignFirstResponder];
}




@end
