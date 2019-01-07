//
//  ZYFeedPhotoCollectionNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2019/1/6.
//  Copyright © 2019 GIKI. All rights reserved.
//

#import "ZYFeedPhotoCollectionNode.h"
#import "ZYFeedMediaNode.h"
@interface ZYFeedPhotoCollectionNode ()<ASCollectionDataSource,ASCollectionDelegate>
{
    CGSize  _itemSize;
    CGFloat _maxWidth;
}
@property (nonatomic, strong) ASCollectionNode * collectionNode;
@end
@implementation ZYFeedPhotoCollectionNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.listObject = object;
        self.automaticallyManagesSubnodes = YES;
        self.userInteractionEnabled = YES;
        _maxWidth = [UIScreen mainScreen].bounds.size.width-20;
        
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat spacing = 2.0f;
        flowLayout.minimumInteritemSpacing = spacing;
        flowLayout.minimumLineSpacing = spacing;
        flowLayout.sectionInset = UIEdgeInsetsZero;
        CGFloat length = 0.0f;
        CGFloat height = 0.0f;
        CGFloat numRows = ceilf(object.imgs.count / 3.0f);
        if (object.imgs.count == 1) {
            ZYImg * img = object.imgs[0];
            length = 232*0.75; //(232*(img.w))/img.h;
            height = 232;
            flowLayout.itemSize = CGSizeMake(length, height);
            _maxWidth = length;
        }  else {
            length = (_maxWidth - 2*spacing-5)/3.0f ;//ceilf((_maxWidth - 2*spacing)/3.0f);
            flowLayout.itemSize = CGSizeMake(length, length);
        }
        
//        flowLayout.itemSize = CGSizeMake(length, length);
        _itemSize = flowLayout.itemSize;
        
        CGFloat totalHeight = _itemSize.height;
        if (object.imgs.count > 3) {
            totalHeight = (numRows * (length + flowLayout.minimumLineSpacing)) - flowLayout.minimumLineSpacing;
        }
        
        _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:flowLayout];
        _collectionNode.dataSource = self;
        _collectionNode.delegate = self;
        _collectionNode.style.preferredSize = CGSizeMake(_maxWidth, totalHeight);
    }
    return self;
}

- (void)didLoad {
    [super didLoad];
    _collectionNode.view.scrollEnabled = NO;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:_collectionNode];
}

#pragma mark - ASCollectionDataSource

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return self.listObject.imgs.count;
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = _itemSize;
    ZYImg * img = self.listObject.imgs[indexPath.row];
    NSArray * urls = img.urls.allValues;
    ZYURLValue * urlValue = urls.firstObject;
    NSURL* imageURL = [NSURL URLWithString:urlValue.urls.firstObject];
    return ^ASCellNode*{
        return [[ZYFeedMediaNode alloc] initWithImageurl:imageURL imageSize:itemSize isVideo:NO];
    };
}

- (void)collectionNode:(ASCollectionNode *)collectionNode didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
