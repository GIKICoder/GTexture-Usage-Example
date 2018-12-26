//
//  ZYFeedToolBarNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedToolBarNode.h"

@interface ZYFeedToolBarNode ()
@property (nonatomic, strong) ASButtonNode * forwardNode;
@property (nonatomic, strong) ASButtonNode * commentNode;
@property (nonatomic, strong) ASButtonNode * favourNode;
@property (nonatomic, strong) ASButtonNode * downNode;
@end

@implementation ZYFeedToolBarNode
- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        
        _forwardNode = [self factoryCreateButtonNode:@"转发:0"];
        _commentNode = [self factoryCreateButtonNode:@"评论:0"];
        _favourNode = [self factoryCreateButtonNode:@"点赞:0"];
        _downNode = [self factoryCreateButtonNode:@"踩:0"];
        
    }
    return self;
}

- (ASButtonNode *)factoryCreateButtonNode:(NSString*)title
{
    ASButtonNode * node  = [[ASButtonNode alloc] init];
    node.titleNode.attributedText = [title attributedWithFontSize:16 color:[UIColor colorWithHex:@"99999"]];
    return node;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    ASStackLayoutSpec * layoutSepc = [ASStackLayoutSpec horizontalStackLayoutSpec];
    layoutSepc.alignItems =  ASStackLayoutAlignItemsCenter;
    layoutSepc.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
    layoutSepc.spacing = 0;
    layoutSepc.children = @[_forwardNode,_commentNode,_favourNode,_downNode];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 0, 10) child:layoutSepc];;
}

#pragma mark - <#breif#>

+ (CGFloat)customNodeHeight
{
    return 55;
}
@end
