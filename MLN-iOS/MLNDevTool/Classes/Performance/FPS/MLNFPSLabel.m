//
//  MLNFPSLabel.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/2.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNFPSLabel.h"
#import "MLNWeakTarget.h"
#import <MLNEntityExportProtocol.h>

#define kDefaultFpsFilePath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"/MLua/fps.txt"]

@interface MLNFPSLabel()
@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) NSTimeInterval lastTime;
@property (nonatomic, strong) NSMutableArray *fpsArray;
@property (nonatomic, assign) BOOL recordFps;
@property (nonatomic, copy) dispatch_block_t startRecordBlock;
@property (nonatomic, copy) dispatch_block_t endRecordBlock;
@end

@implementation MLNFPSLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        _link = [CADisplayLink displayLinkWithTarget:[MLNWeakTarget weakTargetWithObject:self] selector:@selector(tick:)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endRecord)];
        doubleTapGesture.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTapGesture];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startRecord)];
        [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)dealloc
{
    [_link invalidate];
}


- (void)startRecordCompletion:(dispatch_block_t)completion
{
    _startRecordBlock = completion;
}

- (void)endRecordCompletion:(dispatch_block_t)completion
{
    _endRecordBlock = completion;
}



- (void)startRecord
{
    _recordFps = YES;
    [self.fpsArray removeAllObjects];
    if (self.startRecordBlock) {
        self.startRecordBlock();
    }
}

- (void)endRecord
{
    _recordFps = NO;
    [self writeFPSRecord];
    if (self.endRecordBlock) {
        self.endRecordBlock();
    }
}

- (void)writeFPSRecord
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"/MLua/fps.txt"];
    NSString *dstFDirectory = [filePath stringByDeletingLastPathComponent];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dstFDirectory]) {
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dstFDirectory withIntermediateDirectories:YES attributes:nil error:nil];
        if (!success) {
            NSLog(@"文件夹创建失败");
        }
    }
    [self.fpsArray writeToFile:filePath atomically:YES];
}

- (NSString *)readFPSRecord
{
    NSString *filePath = self.fpsFilePath ?: kDefaultFpsFilePath;
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSLog(@"文件不存在");
        return nil;
    }
    NSArray *fpsArray = [NSArray arrayWithContentsOfFile:filePath];
    __block NSString *fpsText = [NSString string];
    [fpsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        fpsText = [fpsText stringByAppendingString:[NSString stringWithFormat:@",%@", obj]];
    }];
    return fpsText;
}

- (NSString *)fpsFilePath
{
    return _fpsFilePath ?: kDefaultFpsFilePath;
}

- (void)tick:(CADisplayLink *)link
{
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count ++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:12];
    self.textColor = [UIColor whiteColor];
    self.text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    
    if (_recordFps) {
        [self.fpsArray addObject:@((int)round(fps))];
    }
}

- (NSMutableArray *)fpsArray
{
    if (!_fpsArray) {
        _fpsArray = [NSMutableArray array];
    }
    return _fpsArray;
}

@end
