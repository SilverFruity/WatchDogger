//
//  Log.m
//  TweakDemo
//
//  Created by jiang on 2018/6/7.
//

#import "NormalLog.h"
#import "NSDateFormatter+ShareInstance.h"
#if DEBUG
void Log(NSString *logfilename,id domain,const char file[],const char funcname[],int line,id value,...){
    static dispatch_queue_t logQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logQueue = dispatch_queue_create("LogQueue", DISPATCH_QUEUE_SERIAL);
    });
    if ([value isKindOfClass:[NSString class]]) {
        va_list ap;
        va_start(ap,value);
        value = [[NSString alloc] initWithFormat:(NSString *)value arguments:ap];
        va_end(ap);
    }
    NSString *info = nil;
    NSString *dateStr = [NSDateFormatter current:@"yyyy-MM-dd hh:mm:ss"];
    NSString *filename = [NSString stringWithUTF8String:file];
    filename =  [filename componentsSeparatedByString:@"/"].lastObject;
    if (domain == nil){
        info = [NSString stringWithFormat:@"%@ %@ %s [%d行]: %@\n", dateStr,filename,funcname,line,value];
    }else{
        info = [NSString stringWithFormat:@"%@ %@ %s [%d行]: %@ >> %@\n", dateStr,filename,funcname,line,domain,value];
    }
    
    NSData *buffer = [info dataUsingEncoding:NSUTF8StringEncoding];
    
    dispatch_async(logQueue, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [LOG_PATH stringByAppendingString:logfilename] ;
        
        if (![fileManager fileExistsAtPath:filePath]) {
            if(![fileManager createFileAtPath:filePath contents:buffer attributes:nil]){
                NSLog(@"%@",info);
            }
            return;
        }
        NSFileHandle  *outFile = [NSFileHandle fileHandleForWritingAtPath:filePath];
        if(outFile != nil) {
            [outFile seekToEndOfFile];
            [outFile writeData:buffer];
            [outFile closeFile];
        }
    });

}
void NLCleaerLog(void){
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = LOG_PATH;
    if ([fileManager fileExistsAtPath:filePath]) {
        [fileManager removeItemAtPath:filePath error:nil];
    }
}
#endif
