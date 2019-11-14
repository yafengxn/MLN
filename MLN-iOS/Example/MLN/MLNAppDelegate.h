//
//  MLNAppDelegate.h
//  MLN
//
//  Created by MoMo on 08/02/2019.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

@import UIKit;
@class MLNFPSLabel;
@interface MLNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MLNFPSLabel *fpsLabel;

@end
