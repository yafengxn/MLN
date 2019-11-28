//
//  MLNDiscoverAlbumDetailCell.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/8.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNDiscoverAlbumDetailCell.h"
#import <UIImageView+WebCache.h>

#define kTextColor [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0]

@interface MLNDiscoverAlbumDetailCell()

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likeImageView;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@end

@implementation MLNDiscoverAlbumDetailCell

- (void)reloadWithData:(NSDictionary *)data
{
    if (data.allKeys.count <= 0) {
        return;
    }
    NSString *albumImageString = [NSString stringWithFormat:@"%@", [data valueForKey:@"pic_big"]];
    self.albumImageView.layer.cornerRadius = 6;
    self.albumImageView.layer.masksToBounds = YES;
    [self.albumImageView sd_setImageWithURL:[NSURL URLWithString:albumImageString]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@%@%@", [data valueForKey:@"title"], [data valueForKey:@"si_proxycompany"], [data valueForKey:@"album_title"]];
    NSString *avatarImageString = [NSString stringWithFormat:@"%@", [data valueForKey:@"pic_small"]];
    self.avatarImageView.layer.cornerRadius = 10;
    self.avatarImageView.layer.masksToBounds = YES;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatarImageString]];
    self.nameLabel.text = [NSString stringWithFormat:@"%@", [data valueForKey:@"artist_name"]];
    [self.likeImageView sd_setImageWithURL:[NSURL URLWithString:@"https://s.momocdn.com/w/u/others/2019/10/22/1571734558042-mls_love.png"]];
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", [data valueForKey:@"file_duration"]];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
