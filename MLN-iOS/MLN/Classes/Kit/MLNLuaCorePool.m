//
//  MLNLuaCorePool.m
//  MLN
//
//  Created by Feng on 2019/11/20.
//

#import "MLNLuaCorePool.h"
#import "MLNLuaCore.h"
#import "MLNLuaBundle.h"
#import "MLNKiConvertor.h"
#import "MLNExporterManager.h"
#import "MLNLuaCorePool+RegisterKit.h"

static const NSInteger kInstanceCount = 2;

static NSMutableSet<MLNLuaCore *> *_luaCoreIdlePool = nil;

@implementation MLNLuaCorePool

+ (void)initializeLuaCorePool
{
    if (!_luaCoreIdlePool) {
        _luaCoreIdlePool = [[NSMutableSet alloc] initWithCapacity:2];
        [self syncFillLuaCores];
    }
}

+ (NSArray *)allIdleLuaCores
{
    return _luaCoreIdlePool.allObjects;
}

+ (MLNLuaCore *)acuqireALuaCore
{
    NSAssert(_luaCoreIdlePool, @"The luaCoreIdlePool has not been initailized, use 'initializeLuaCorePool' method initilize");
    MLNLuaCore *luaCore = [_luaCoreIdlePool anyObject];
    if (!luaCore) {
        luaCore = [[MLNLuaCore alloc] initWithLuaBundle:[MLNLuaBundle mainBundle] convertor:MLNKiConvertor.class exporter:MLNExporterManager.class];
        [self registerKitWithLuaCore:luaCore];
    } else {
        [_luaCoreIdlePool removeObject:luaCore];
        if (_luaCoreIdlePool.allObjects.count <= 1) {
            [self asyncFillLuaCores];
        }
    }
    return luaCore;
}

+ (void)clearLuaCorePool
{
    [_luaCoreIdlePool removeAllObjects];
}

#pragma mark - Private method

+ (void)syncFillLuaCores
{
    MLNLuaCore *luaCore = [[MLNLuaCore alloc] initWithLuaBundle:[MLNLuaBundle mainBundle] convertor:MLNKiConvertor.class exporter:MLNExporterManager.class];
    [self registerKitWithLuaCore:luaCore];
    [_luaCoreIdlePool addObject:luaCore];
}

+ (void)asyncFillLuaCores
{
    MLNLuaCore *luaCore = [[MLNLuaCore alloc] initWithLuaBundle:[MLNLuaBundle mainBundle] convertor:MLNKiConvertor.class exporter:MLNExporterManager.class];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self registerKitWithLuaCore:luaCore];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_luaCoreIdlePool addObject:luaCore];
        });
    });
}

@end
