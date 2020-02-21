//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Oct 15 2018 10:31:50).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>
#import <os/lock.h>
#import "RBSProcessIdentity.h"

@class BSAuditToken, BSMachPortTaskNameRight, NSString, RBLaunchdJob, RBProcessState, RBSProcessExitContext, RBSProcessExitStatus, RBSProcessHandle, RBSProcessIdentifier, RBSProcessIdentity, RBSProcessInstance;
@protocol OS_dispatch_source, RBBundleProperties, RBJetsamBandProviding, RBSProcessIdentifier, BSDescriptionProviding;

@interface RBProcess : NSObject <RBSProcessIdentifier, BSDescriptionProviding>
{
    int _pid;
    RBLaunchdJob *_job;
    RBSProcessIdentity *_identity;
    RBSProcessHandle *_handle;
    BSMachPortTaskNameRight *_taskNameRight;
    NSString *_logProem;
    id <RBJetsamBandProviding> _jetsamProvider;
    RBProcess *_hostProcess;
    struct os_unfair_lock_s _lock;
    RBProcessState *_lock_appliedState;
    RBProcessState *_lock_state;
    int _appliedJetsamPriority;
    _Bool _platformBinary;
    _Bool _usesSocketMonitoring;
    _Bool _systemPreventsIdleSleep;
    unsigned char _manageFlags;
    NSObject<OS_dispatch_source> *_procSource;
    double _cachedProcessStartTime;
    _Bool _systemShell;
    _Bool _terminating;
    _Bool _suspended;
    int _requestedJetsamPriority;
    RBSProcessIdentifier *_identifier;
    RBSProcessInstance *_instance;
    RBSProcessExitContext *_lastExitContext;
    RBSProcessExitStatus *_intendedExitStatus;
    id <RBBundleProperties> _bundleProperties;
    BSAuditToken *_auditToken;
    NSString *_underlyingAssertion;
    double _processStartTime;
}

@property(readonly, nonatomic) NSString *underlyingAssertion; // @synthesize underlyingAssertion=_underlyingAssertion;
@property(readonly, nonatomic, getter=isSuspended) _Bool suspended; // @synthesize suspended=_suspended;
@property(nonatomic, getter=isTerminating) _Bool terminating; // @synthesize terminating=_terminating;
@property(readonly, nonatomic, getter=isSystemShell) _Bool systemShell; // @synthesize systemShell=_systemShell;
@property(readonly, nonatomic) int requestedJetsamPriority; // @synthesize requestedJetsamPriority=_requestedJetsamPriority;
@property(readonly, copy, nonatomic) BSAuditToken *auditToken; // @synthesize auditToken=_auditToken;
@property(readonly, nonatomic) RBProcess *hostProcess; // @synthesize hostProcess=_hostProcess;
@property(readonly, nonatomic, getter=isPlatformBinary) _Bool platformBinary; // @synthesize platformBinary=_platformBinary;
@property(readonly, nonatomic) id <RBBundleProperties> bundleProperties; // @synthesize bundleProperties=_bundleProperties;
@property(readonly, nonatomic) RBLaunchdJob *job; // @synthesize job=_job;
@property(copy, nonatomic) RBSProcessExitStatus *intendedExitStatus; // @synthesize intendedExitStatus=_intendedExitStatus;
@property(readonly, copy, nonatomic) RBSProcessHandle *handle; // @synthesize handle=_handle;
@property(readonly, nonatomic) NSString *logProem; // @synthesize logProem=_logProem;
@property(readonly, copy, nonatomic) RBSProcessInstance *instance; // @synthesize instance=_instance;
@property(readonly, copy, nonatomic) RBSProcessIdentity *identity; // @synthesize identity=_identity;
@property(readonly, copy, nonatomic) RBSProcessIdentifier *identifier; // @synthesize identifier=_identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)arg1;
- (id)descriptionWithMultilinePrefix:(id)arg1;
- (id)succinctDescriptionBuilder;
- (id)succinctDescription;
@property(readonly, copy) NSString *description;
- (id)processPredicate;
- (_Bool)matchesProcess:(id)arg1;
- (int)rbs_pid;
- (void)invokeHandlerOnProcessDeath:(void (^)(id))arg1 onQueue:(id)arg2;
- (id)_lock_allowedLockedFilePaths;
- (id)_lock_lockedFilePathsIgnoringAllowed;
- (void)_lock_applyCPULimits;
- (void)_lock_resumeCPUMonitoring;
- (void)_lock_restoreCPULimitDefaults;
- (void)_lock_disableCPULimits;
- (void)_lock_setCPULimits:(int *)arg1 violationPolicy:(unsigned long long)arg2;
- (void)_lock_applyJetsamPriority;
- (void)_lock_applyGPU;
- (void)_lock_applyRole;
- (void)_applyJetsamLenientModeState:(_Bool)arg1;
- (void)_lock_applyJetsamLenientMode;
- (void)_lock_shutdownSockets;
- (void)_lock_resume;
- (void)_lock_suspend;
- (void)_lock_applyCurrentStateIfPossible;
- (_Bool)_sendSignal:(int)arg1;
- (_Bool)_lock_terminateWithContext:(id)arg1;
- (_Bool)terminateWithContext:(id)arg1;
- (void)_applyState:(id)arg1;
- (void)invalidate;
@property(readonly, nonatomic) int currentJetsamPriority;
@property(readonly, copy, nonatomic) RBSProcessExitContext *lastExitContext; // @synthesize lastExitContext=_lastExitContext;
- (void)_systemPreventIdleSleepStateDidChange:(_Bool)arg1;
@property(readonly, nonatomic, getter=isBeingPtraced) _Bool beingPtraced;
@property(readonly, nonatomic, getter=isLifecycleManaged) _Bool lifecycleManaged;
@property(readonly, nonatomic, getter=isReported) _Bool reported;
@property(readonly, nonatomic) double processStartTime; // @synthesize processStartTime=_processStartTime;
- (id)_initWithInstance:(id)arg1 taskNameRight:(id)arg2 job:(id)arg3 bundleProperties:(id)arg4 jetsamBandProvider:(id)arg5 initialState:(id)arg6 hostProcess:(id)arg7 properties:(id)arg8 systemPreventsIdleSleep:(_Bool)arg9;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end
