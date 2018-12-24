//
//  ZYFeedListController.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/24.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedListController.h"
#import "ZYResponse.h"
#import "ZYFeedListSectionAdapter.h"
@interface ZYFeedListController ()<IGListAdapterDataSource, ASCollectionDelegate>
@property (nonatomic, strong) IGListAdapter * listAdapter;
@property (nonatomic, strong, readonly) ASCollectionNode * collectionNode;
@property (nonatomic, strong) NSArray * datas;
@property (nonatomic, strong) ZYResponse * response;
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
            __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [weakSelf loadData];
            });
        }
        return self;
    }
    return self;
}

- (ASCollectionNode *)collectionNode
{
    return self.node;
}

#pragma mark - lifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionNode.view.alwaysBounceVertical = YES;
}

#pragma mark - loadData

- (void)loadData
{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zydata" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error;
    ZYResponse *response = [ZYResponse fromJSON:string encoding:(NSUTF8StringEncoding) error:&error];
    self.response = response;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.listAdapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            
        }];
    });
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    if (self.response) {
        return @[self.response];
    } else {
        return nil;
    }

}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    return [[ZYFeedListSectionAdapter alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter
{
    return nil;
}
@end
