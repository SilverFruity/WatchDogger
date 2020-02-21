#line 1 "/Users/Memerys/WatchDogger/WatchDogger/WatchDogger.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class RBProcess; 
static void (*_logos_orig$_ungrouped$RBProcess$_lock_suspend)(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$RBProcess$_lock_suspend(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$RBProcess$_lock_resume)(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$RBProcess$_lock_resume(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$RBProcess$_lock_terminateWithContext$)(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$RBProcess$_lock_terminateWithContext$(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST, SEL, id); 

#line 7 "/Users/Memerys/WatchDogger/WatchDogger/WatchDogger.xm"
#import <UIKit/UIKit.h>
#import "RBProcessHook.h"

static void _logos_method$_ungrouped$RBProcess$_lock_suspend(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if ([[RBProcessHook shareInstacne] should_lock_suspend:self]){
		_logos_orig$_ungrouped$RBProcess$_lock_suspend(self, _cmd);
	}
}
static void _logos_method$_ungrouped$RBProcess$_lock_resume(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	if ([[RBProcessHook shareInstacne] should_lock_resume:self]){
		_logos_orig$_ungrouped$RBProcess$_lock_resume(self, _cmd);
	}
}
static _Bool _logos_method$_ungrouped$RBProcess$_lock_terminateWithContext$(_LOGOS_SELF_TYPE_NORMAL RBProcess* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	if ([[RBProcessHook shareInstacne] should_lock_terminate:self]){
		return _logos_orig$_ungrouped$RBProcess$_lock_terminateWithContext$(self, _cmd, arg1);
	}
	return NO;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$RBProcess = objc_getClass("RBProcess"); MSHookMessageEx(_logos_class$_ungrouped$RBProcess, @selector(_lock_suspend), (IMP)&_logos_method$_ungrouped$RBProcess$_lock_suspend, (IMP*)&_logos_orig$_ungrouped$RBProcess$_lock_suspend);MSHookMessageEx(_logos_class$_ungrouped$RBProcess, @selector(_lock_resume), (IMP)&_logos_method$_ungrouped$RBProcess$_lock_resume, (IMP*)&_logos_orig$_ungrouped$RBProcess$_lock_resume);MSHookMessageEx(_logos_class$_ungrouped$RBProcess, @selector(_lock_terminateWithContext:), (IMP)&_logos_method$_ungrouped$RBProcess$_lock_terminateWithContext$, (IMP*)&_logos_orig$_ungrouped$RBProcess$_lock_terminateWithContext$);} }
#line 27 "/Users/Memerys/WatchDogger/WatchDogger/WatchDogger.xm"
