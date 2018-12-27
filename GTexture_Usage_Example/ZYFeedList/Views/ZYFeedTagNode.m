//
//  ZYFeedTagNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedTagNode.h"

@interface ZYFeedTagNode ()
@property (nonatomic, strong) ASButtonNode * buttonNode;
@end

@implementation ZYFeedTagNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        _buttonNode = [[ASButtonNode alloc] init];
        NSString * topic = [NSString stringWithFormat:@" #%@ ",object.topic.topic];
        NSAttributedString * attrs = [topic attributedWithFontSize:16 color:[UIColor colorWithHex:@"66bcfb"]];
        [_buttonNode setAttributedTitle:attrs forState:UIControlStateNormal];
//        _buttonNode.borderColor = [UIColor colorWithHex:@"66bcfb"].CGColor;
//        _buttonNode.borderWidth = 1/[UIScreen mainScreen].scale;
//        _buttonNode.cornerRoundingType = ASCornerRoundingTypeDefaultSlowCALayer;
//        _buttonNode.cornerRadius = 4;
    }
    return self;
}

- (void)didLoad
{
    [super didLoad];
  
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    ASStackLayoutSpec * stackLayout = [ASStackLayoutSpec horizontalStackLayoutSpec];
    stackLayout.child = _buttonNode;
    stackLayout.alignItems = ASStackLayoutAlignItemsStart;
    stackLayout.justifyContent = ASStackLayoutJustifyContentStart;
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 0, 0) child:stackLayout];
}
@end
