//
//  MLNBenchmark.m
//  MLNDevTool
//
//  Created by xindong on 2019/11/27.
//

#import "MLNBenchmark.h"

static CFTimeInterval _begin;
static NSMutableArray *_loadTimes;

MLNBenchmarkType MLNBenchmarkTypeLua = "lua";
MLNBenchmarkType MLNBenchmarkTypeNative = "native";

@implementation MLNBenchmark

+ (void)beginLoadTimeBenchmark:(MLNBenchmarkType)type {
#if MLNBenchmarkEnable
    printf("\n=========== %s start loading  ================\n", type);
    _begin = CACurrentMediaTime();
#endif
}

+ (CFTimeInterval)endLoadTimeBenchmark:(MLNBenchmarkType)type {
#if MLNBenchmarkEnable
    CFTimeInterval time = (CACurrentMediaTime() - _begin);
    printf("MLN %s load time: %10.2fms\n", type, time * 1000);
    printf("=========== %s finish loading ================\n", type);
    return time;
#else
    return 0.0;
#endif
}

+ (NSUInteger)addLoadTime:(CFTimeInterval)time {
#if MLNBenchmarkEnable
    if (!_loadTimes) {
        _loadTimes = [NSMutableArray array];
    }
    [_loadTimes addObject:@(time * 1000)];
    return _loadTimes.count;
#else
    return 0;
#endif
}

+ (void)removeAllLoadTime {
#if MLNBenchmarkEnable
    [_loadTimes removeAllObjects];
#endif
}

+ (CFTimeInterval)averageLoadTime:(MLNBenchmarkType)type {
#if MLNBenchmarkEnable
    if (_loadTimes.count) {
        [_loadTimes sortUsingSelector:@selector(compare:)];
        [_loadTimes removeObjectAtIndex:0]; // remove a min value
        [_loadTimes removeLastObject];      // remove a max value
        NSNumber *averageTime = [_loadTimes valueForKeyPath:@"@avg.doubleValue"];
        printf("=========== %s average load time: %0.2fms (%d count) ================\n", type, averageTime.doubleValue, (int)_loadTimes.count);
        return averageTime.doubleValue;
    }
    return 0.0;
#else
    return 0.0;
#endif
}

@end
