//
//  MLNBenchmark.h
//  MLNDevTool
//
//  Created by xindong on 2019/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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
