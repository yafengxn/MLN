//
//  MLNLuaCorePool.h
//  MLN
//
//  Created by Feng on 2019/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MLNLuaCore;

@interface MLNLuaCorePool : NSObject

// 初始化缓存池
+ (void)initializeLuaCorePool;

// 所有Instance实例
+ (NSArray *)allIdleLuaCores;

// 从缓存池中取东西
+ (MLNLuaCore *)acuqireALuaCore;

// 清空缓存池
+ (void)clearLuaCorePool;

@end

NS_ASSUME_NONNULL_END
