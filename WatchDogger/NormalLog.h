//
//  Log.h
//  TweakDemo
//
//  Created by jiang on 2018/6/7.
//

#import <Foundation/Foundation.h>
#if DEBUG
#define LOG_PATH @"/var/mobile/Documents/"
#define ProcessLog(value,...)  CLog(@"RBProcess.log",value,##__VA_ARGS__)

#define CLog(filename,value,...)        Log(filename,nil,__FILE__,"",__LINE__,value,##__VA_ARGS__)
#define FLog(filename,value,...)        Log(filename,nil,__FILE__,__func__,__LINE__,value,##__VA_ARGS__)
#define DLog(filename,domain,value,...) Log(filename,domain,__FILE__,__func__,__LINE__,value,##__VA_ARGS__)

//#define SLog(value,...) \
//    if ([APPSTORE_BUNDLE_ID isEqualToString:APPSTORE_BUNDLE_ID]) {\
//        \
//    }else if ([APPSTORE_BUNDLE_ID isEqualToString:SPRINGBOARD_BUNDLE_ID]){\
//        CLog(value,##__VA_ARGS__);\
//    }\
//    CLog(value,##__VA_ARGS__)

extern void Log(NSString *filename,id domain,const char file[],const char funcname[],int line,id value,...);
extern void NLCleaerLog(void);

#else

#define ProcessLog(value,...)

#endif
