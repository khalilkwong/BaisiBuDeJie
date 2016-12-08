//
//  NSString+KZPURL.m
//  BSBDJ
//
//  Created by khalil  on 16/12/7.
//  Copyright © 2016年 khalil . All rights reserved.
//

#import "NSString+KZPURL.h"

@implementation NSString (KZPURL)
- (NSURL *)kzp_url {
    return [NSURL URLWithString:self];
}
@end
