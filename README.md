# WatchDogger
## Core

**Add 'Executables -> runningboardd' in plist**

**remember 'killall runningboardd'**
```objective-c
// please include RBProcess.h and RBSProcessIdentity.h. the project has inlcude those files.
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
