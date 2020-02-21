// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "RBProcessHook.h"
%hook RBProcess
- (void)_lock_suspend{
	if ([[RBProcessHook shareInstacne] should_lock_suspend:self]){
		%orig;
	}
}
- (void)_lock_resume{
	if ([[RBProcessHook shareInstacne] should_lock_resume:self]){
		%orig;
	}
}
- (_Bool)_lock_terminateWithContext:(id)arg1{
	if ([[RBProcessHook shareInstacne] should_lock_terminate:self]){
		return %orig;
	}
	return NO;
}
%end
