//
//  MLNPerspectiveTraceManager.m
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import "MLNPerspectiveTraceManager.h"

@implementation MLNPerspectiveTraceManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static MLNPerspectiveTraceManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [MLNPerspectiveTraceManager sharedInstance];
}


- (void)reload
{
    
}

@end
