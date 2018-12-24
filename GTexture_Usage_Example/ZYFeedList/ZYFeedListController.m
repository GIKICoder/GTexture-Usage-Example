//
//  ZYFeedListController.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/24.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedListController.h"

@interface ZYFeedListController ()<IGListAdapterDataSource, ASCollectionDelegate>
@property (nonatomic, strong) NSArray * array;
@property (nonatomic, strong) IGListAdapter * listAdapter;
@property (nonatomic, strong, readonly) ASCollectionNode * collectionNode;
@end

@implementation ZYFeedListController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        ASCollectionNode *node = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
        if (self = [super initWithNode:node]) {
            self.navigationItem.title = @"ListKit";

            IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
            _listAdapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self workingRangeSize:0];
            _listAdapter.dataSource = self;
            [_listAdapter setASDKCollectionNode:self.collectionNode];
        }
        return self;
    }
    return self;
}

- (ASCollectionNode *)collectionNode
{
    return self.node;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return nil;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter
{
    return nil;
}
@end
