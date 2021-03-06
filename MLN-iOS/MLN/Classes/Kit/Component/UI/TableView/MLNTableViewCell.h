//
//  MMTableViewCell.h
//  MomoChat
//
//  Created by MoMo on 28/02/2018.
//  Copyright © 2018 wemomo.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLNReuseContentView.h"

#define kMLNTableViewCellReuseID @"kMLNTableViewCellReuseID"

@interface MLNTableViewCell : UITableViewCell <MLNReuseCellProtocol>

@property (nonatomic, strong) MLNReuseContentView *luaContentView;

- (void)updateSubviewsFrameIfNeed;

@end
