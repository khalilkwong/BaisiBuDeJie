//
//  KZPLoginView.m
//  BSBDJ
//
//  Created by khalil  on 16/12/8.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "KZPLoginView.h"
@interface KZPLoginView ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end



@implementation KZPLoginView

+ (instancetype)loginView {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

+ (instancetype)registerView {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

//- (IBAction)phoneTFClick:(id)sender {
//
//
//    [self.phoneTF setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
//    self.phoneTF.tintColor = [UIColor redColor];
//}
//- (IBAction)phoneTFEndEdit:(id)sender {
//    [self.phoneTF setValue:[UIColor colorWithWhite:0.7 alpha:1] forKeyPath:@"placeholderLabel.textColor"];
//}
//- (IBAction)pwdTFClick:(id)sender {
//   [self.pwdTF setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
//       self.phoneTF.tintColor = [UIColor redColor];
//}
//- (IBAction)pwdTFEndEdit:(id)sender {
//    [self.pwdTF setValue:[UIColor colorWithWhite:0.7 alpha:1] forKeyPath:@"placeholderLabel.textColor"];
//}

- (void)awakeFromNib {
    [super awakeFromNib];
//    KZPLog(@"%@",self.pwdTF.placeholder);
    
    
    UIImage* image = [self.loginBtn backgroundImageForState:UIControlStateNormal];
    //拉伸了图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    //重新给button设置回去
    
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    UIImage* imageH = [self.loginBtn backgroundImageForState:UIControlStateHighlighted];
    //拉伸了图片
    imageH = [imageH stretchableImageWithLeftCapWidth:imageH.size.width*0.5 topCapHeight:imageH.size.height*0.5];
    //重新给button设置回去
    [self.loginBtn setBackgroundImage:imageH forState:UIControlStateHighlighted];
}

@end
