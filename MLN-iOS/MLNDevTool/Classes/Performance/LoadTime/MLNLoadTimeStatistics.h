//
//  MLNLoadTimeStatistics.h
//  MLN
//
//  Created by MoMo on 2019/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNLoadTimeStatistics : NSObject

@property (nonatomic, assign, readonly) CFAbsoluteTime startTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime endTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime setupCoreStartTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime setupCoreEndTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime registerKitStartTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime registerKitEndTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime runFileStartTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime runFileEndTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime forceLayoutWindowStartTime;
@property (nonatomic, assign, readonly) CFAbsoluteTime forceLayoutWindowEndTime;

+ (instancetype)sharedInstance;

- (void)resetLoadTimeRecord;
- (void)recordLoadStartTime;
- (void)recordLoadEndTime;
- (CFAbsoluteTime)loadTime;

- (void)resetRegisterKitTimeRecord;
- (void)recordRegisterKitStartTime;
- (void)recordRegisterKitEndTime;
- (CFAbsoluteTime)registerKitTime;

- (void)resetSetupCoreTimeRecord;
- (void)recordSetupCoreStartTime;
- (void)recordSetupCoreEndTime;
- (CFAbsoluteTime)setupCoreTime;

- (void)resetRunFileTimeRecord;
- (void)recordRunFileStartTime;
- (void)recordRunFileEndTime;
- (CFAbsoluteTime)recordRunFileTime;

- (void)resetForceLayoutWindowTime;
- (void)recordForceLayoutWindowStartTime;
- (void)recordForceLayoutWindowEndTime;
- (CFAbsoluteTime)forceLayoutWindowTime;

@end

NS_ASSUME_NONNULL_END
