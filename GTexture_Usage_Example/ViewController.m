//
//  ViewController.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/19.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ViewController.h"
#import "GTextureNodeController.h"
@interface ViewController ()<ASTableDelegate,ASTableDataSource>
@property (nonatomic, strong) ASTableNode * tableNode;
@property (nonatomic, strong) NSArray * tableDatas;
@end

#define PUSH(clazz) [self.navigationController pushViewController:[clazz new] animated:YES];

@implementation ViewController

- (instancetype)init
{
    self = [super initWithNode:[ASTableNode new]];
    if (self) {
        self.tableDatas = @[@"Texture Node Container"];
    }
    return self;
}

- (void)dealloc
{
    self.node.delegate = nil;
    self.node.dataSource = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.node.delegate = self;
    self.node.dataSource = self;
    self.title = @"Texture";
    self.node.view.rowHeight = 50;
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
    NSString * title = self.tableDatas[indexPath.row];
    return ^{
        ASTextCellNode *textCellNode = [ASTextCellNode new];
        textCellNode.text = title;
        return textCellNode;
    };
    return  nil;
}

#pragma mark - ASTableNodeDelegate

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
    NSString * title = self.tableDatas[indexPath.row];
    NSLog(@"Click %@",title);
    PUSH(GTextureNodeController);
}
@end
