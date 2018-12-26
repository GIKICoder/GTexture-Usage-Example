//
//  ZYFeedHeaderNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedHeaderNode.h"
#define kAvatarWidth 36
@interface ZYFeedHeaderNode ()
{
    ASDisplayNode * _contentNode;
    ASNetworkImageNode * _avatarNode;
    ASTextNode * _nameNode;
    ASImageNode * _tagNode;
    ASButtonNode * _closeNode;
}
@end

@implementation ZYFeedHeaderNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        self.listObject = object;
        /// 头像
        _avatarNode = [[ASNetworkImageNode alloc] init];
        _avatarNode.layerBacked = YES;
        
        NSString * avatarUrlStr = [object.member.avatarUrls.origin.urls firstObject];
        _avatarNode.URL = [NSURL URLWithString:avatarUrlStr];
        [_avatarNode setImageModificationBlock:^UIImage * _Nullable(UIImage * _Nonnull image) {
            CGSize avatarSize = CGSizeMake(kAvatarWidth, kAvatarWidth);
            return [image makeCircularImageWithSize:avatarSize];
        }];
        
        /// 昵称
        _nameNode = [[ASTextNode alloc] init];
        _nameNode.layerBacked = YES;
        _nameNode.attributedText =  [object.member.name attributedWithFontSize:16 color:[UIColor g_colorWithHex:@"7c748d"]];
        //        _nameNode.hidden = YES;
        /// 用户勋章
        _tagNode = [[ASImageNode alloc] init];
        _tagNode.image = [UIImage imageNamed:@"avatar_tag"];
        _tagNode.layerBacked = YES;
        /// close
        _closeNode = [[ASButtonNode alloc] init];
        [_closeNode setImage:[UIImage imageNamed:@"header_close"] forState:UIControlStateNormal];
        [_closeNode addTarget:self action:@selector(close:) forControlEvents:ASControlNodeEventTouchUpInside];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    _avatarNode.style.preferredSize = CGSizeMake(kAvatarWidth, kAvatarWidth);
    _tagNode.style.preferredSize = CGSizeMake(16, 16);
    _closeNode.style.preferredSize = CGSizeMake(16, 16);
    
    ASStackLayoutSpec * avatarStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    avatarStack.children = @[_avatarNode,_nameNode,_tagNode];
    avatarStack.alignItems = ASStackLayoutAlignItemsCenter;
    avatarStack.spacing = 10;
    ASStackLayoutSpec * headerStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:50 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsCenter children:@[avatarStack,_closeNode]];
    _contentNode.backgroundColor = [UIColor redColor];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:headerStack];
}

#pragma mark - private Method

- (void)close:(id)sender
{
    NSLog(@"close Close");
}
@end
