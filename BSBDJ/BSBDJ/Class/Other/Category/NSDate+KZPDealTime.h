//
//  NSDate+KZPDealTime.h
//  demo
//
//  Created by khalil on 2016/12/14.
//  Copyright © 2016年 khalil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KZPDealTime)
-(BOOL)isThisYear;
-(BOOL)isToday;
-(BOOL)isYesterToday;
-(NSDateComponents*)dealTime;
@end
