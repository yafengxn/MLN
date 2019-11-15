//
//  MLNLoadTimeStatistics.m
//  MLN
//
//  setupd by MoMo on 2019/11/4.
//

#import "MLNLoadTimeStatistics.h"
#import <objc/runtime.h>
#import <MLNKit.h>
#import <MLNKitBridgesManager.h>

@interface MLNLoadTimeStatistics()
@property (nonatomic, assign, readwrite) CFAbsoluteTime startTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime endTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime setupCoreStartTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime setupCoreEndTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime registerKitStartTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime registerKitEndTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime runFileStartTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime runFileEndTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime forceLayoutWindowStartTime;
@property (nonatomic, assign, readwrite) CFAbsoluteTime forceLayoutWindowEndTime;
@property (nonatomic, strong) NSMutableDictionary *loadTimeDict;
@end


static MLNLoadTimeStatistics *_instance = nil;

@implementation MLNLoadTimeStatistics

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MLNLoadTimeStatistics alloc] init];
    });
    return _instance;
}

- (NSString *)description
{
//    NSString *descriptMessage = [NSString stringWithFormat:@"\n/********** MLN LoadTime Statistics ******/\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", \
//                                 [NSString stringWithFormat:@"setupLuaCoreTime:          %.2f ms", [self setupCoreStartTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"registerKitStartTime:      %.2f ms", [self registerKitStartTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"registerKitEndTime:        %.2f ms", [self registerKitEndTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"registerKitTime:           %.2f ms", [self registerKitEndTime] - [self registerKitStartTime]], \
//                                 [NSString stringWithFormat:@"runFileStartTime:          %.2f ms", [self runFileStartTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"runFileEndTime:            %.2f ms", [self runFileEndTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"runFileTime:               %.2f ms", [self runFileEndTime] - [self runFileStartTime]], \
//                                 [NSString stringWithFormat:@"forceLayoutWindowStartTime:%.2f ms", [self forceLayoutWindowStartTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"forceLayoutWindowEndTime:  %.2f ms", [self forceLayoutWindowEndTime] - [self startTime]], \
//                                 [NSString stringWithFormat:@"forceLayoutWindowTime:     %.2f ms", [self forceLayoutWindowEndTime] - [self forceLayoutWindowStartTime]], \
//                                 [NSString stringWithFormat:@"endTime:                   %.2f ms", [self endTime] - [self startTime]]];
    
    NSString *descriptMessage = [NSString stringWithFormat:@"\n/********** MLN LoadTime Statistics ******/\n%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", \
                                 [NSString stringWithFormat:@"%.2f", [self setupCoreStartTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self registerKitStartTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self registerKitEndTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self registerKitEndTime] - [self registerKitStartTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self runFileStartTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self runFileEndTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self runFileEndTime] - [self runFileStartTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self forceLayoutWindowStartTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self forceLayoutWindowEndTime] - [self startTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self forceLayoutWindowEndTime] - [self forceLayoutWindowStartTime]], \
                                 [NSString stringWithFormat:@"%.2f", [self endTime] - [self startTime]]];
    
    return descriptMessage;
}

- (void)resetLoadTimeRecord
{
    _startTime = 0.0;
    _endTime = 0.0;
}

- (void)recordLoadStartTime
{
    [self resetLoadTimeRecord];
    _startTime = [self currentTime];
}

- (void)recordLoadEndTime
{
    _endTime = [self currentTime];
}

- (NSTimeInterval)loadTime
{
    return _endTime - _startTime;
}

- (void)resetSetupCoreTimeRecord
{
    _setupCoreStartTime = 0.0;
    _setupCoreEndTime = 0.0;
}

- (void)recordSetupCoreStartTime
{
    [self resetSetupCoreTimeRecord];
    _setupCoreStartTime = [self currentTime];
}

- (void)recordSetupCoreEndTime
{
    _setupCoreEndTime = [self currentTime];
}

- (CFAbsoluteTime)setupCoreTime
{
    return _setupCoreEndTime  - _setupCoreStartTime;
}

- (void)resetRegisterKitTimeRecord
{
    _registerKitStartTime = 0.0;
    _registerKitEndTime = 0.0;
}

- (void)recordRegisterKitStartTime
{
    [self resetRegisterKitTimeRecord];
    _registerKitStartTime = [self currentTime];
}

- (void)recordRegisterKitEndTime
{
    _registerKitEndTime = [self currentTime];
}

- (CFAbsoluteTime)registerKitTime
{
    return _registerKitEndTime - _registerKitEndTime;
}

- (void)resetRunFileTimeRecord
{
    _runFileStartTime = 0.0;
    _runFileEndTime = 0.0;
}

- (void)recordRunFileStartTime
{
    [self resetRunFileTimeRecord];
    _runFileStartTime = [self currentTime];
}

- (void)recordRunFileEndTime
{
    _runFileEndTime = [self currentTime];
}

- (CFAbsoluteTime)recordRunFileTime
{
    return _runFileEndTime - _runFileStartTime;
}


- (void)resetForceLayoutWindowTime
{
    _forceLayoutWindowStartTime = 0.0;
    _forceLayoutWindowEndTime = 0.0;
}

- (void)recordForceLayoutWindowStartTime
{
    [self resetForceLayoutWindowTime];
    _forceLayoutWindowStartTime = [self currentTime];
}

- (void)recordForceLayoutWindowEndTime
{
    _forceLayoutWindowEndTime = [self currentTime];
}

- (CFAbsoluteTime)forceLayoutWindowTime
{
    return _forceLayoutWindowEndTime - _forceLayoutWindowStartTime;
}


#pragma mark - Private method
- (CFAbsoluteTime)currentTime
{
    return CFAbsoluteTimeGetCurrent() * 1000;
}

@end
