//
//  MLNMyErrorHandler.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/13.
//  Copyright © 2019 MOMO. All rights reserved.
//

#import "MLNMyErrorHandler.h"

@implementation MLNMyErrorHandler

- (BOOL)canHandleAssert:(MLNKitInstance *)instance
{
    return YES;
}

- (void)instance:(MLNKitInstance *)instance error:(NSString *)error
{
    NSLog(@">>>>>>> error: %@", error);
}

- (void)instance:(MLNKitInstance *)instance luaError:(NSString *)error luaTraceback:(NSString *)luaTraceback
{
    NSLog(@">>>>>>> error: %@ track: %@", error, luaTraceback);
}

@end
