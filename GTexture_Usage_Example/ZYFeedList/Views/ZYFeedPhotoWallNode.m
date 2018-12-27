//
//  ZYFeedPhotoWallNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedPhotoWallNode.h"

@interface ASNetworkImageNode (ZYCategory)
@property (nonatomic, strong) ZYImg * zyImg;
@property (nonatomic, assign) NSInteger  index;
@end

@implementation ASNetworkImageNode (ZYCategory)

static char kAssociatedObjectKey_index;

- (void)setIndex:(NSInteger)index {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_index, @(index), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)index {
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_index)) integerValue];
}

static char kAssociatedObjectKey_zyImg;
- (void)setZyImg:(ZYImg *)zyImg {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_zyImg, zyImg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZYImg *)zyImg {
    return (ZYImg *)objc_getAssociatedObject(self, &kAssociatedObjectKey_zyImg);
}

@end

@interface ZYFeedPhotoWallNode ()
@property (nonatomic, strong) NSArray * photoNodes;
@end

@implementation ZYFeedPhotoWallNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.listObject = object;
        self.automaticallyManagesSubnodes = YES;
        __block NSMutableArray * nodesM = [NSMutableArray array];
        [object.imgs enumerateObjectsUsingBlock:^(ZYImg * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ASNetworkImageNode * imageNode = [[ASNetworkImageNode alloc] init];
            imageNode.zyImg = obj;
            imageNode.index = idx;
//            imageNode.placeholderColor = GRandomColor;
            imageNode.layerBacked = YES;
            NSArray * urls = obj.urls.allValues;
            ZYURLValue * urlValue = urls.firstObject;
            imageNode.URL = [NSURL URLWithString:urlValue.urls.firstObject];
            [nodesM addObject:imageNode];
        }];
        self.photoNodes = nodesM.copy;
    }
    return self;
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  
    switch (self.photoNodes.count) {
        case 1:
            return [self processOnePicLayout];
            break;
        case 3:
            return [self processThreePicLayout];
            break;
        default:
            break;
    }
    CGFloat swidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemwidth = (swidth-20-10)/3;
    [self.photoNodes enumerateObjectsUsingBlock:^(ASNetworkImageNode * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.style.preferredSize = CGSizeMake(itemwidth, itemwidth);
    }];
    ASStackLayoutSpec * layoutSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    layoutSpec.children = self.photoNodes;
    layoutSpec.spacing = 2.5;
    layoutSpec.flexWrap = ASStackLayoutFlexWrapWrap;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:layoutSpec];
}

- (ASLayoutSpec *)processThreePicLayout
{
    CGFloat swidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemwidth = (swidth-20-10)/3;
    [self.photoNodes enumerateObjectsUsingBlock:^(ASNetworkImageNode * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.style.preferredSize = CGSizeMake(itemwidth, itemwidth);
    }];
    ASStackLayoutSpec * layoutSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    layoutSpec.children = self.photoNodes;
    layoutSpec.spacing = 2.5;
    layoutSpec.flexWrap = ASStackLayoutFlexWrapWrap;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:layoutSpec];
}

- (ASLayoutSpec *)processOnePicLayout
{
    ASNetworkImageNode * node = self.photoNodes.firstObject;

    node.style.preferredSize = CGSizeMake(100, 156);
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:node];
}
@end
