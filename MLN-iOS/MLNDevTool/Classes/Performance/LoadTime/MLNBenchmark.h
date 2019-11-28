//
//  MLNBenchmark.h
//  MLNDevTool
//
//  Created by xindong on 2019/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef MLNBenchmarkEnable
    #define MLNBenchmarkEnable 1
    #define MLNBenchmarkDetail 1
    #if MLNBenchmarkEnable && MLNBenchmarkDetail
        #define MLNBenchmarkBegin() CFTimeInterval begin = CACurrentMediaTime();
        #define MLNBenchmarkEnd(desc)\
        CFTimeInterval time = CACurrentMediaTime() - begin;\
        printf("===== %s "desc"  time: %2.2fms\n", __func__, time * 1000);
    #else
        #define MLNBenchmarkBegin()
        #define MLNBenchmarkEnd(desc)
    #endif
#endif

typedef const char *MLNBenchmarkType;
extern MLNBenchmarkType MLNBenchmarkTypeLua;
extern MLNBenchmarkType MLNBenchmarkTypeNative;

@interface MLNBenchmark : NSObject

+ (void)beginLoadTimeBenchmark:(const char *)type;
+ (CFTimeInterval)endLoadTimeBenchmark:(const char *)type;

+ (NSUInteger)addLoadTime:(CFTimeInterval)time;
+ (void)removeAllLoadTime;
+ (CFTimeInterval)averageLoadTime:(const char *)type;

@end

NS_ASSUME_NONNULL_END
