//
//  MLNPerspectiveTraceManager.h
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNPerspectiveTraceManager : NSObject

+ (instancetype)sharedInstance;

- (void)reload;

@end

NS_ASSUME_NONNULL_END
