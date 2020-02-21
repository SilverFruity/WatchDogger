//
//  NSFormatter+shareInstance.h
//  One Night Flirt
//
//  Created by wudi on 2017/12/18.
//  Copyright © 2017年 wudi360. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ShareInstance)
+ (__kindof NSDateFormatter *)shareInstance;
+ (NSString *)dateString:(NSString *)dateFormat date:(NSDate *)date;
+ (NSDate *)date:(NSString *)dateFormat dateString:(NSString *)dateString;
+ (NSString *)current:(NSString *)dateFormat;
@end
