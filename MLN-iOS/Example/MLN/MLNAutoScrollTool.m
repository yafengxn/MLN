//
//  MLNAutoScrollTool.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/13.
//  Copyright © 2019 MOMO. All rights reserved.
//

#import "MLNAutoScrollTool.h"
#import <MLNKit.h>

#define kDefautlInterval 0.5

@implementation MLNAutoScrollTool
{
    NSMutableArray *_targetPointArray;
    NSTimer *_timer;
    UIScrollView *_targetScrollView;
}

- (instancetype)init
{
    if (self = [super init]) {
        _interval = kDefautlInterval;
    }
    return self;
}

- (instancetype)initWithLuaCore:(MLNLuaCore *)luaCore
{
    if (self = [super initWithLuaCore:luaCore]) {
        _interval = kDefautlInterval;
    }
    return self;
}

- (void)lua_autoScrollWithView:(UIScrollView *)scrollView filePath:(NSString *)filePath
{
    NSString *realFilePath = [self realFilePath:filePath];
    [self autoScrollWithView:scrollView filePath:realFilePath];
}

- (void)lua_stopAutoScroll
{
    [self stopAutoScroll];
}

#pragma mark - Public method
- (void)autoScrollWithView:(UIScrollView *)scrollView filePath:(NSString *)filePath
{
    UIScrollView *realScrollView = scrollView;
    if ([scrollView conformsToProtocol:@protocol(MLNPaddingContainerViewProtocol)] && scrollView.lua_contentView) {
        realScrollView = (UIScrollView *)scrollView.lua_contentView;
    }
    
    MLNLuaAssert(self.mln_luaCore, scrollView && [realScrollView isKindOfClass:[UIScrollView class]], @"The first parameter must could scroll!");
    MLNLuaAssert(self.mln_luaCore, [filePath isKindOfClass:[NSString class]] && filePath.length > 0, @"The first parameter must could scroll!");
    
    _targetScrollView = realScrollView;
    _targetPointArray = [self targetScrollPointInFile:filePath];
    
    _timer = [NSTimer timerWithTimeInterval:self.interval target:self selector:@selector(tickTok:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stopAutoScroll
{
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - Private method
- (NSString *)realFilePath:(NSString *)filePath
{
    NSString *relativeHeader = @"file://";
    if ([filePath hasPrefix:relativeHeader]) {
        NSString *temp = [filePath stringByReplacingOccurrencesOfString:relativeHeader withString:@""];
        NSString *rootPath = MLNFile.fileManagerRootPath;
        return [rootPath stringByAppendingPathComponent:temp];
    }
    return filePath;
}

- (void)tickTok:(NSTimer *)timer
{
    if (!_targetPointArray || _targetPointArray.count <= 0) {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    
    NSDictionary *dict = [_targetPointArray firstObject];
    CGPoint point;
    point.x = [[dict valueForKey:@"x"] floatValue];
    point.y = [[dict valueForKey:@"y"] floatValue];
    [_targetPointArray removeObjectAtIndex:0];
    if (_targetScrollView) {
        [_targetScrollView setContentOffset:point animated:YES];
    }
}

- (NSMutableArray *)targetScrollPointInFile:(NSString *)filePath
{
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!fileExist) {
        MLNLuaError(self.mln_luaCore, @"The target file does not exist!");
        return nil;
    }
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    NSArray *pointArray = [info valueForKey:@"points"];
    if (pointArray.count <= 0) {
        return nil;
    }
    return [NSMutableArray arrayWithArray:pointArray];
}

#pragma mark - Setup for Lua
LUA_EXPORT_BEGIN(MLNAutoScrollTool)
LUA_EXPORT_METHOD(autoScrollWithView, "lua_autoScrollWithView:filePath:", MLNAutoScrollTool)
LUA_EXPORT_METHOD(stopAutoScroll, "lua_stopAutoScroll", MLNAutoScrollTool)
LUA_EXPORT_END(MLNAutoScrollTool, AutoScrollTool, NO, NULL, NULL)

@end
