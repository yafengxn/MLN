//
//  MLNDiscoverAlbumDetailViewController.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/8.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNDiscoverAlbumDetailViewController.h"
#import "MLNNativeWaterfallView.h"
#import "MLNNativeWaterfallLayout.h"
#import "MLNGalleryNative.h"
#import "MLNNativeWaterfallLayoutDelegate.h"
#import "MLNGalleryNavigationBar.h"
#import "MLNDiscoverAblbumDeatilHeaderView.h"
#import "MLNMyHttpHandler.h"
#import <UIView+Toast.h>
#import "MLNDiscoverAlbumDetailCell.h"
#import <MJRefresh.h>
#import "MLNLoadTimeStatistics.h"
#import <MLNBenchmark.h>

@interface MLNDiscoverAlbumDetailViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, MLNNativeWaterfallLayoutDelegate>
@property (nonatomic, strong) MLNGalleryNavigationBar *navigationBar;
@property (nonatomic, strong) MLNNativeWaterfallView *waterfallView;
@property (nonatomic, strong) MLNMyHttpHandler *myHttpHandler;
@property (nonatomic, assign) NSInteger requestPageIndex;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) MLNDiscoverAblbumDeatilHeaderView *headerView;

@end

static NSString *kMLNDiscoverDetailHeaderID = @"kMLNDiscoverDetailHeaderID";
static NSString *kMLNDiscoverDetailCellID = @"kMLNDiscoverDetailCellID";

@implementation MLNDiscoverAlbumDetailViewController

- (void)viewDidLoad {
    [MLNBenchmark beginLoadTimeBenchmark:MLNBenchmarkTypeNative];
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationBar setTitle:@"灵感集"];
    [self setupHeaderView];
    [self waterfallView];
    
    CFTimeInterval time = [MLNBenchmark endLoadTimeBenchmark:MLNBenchmarkTypeNative];
    NSUInteger count = [MLNBenchmark addLoadTime:time];
    if (count == kStatisticsAverageCount) {
        [MLNBenchmark averageLoadTime:MLNBenchmarkTypeNative];
        [MLNBenchmark removeAllLoadTime];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestInspirData:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - Actions
- (void)loadMoreData
{
    [self requestInspirData:NO];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MLNDiscoverAlbumDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMLNDiscoverDetailCellID forIndexPath:indexPath];
    [cell reloadWithData:self.dataList[indexPath.row]];
    
    return cell;
}


#pragma mark - MLNNativeWaterfallLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return 265;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 0);
}

#pragma mark - Private method

- (void)setupHeaderView
{
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MLNDiscoverAblbumDeatilHeaderView" owner:self options:nil] firstObject];
    [self.view addSubview:self.headerView];
    self.headerView.frame = CGRectMake(0, 64, kScreenWidth, 220);
}

- (MLNNativeWaterfallView *)waterfallView
{
    if (!_waterfallView) {
        MLNNativeWaterfallLayout *layout = [[MLNNativeWaterfallLayout alloc] init];
        layout.layoutInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSpacing = 10;
        layout.lineSpacing = 10;
        layout.delegate = self;
        _waterfallView = [[MLNNativeWaterfallView alloc] initWithFrame:CGRectMake(0, kNaviBarHeight + 220, kScreenWidth, kScreenHeight - kNaviBarHeight - 220) collectionViewLayout:layout];
        _waterfallView.backgroundColor = [UIColor whiteColor];
        _waterfallView.dataSource = self;
        _waterfallView.delegate = self;
        
        UINib *discoverDetailNib = [UINib nibWithNibName:@"MLNDiscoverAlbumDetailCell" bundle:[NSBundle mainBundle]];
        [_waterfallView registerNib:discoverDetailNib forCellWithReuseIdentifier:kMLNDiscoverDetailCellID];
        _waterfallView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        [self.view addSubview:_waterfallView];
    }
    return _waterfallView;
}


#pragma mark - request
- (void)requestInspirData:(BOOL)firstRequest
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    NSString *requestUrlString = @"https://api.apiopen.top/musicRankingsDetails";
    NSArray *pageIdx = @[@13, @9, @11, @12, @6];
    NSInteger requestPageIdx = random()%5;
    self.requestPageIndex = [pageIdx[requestPageIdx] integerValue];
    [self.myHttpHandler http:nil get:requestUrlString params:@{@"type":@(self.requestPageIndex)} completionHandler:^(BOOL success, NSDictionary * _Nonnull respose, NSDictionary * _Nonnull error) {
        if (!success) {
            [self.view makeToast:error.description
                        duration:3.0
                        position:CSToastPositionCenter];
            return;
        }
        
        if (firstRequest) {
            NSArray *dataArray = [respose valueForKey:@"result"];
            self.dataList = [NSMutableArray arrayWithArray:dataArray];
        } else if(self.dataList.count >= 200) {
            [self.waterfallView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.waterfallView.mj_footer endRefreshing];
            NSArray *dataArray = [respose valueForKey:@"result"];
            [self.dataList addObjectsFromArray:dataArray];
        }
        [self.headerView reloadWithData:self.dataList];
        [self.waterfallView reloadData];
    }];
#pragma clang diagnostic pop
}


- (MLNMyHttpHandler *)myHttpHandler
{
    if (!_myHttpHandler) {
        _myHttpHandler = [[MLNMyHttpHandler alloc] init];
    }
    return _myHttpHandler;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

- (MLNGalleryNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[MLNGalleryNavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNaviBarHeight)];
        MLNGalleryNavigationBarItem *leftItem = [[MLNGalleryNavigationBarItem alloc] init];
        leftItem.image = [UIImage imageNamed:@"icon_back"];
        [self.navigationBar setLeftItem:leftItem];
        __weak typeof(self) weakSelf = self;
        leftItem.clickActionBlock = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        
        MLNGalleryNavigationBarItem *rightItem = [[MLNGalleryNavigationBarItem alloc] init];
        rightItem.image = [UIImage imageNamed:@"1567316383469-minshare"];
        [self.navigationBar setRightItem:rightItem];
        rightItem.clickActionBlock = ^{
            NSLog(@"点击了分享按钮！！");
        };
        [self.view addSubview:_navigationBar];
    }
    return _navigationBar;
}

@end
