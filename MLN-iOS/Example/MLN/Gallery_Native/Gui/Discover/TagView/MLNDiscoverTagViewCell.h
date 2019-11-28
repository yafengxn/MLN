//
//  MLNDiscoverTagViewCell.h
//  MLN_Example
//
//  Created by Feng on 2019/11/27.
//  Copyright © 2019 liu.xu_1586. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNDiscoverTagViewCell : UICollectionViewCell

@property (nonatomic, assign) CGFloat cellWidth;

- (void)setContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
