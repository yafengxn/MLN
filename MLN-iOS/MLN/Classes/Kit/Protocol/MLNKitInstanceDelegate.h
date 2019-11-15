//
//  MLNKitInstanceDelegate.h
//  MLN
//
//  Created by MoMo on 2019/9/4.
//

#ifndef MLNKitInstanceDelegate_h
#define MLNKitInstanceDelegate_h

@class MLNKitInstance;

/**
 KitInstance代理协议
 */
@protocol MLNKitInstanceDelegate <NSObject>

@optional

/**
 即将装载Lua引擎

 @param instance 承载Lua引擎的实例
 */
- (void)willSetupLuaCore:(MLNKitInstance *)instance;

/**
 完成装载Lua引擎
 
 @param instance 承载Lua引擎的实例
 */
- (void)didSetupLuaCore:(MLNKitInstance *)instance;


/**
 即将注册Kit bridge
 
 @param instance 承载Lua引擎的实例
 */
- (void)willRegisterKitClasses:(MLNKitInstance *)instance;

/**
 完成注册Kit bridge
 
 @param instance 承载Lua引擎的实例
 */
- (void)didRegisterKitClasses:(MLNKitInstance *)instance;

/**
 即将加载文件

 @param instance 承载Lua引擎的实例
 @param data 文件对应的数据
 @param fileName 文件路径
 */
- (void)instance:(MLNKitInstance *)instance willLoad:(NSData *)data fileName:(NSString *)fileName;

/**
 完成加载文件
 
 @param instance 承载Lua引擎的实例
 @param data 文件对应的数据
 @param fileName 文件路径
 */
- (void)instance:(MLNKitInstance *)instance didLoad:(NSData *)data fileName:(NSString *)fileName;

/**
 加载文件失败
 
 @param instance 承载Lua引擎的实例
 @param data 文件对应的数据
 @param fileName 文件路径
 @param error 错误信息
 */
- (void)instance:(MLNKitInstance *)instance didFailLoad:(NSData *)data fileName:(NSString *)fileName error:(NSError *)error;

/**
 即将执行文件
 
 @param instance 承载Lua引擎的实例
 */
- (void)willRunFile:(MLNKitInstance *)instance fileName:(NSString *)fileName;

/**
 完成执行文件
 
 @param instance 承载Lua引擎的实例
 */
- (void)didRunFile:(MLNKitInstance *)instance fileName:(NSString *)fileName;

/**
 即将开始首次强制布局
 
 @param instance 承载Lua引擎的实例
 */
- (void)willForceLayoutWindow:(MLNKitInstance *)instance;

/**
 完成首次强制布局
 
 @param instance 承载Lua引擎的实例
 */
- (void)didForceLayoutWindow:(MLNKitInstance *)instance;

/**
 模块执行完成

 @param instance 承载Lua引擎的实例
 @param entryFileName 被执行模块的入口文件
 */
- (void)instance:(MLNKitInstance *)instance didFinishRun:(NSString *)entryFileName;

/**
 模块执行失败

 @param instance 承载Lua引擎的实例
 @param entryFileName 被执行模块的入口文件
 @param error 失败的信息
 */
- (void)instance:(MLNKitInstance *)instance didFailRun:(NSString *)entryFileName error:(NSError *)error;

/**
 即将释放Lua引擎

 @param instance 承载Lua引擎的实例
 */
- (void)willReleaseLuaCore:(MLNKitInstance *)instance;

/**
 Lua引擎已释放
 
 @param instance 承载Lua引擎的实例
 */
- (void)didReleaseLuaCore:(MLNKitInstance *)instance;

@end

#endif /* MLNKitInstanceDelegate_h */
