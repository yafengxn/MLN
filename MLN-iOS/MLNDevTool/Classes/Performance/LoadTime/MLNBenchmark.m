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
    printf("\n=========== %s start loading  ================\n", type);
    _begin = CACurrentMediaTime();
}

+ (CFTimeInterval)endLoadTimeBenchmark:(MLNBenchmarkType)type {
    CFTimeInterval time = (CACurrentMediaTime() - _begin);
    printf("MLN %s load time: %10.2fms\n", type, time * 1000);
    printf("=========== %s finish loading ================\n", type);
    return time;
}

+ (NSUInteger)addLoadTime:(CFTimeInterval)time {
    if (!_loadTimes) {
        _loadTimes = [NSMutableArray array];
    }
    [_loadTimes addObject:@(time * 1000)];
    return _loadTimes.count;
}

+ (void)removeAllLoadTime {
    [_loadTimes removeAllObjects];
}

+ (CFTimeInterval)averageLoadTime:(MLNBenchmarkType)type {
    if (_loadTimes.count) {
        [_loadTimes sortUsingSelector:@selector(compare:)];
        NSLog(@"load times %@", _loadTimes);
        
        [_loadTimes removeObjectAtIndex:0]; // remove a min value
        [_loadTimes removeLastObject];      // remove a max value
        NSLog(@"load times %@", _loadTimes);
        
        NSNumber *averageTime = [_loadTimes valueForKeyPath:@"@avg.doubleValue"];
        printf("=========== %s average load time: %0.2fms (%d count) ================\n", type, averageTime.doubleValue, (int)_loadTimes.count);
        return averageTime.doubleValue;
    }
    return 0.0;
}

@end
