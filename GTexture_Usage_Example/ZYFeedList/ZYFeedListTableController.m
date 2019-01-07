//
//  ZYFeedListTableController.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/25.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedListTableController.h"
#import "ZYResponse.h"
#import "ZYFeedHeaderCell.h"
#import "ZYFeedViewModel.h"
#import "ZYFeedContainerCell.h"
@interface ZYFeedListTableController ()<ASTableDelegate,ASTableDataSource>
@property (nonatomic, strong) ASTableNode * tableNode;
@property (nonatomic, strong) NSArray * tableDatas;
@end

@implementation ZYFeedListTableController

- (instancetype)init
{
    _tableNode = [ASTableNode new];
    self = [super initWithNode:_tableNode];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    self.tableNode.delegate = nil;
    self.tableNode.dataSource = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableNode.delegate = self;
    self.tableNode.dataSource = self;
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"Texture";
    [self loadData];
}

#pragma mark - loadData

- (void)loadData
{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zydata2" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error;
    ZYResponse *response = [ZYResponse fromJSON:string encoding:(NSUTF8StringEncoding) error:&error];
    self.tableDatas = response.data.list;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableNode reloadData];
    });
}

#pragma mark - ASTextNode DataSource
/**
 * Asks the data source for the number of sections in the table node.
 *
 * @see @c numberOfSectionsInTableView:
 */
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode
{
    return 1;
}

/**
 * Asks the data source for the number of rows in the given section of the table node.
 *
 * @see @c numberOfSectionsInTableView:
 */
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section
{
    return self.tableDatas.count;
}

/**
 * Asks the data source for a block to create a node to represent the row at the given index path.
 * The block will be run by the table node concurrently in the background before the row is inserted
 * into the table view.
 *
 * @param tableNode The sender.
 * @param indexPath The index path of the row.
 *
 * @return a block that creates the node for display at this indexpath.
 *   Must be thread-safe (can be called on the main thread or a background
 *   queue) and should not implement reuse (it will be called once per row).
 *
 * @note This method takes precedence over tableNode:nodeForRowAtIndexPath: if implemented.
 */
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath
{

    id object = self.tableDatas[indexPath.row];
    ASCellNode * (^cellNodeBlock)(void) = nil;
    cellNodeBlock = ^{
        ZYFeedViewModel * viewModel = [ZYFeedViewModel createFeedViewModel:object extra:nil];
//        ZYFeedHeaderCell * header = [[ZYFeedHeaderCell alloc] initWithZYObject:object];
//        return header;
        ZYFeedContainerCell * cell = [[ZYFeedContainerCell alloc] initWithZYObject:viewModel];
        return cell;
    };
    return cellNodeBlock;
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
}
@end
