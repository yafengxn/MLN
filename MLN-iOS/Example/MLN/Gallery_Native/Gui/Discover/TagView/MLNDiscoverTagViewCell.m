//
//  MLNDiscoverTagViewCell.m
//  MLN_Example
//
//  Created by Feng on 2019/11/27.
//  Copyright © 2019 liu.xu_1586. All rights reserved.
//

#import "MLNDiscoverTagViewCell.h"

@interface MLNDiscoverTagViewCell()
@property (nonatomic, strong) UILabel *label;
@end

@implementation MLNDiscoverTagViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
    }
    return self;
}


- (void)setContent:(NSString *)content
{
    self.label.text = content;
    [self relayoutTagView];
}

- (void)relayoutTagView
{
    [self.label sizeToFit];
    self.cellWidth = self.label.frame.size.width + 10;
    self.label.frame = self.bounds;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:12];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.layer.cornerRadius = 10;
        _label.layer.masksToBounds = YES;
        [self.contentView addSubview:_label];
    }
    return _label;
}
@end
