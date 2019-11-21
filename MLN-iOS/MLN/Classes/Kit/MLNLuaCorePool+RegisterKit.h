//
//  MLNLuaCorePool+RegisterKit.h
//  MLN
//
//  Created by Feng on 2019/11/21.
//

#import "MLNLuaCorePool.h"

NS_ASSUME_NONNULL_BEGIN
@class MLNLuaCore;
@protocol MLNExportProtocol;
@interface MLNLuaCorePool (RegisterKit)

+ (void)registerKitWithLuaCore:(MLNLuaCore *)luaCore;

@end

NS_ASSUME_NONNULL_END
