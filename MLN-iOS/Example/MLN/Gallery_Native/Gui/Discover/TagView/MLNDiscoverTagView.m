//
//  MLNDiscoverTagView.m
//  MLN_Example
//
//  Created by MoMo on 2019/11/8.
//  Copyright (c) 2019 MoMo. All rights reserved.
//

#import "MLNDiscoverTagView.h"
#import "MLNDiscoverTagViewCell.h"

@interface MLNDiscoverTagView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataList;
@end

static NSString *kDiscoverTagViewCellID = @"kDiscoverTagViewCellID";

@implementation MLNDiscoverTagView

- (void)reloadWithDataList:(NSArray *)dataList
{
    _dataList = dataList;
    self.collectionView.frame = self.bounds;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MLNDiscoverTagViewCell *cell = [[MLNDiscoverTagViewCell alloc] init];
    [cell setContent:self.dataList[indexPath.row]];
    return CGSizeMake(cell.cellWidth, 20);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MLNDiscoverTagViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDiscoverTagViewCellID forIndexPath:indexPath];
    [cell setContent:self.dataList[indexPath.row]];
    return cell;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 3;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[MLNDiscoverTagViewCell class] forCellWithReuseIdentifier:kDiscoverTagViewCellID];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

@end
