//
//  MLNViewController.m
//  MLNCore
//
//  Created by MoMo on 07/23/2019.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNViewController.h"
#import "MLNTestMe.h"
#import "MLNStaticTest.h"
#import "MLNGlobalVarTest.h"
#import "MLNGlobalFuncTest.h"
#import "MLNKitInstance.h"
#import "MLNKitInstanceHandlersManager.h"
#import "MLNMyHttpHandler.h"
#import "MLNMyRefreshHandler.h"
#import "MLNMyImageHandler.h"
#import "MLNNavigatorHandler.h"
#import "MLNHotReloadViewController.h"
#import "MLNOfflineViewController.h"
#import <MLNDevTool/MLNFloatingMenu.h>
#import "MLNGalleryViewController.h"
#import "MLNKitViewController.h"
#import <MLNDevTool/MLNFPSLabel.h>
#import <MLNDevTool/MLNLoadTimeStatistics.h>
#import "MLNGalleryNative.h"
#import "MLNLuaPageViewController.h"
#import "MLNGalleryMainViewController.h"
#import "MLNMyErrorHandler.h"
#import "MLNAutoScrollTool.h"
#import <UIView+Toast.h>
#import "MLNAppDelegate.h"
#import "MLNYYLabel.h"

@interface MLNViewController () <MLNViewControllerProtocol, MLNKitInstanceDelegate>

@property (nonatomic, strong) MLNKitInstance *kitInstance;
@property (nonatomic, strong) id<MLNHttpHandlerProtocol> httpHandler;
@property (nonatomic, strong) id<MLNRefreshDelegate> refreshHandler;
@property (nonatomic, strong) id<MLNImageLoaderProtocol> imgLoader;
@property (nonatomic, strong) id<MLNNavigatorHandlerProtocol> navHandler;
@property (nonatomic, strong) id<MLNKitInstanceErrorHandlerProtocol> errorHandler;

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIButton *galleryButton;
@property (nonatomic, strong) UILabel *loadTimeLabel;
@property (nonatomic, strong) MLNLoadTimeStatistics *loadTimeStatistics;
@end

@implementation MLNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MLNKitInstance initializeLuaCorePool];
    
    // 初始化handlers
    self.httpHandler = [[MLNMyHttpHandler alloc] init];
    self.refreshHandler = [[MLNMyRefreshHandler alloc] init];
    self.imgLoader = [[MLNMyImageHandler alloc] init];
    self.navHandler = [[MLNNavigatorHandler alloc] init];
    self.errorHandler = [[MLNMyErrorHandler alloc] init];

    MLNKitInstanceHandlersManager *handlersManager = [MLNKitInstanceHandlersManager defaultManager];
    handlersManager.httpHandler = self.httpHandler;
    handlersManager.scrollRefreshHandler = self.refreshHandler;
    handlersManager.imageLoader = self.imgLoader;
    handlersManager.navigatorHandler = self.navHandler;
    handlersManager.errorHandler = self.errorHandler;

    [self setupSubController];
    
    if (!kMemoryTest) {
        [self setupSubviews];
    }
}

- (void)setupSubController
{
    [[MLNLoadTimeStatistics sharedInstance] recordLoadStartTime];
    
    if (kLuaPage) {
        NSString *entryFile = @"Main.lua";
        MLNLuaBundle *bundle = nil;
        if (kTestWithBinaryLuaCode) {
            bundle = [MLNLuaBundle mainBundleWithPath:@"gallery_binary"];
        } else {
            bundle = [MLNLuaBundle mainBundleWithPath:@"gallery_source"];
        }
        MLNLuaPageViewController *kcv = [[MLNLuaPageViewController alloc] initWithEntryFilePath:entryFile];
        kcv.kitInstance.delegate = kcv;
        [kcv regClasses:@[[MLNTestMe class],
                          [MLNStaticTest class],
                          [MLNGlobalVarTest class],
                          [MLNGlobalFuncTest class],
                          [MLNAutoScrollTool class],
                          [MLNYYLabel class]]];
        [kcv changeCurrentBundlePath:bundle.bundlePath];
        [self addChildViewController:kcv];
        [self.view addSubview:kcv.view];
        self.contentViewController = kcv;
    } else {
        MLNGalleryMainViewController *mainVc = [[MLNGalleryMainViewController alloc] init];
        [self addChildViewController:mainVc];
        [self.view addSubview:mainVc.view];
        self.contentViewController = mainVc;
    }
}

- (void)setupSubviews
{
    CGFloat galleryButtonW = 80;
    CGFloat galleryButtonH = 30;
    CGFloat galleryButtonX = kScreenWidth - galleryButtonW - 10;
    CGFloat galleryButtonY = 22;
    self.galleryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.galleryButton.frame = CGRectMake(galleryButtonX, galleryButtonY, galleryButtonW, galleryButtonH);
    [self.galleryButton setTitle:@"调试点我" forState:UIControlStateNormal];
    self.galleryButton.backgroundColor = [UIColor orangeColor];
    [self.galleryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.galleryButton addTarget:self action:@selector(galleryButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.galleryButton];
}

- (void)galleryButtonClicked:(id)sender
{
    if (kPrintFpsUseClickMeDebugButton) {
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
        NSLog(@"fps: %@", fpsText);
    } else {
        MLNGalleryViewController *galleryVc = [[MLNGalleryViewController alloc] init];
        [self.navigationController pushViewController:galleryVc animated:YES];
    }
}

@end
