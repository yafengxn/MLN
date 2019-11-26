//
//  MLNDiscoverAblbumDeatilHeaderView.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/8.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNDiscoverAblbumDeatilHeaderView.h"
#import "MLNDiscoverTagView.h"
#import "MLNNativeTabSegmentView.h"
#import "MLNGalleryNative.h"
#import <UIImageView+WebCache.h>

@interface MLNDiscoverAblbumDeatilHeaderView()

@property (nonatomic, weak) IBOutlet UIImageView *albumImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *followButton;
@property (nonatomic, weak) IBOutlet UIImageView *collectImageView;
@property (nonatomic, weak) IBOutlet UILabel *collectCountLabel;
@property (nonatomic, weak) IBOutlet UIImageView *lookImageView;
@property (nonatomic, weak) IBOutlet UILabel *lookCountLabel;
@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *recommendLabel;
@property (nonatomic, weak) IBOutlet MLNDiscoverTagView *tagView;
@property (weak, nonatomic) IBOutlet MLNNativeTabSegmentView *tabSegementView;
@property (weak, nonatomic) IBOutlet UIView *seperatorView;

@end

@implementation MLNDiscoverAblbumDeatilHeaderView

- (void)reloadWithData:(NSArray *)dataList
{
    if (dataList.count <= 0) {
        return;
    }
    NSString *albumImageString = [dataList[1] valueForKey:@"pic_radio"];
    [self.albumImageView sd_setImageWithURL:[NSURL URLWithString:albumImageString]];
    self.albumImageView.layer.cornerRadius = 6;
    self.albumImageView.layer.masksToBounds = YES;
    
    [self.followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.followButton.layer.cornerRadius = 3;
    self.followButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.followButton.layer.borderWidth = 0.5;
    
    [self.collectImageView sd_setImageWithURL:[NSURL URLWithString:@"https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_star.png"]];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:@"https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_header.png"]];
    [self.lookImageView sd_setImageWithURL:[NSURL URLWithString:@"https://s.momocdn.com/w/u/others/2019/10/18/1571393656549-mls_scan.png"]];
    
    NSMutableArray *authorArray = [NSMutableArray array];
    NSInteger itemCount = dataList.count;
    for (NSInteger i = 0; i < itemCount; i++) {
        if (i >= 5) {
            break;
        }
        NSDictionary *dict = dataList[i];
        NSString *authorString = [dict valueForKey:@"author"];
        if (authorString) {
            [authorArray addObject:authorString];
        }
    }
    [self.tagView reloadWithDataList:authorArray];
    
    self.tabSegementView.backgroundColor = [UIColor whiteColor];
    [self.tabSegementView refreshSegmentTitles:@[@"热门", @"最新"]];
    [self setCornerRadius:10 toView:self.tabSegementView];
    [self.tabSegementView setTapActionBlock:^(MLNNativeTabSegmentView * _Nonnull tapView, NSInteger index) {
        if (self.selectBlock) {
            self.selectBlock();
        }
    }];
    self.seperatorView.frame = CGRectMake(0, 219, kScreenWidth, 0.5);
}

#pragma mark - Util

- (void)setCornerRadius:(CGFloat)cornerRadius toView:(UIView *)view
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.lineWidth = 4;
    maskLayer.lineCap = kCALineCapSquare;
    maskLayer.path = bezierPath.CGPath;
    view.layer.mask = maskLayer;
}

@end
