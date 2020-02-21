//
//  RBProcessHook.h
//  TMallTweak
//
//  Created by Jiang on 2020/2/20.
//

#import <Foundation/Foundation.h>
#import "RBProcess.h"
NS_ASSUME_NONNULL_BEGIN

@interface RBProcessHook : NSObject
@property (nonatomic, copy)NSDictionary *settingCache;
+ (instancetype)shareInstacne;
- (void)reloadSettingCache;
- (BOOL)should_lock_resume:(RBProcess *)process;
- (BOOL)should_lock_suspend:(RBProcess *)process;
- (BOOL)should_lock_terminate:(RBProcess *)process;
@end

NS_ASSUME_NONNULL_END
