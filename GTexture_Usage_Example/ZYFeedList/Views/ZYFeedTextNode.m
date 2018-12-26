//
//  ZYFeedTextNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedTextNode.h"

@interface ZYFeedTextNode ()
@property (nonatomic, strong) ASTextNode * textNode;
@end

@implementation ZYFeedTextNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        _textNode = [[ASTextNode alloc] init];
        _textNode.attributedText = [object.content attributedWithFontSize:18 color:[UIColor colorWithHex:@"333333"]];
        _textNode.maximumNumberOfLines = 5;
        _textNode.truncationAttributedText = [@"[双击展开]" attributedWithFontSize:18 color:[UIColor colorWithHex:@"999999"]];
        _textNode.layerBacked = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 10, 10) child:_textNode];
}


@end
