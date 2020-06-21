# WatchDogger
## Core

核心方法

```objective-c
// 请自行导入RBProcess.h RBSProcessIdentity.h，工程中已经包含
%hook RBProcess
- (void)_lock_suspend{
  if ([self.identity.embeddedApplicationIdentifier isEqualToString:@"your bundleId"]) {
    return;
  }
  %orig;
}
- (void)_lock_resume{
	%orig;
}
- (_Bool)_lock_terminateWithContext:(id)arg1{
	return %orig;
}
%end
```

## Preview

![Setting](https://user-gold-cdn.xitu.io/2020/2/22/1706914347056280?imageslim)
