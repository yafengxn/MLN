//
//  MLNFPSLabel.h
//  MLN_Example
//
//  Created by MoMo on 2019/11/2.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNFPSLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame;
- (void)startRecordCompletion:(dispatch_block_t)completion;
- (void)endRecordCompletion:(dispatch_block_t)completion;

@end

NS_ASSUME_NONNULL_END
