//
//  MLNAutoScrollTool.h
//  MLN_Example
//
//  Created by Feng on 2019/11/13.
//  Copyright © 2019 liu.xu_1586. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MLNCore.h>
NS_ASSUME_NONNULL_BEGIN

@interface MLNAutoScrollTool : NSObject<MLNEntityExportProtocol>

@property (nonatomic, assign) NSTimeInterval interval;

- (void)autoScrollWithView:(UIScrollView *)scrollView filePath:(NSString *)filePath;

- (void)stopAutoScroll;

@end

NS_ASSUME_NONNULL_END
