//
//  RBProcessHook.m
//  TMallTweak
//
//  Created by Jiang on 2020/2/20.
//

#import "RBProcessHook.h"
#import <substrate.h>
#import "NormalLog.h"
static void RefreshCache(void)
{
    ProcessLog(@"backGround setting value changed");
    [[RBProcessHook shareInstacne] reloadSettingCache];
}

@implementation RBProcessHook
+ (instancetype)shareInstacne{
    static dispatch_once_t onceToken;
    static RBProcessHook *instance = nil;
    dispatch_once(&onceToken, ^{
        ProcessLog(@"new shareInstacne pid: %ld", getpid());
        instance = [RBProcessHook new];
        [instance reloadSettingCache];
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (void *)RefreshCache, CFSTR("com.silverfruity.watchdogger.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    });
    return instance;
}
- (void)dealloc{
    ProcessLog(@"remove Observer");
    CFNotificationCenterRemoveObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, CFSTR("com.silverfruity.watchdogger.settingschanged"), NULL);
}
- (void)reloadSettingCache{
    self.settingCache = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.silverfruity.WatchDogger.plist"];
}
- (BOOL)should_lock_resume:(RBProcess *)process{
    return YES;
}
- (BOOL)should_lock_suspend:(RBProcess *)process{
    NSString *key = [@"WatchDoggerSuperEnabled-" stringByAppendingString:process.identity.embeddedApplicationIdentifier];
    BOOL shouldInBackGround = [self.settingCache[key] boolValue];
    if (shouldInBackGround){
        ProcessLog(@"%@ will run in background",process.identity);
    }
    return !shouldInBackGround;
}
- (BOOL)should_lock_terminate:(RBProcess *)process{
    ProcessLog(@"should_lock_terminate");
    return YES;
}
@end
