//
//  NSFormatter+shareInstance.m
//  One Night Flirt
//
//  Created by wudi on 2017/12/18.
//  Copyright © 2017年 wudi360. All rights reserved.
//

#import "NSDateFormatter+ShareInstance.h"
#if DEBUG
@implementation NSDateFormatter (ShareInstance)
+ (instancetype)shareInstance{
    static NSDateFormatter *NSFormatterInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSFormatterInstance = [[NSDateFormatter alloc]init];
    });
    return NSFormatterInstance;
}
+ (NSString *)current:(NSString *)dateFormat{
   return [self dateString:dateFormat date:[NSDate date]];
}
+ (NSString *)dateString:(NSString *)dateFormat date:(NSDate *)date{
    [self shareInstance].dateFormat = dateFormat;
    return [[self shareInstance] stringFromDate:date];
}

+ (NSDate *)date:(NSString *)dateFormat dateString:(NSString *)dateString{
    [self shareInstance].dateFormat = dateFormat;
    return [[self shareInstance] dateFromString:dateString];
}

@end
#endif
