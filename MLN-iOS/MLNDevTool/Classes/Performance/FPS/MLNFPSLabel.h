//
//  MLNFPSLabel.h
//  MLN_Example
//
//  Created by MoMo on 2019/11/2.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

/**
 * 使用方法
 * 1.window上添加FPSLabel控件
 * 2.插入测试数据
 * 3.单击FPSLabel开始记录fps record
 * 4.测试页面自动滚动
 * 5.双击FPSLabel，将fps record写入文件
 * 6.读取fps保存结果
 // 示例代码：
 // 2.插入测试数据，json格式
 {
     "points": [{
        "x":0,
        "y":600
     },{
        "x":0,
        "y":890
     }]
 }
 // 测试页面开始自动滚动
 if (kAutoTestFps) {
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _autoScrollTool = [[MLNAutoScrollTool alloc] init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gallery/json/autoScrollPoints" ofType:@"json"];
        [_autoScrollTool autoScrollWithView:self.waterfallView filePath:filePath];
     });
 }
 // 读取fps结果
 NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"/MLua/fps.txt"];
 if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
    NSLog(@"文件不存在");
 }
 NSArray *fpsArray = [NSArray arrayWithContentsOfFile:filePath];
 __block NSString *fpsText = [NSString string];
 [fpsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    fpsText = [fpsText stringByAppendingString:[NSString stringWithFormat:@",%@", obj]];
 }];
 [self.view makeToast:fpsText duration:10 position:CSToastPositionCenter];
 
 // Lua页面自动测试
 self.autoScrollTool = AutoScrollTool()
 System:setTimeOut(function()
    self.autoScrollTool:autoScrollWithView(self.collectionView, 'file://gallery/json/musicRank.json')
 end, 2.0)
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNFPSLabel : UILabel

@property (nonatomic, copy) NSString *fpsFilePath;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)startRecordCompletion:(dispatch_block_t)completion;
- (void)endRecordCompletion:(dispatch_block_t)completion;
- (NSString *)readFPSRecord;

@end

NS_ASSUME_NONNULL_END
