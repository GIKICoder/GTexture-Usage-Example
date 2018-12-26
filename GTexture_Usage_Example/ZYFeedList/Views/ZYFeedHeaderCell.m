//
//  ZYFeedHeaderCell.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/25.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedHeaderCell.h"

#define kAvatarWidth 36
#define HEADER_HEIGHT           50
#define USER_IMAGE_HEIGHT       30
#define HORIZONTAL_BUFFER       10
#define VERTICAL_BUFFER         5
#define FONT_SIZE               14
#define InsetForAvatar UIEdgeInsetsMake(HORIZONTAL_BUFFER, 0, HORIZONTAL_BUFFER, HORIZONTAL_BUFFER)
#define InsetForHeader UIEdgeInsetsMake(0, HORIZONTAL_BUFFER, 0, HORIZONTAL_BUFFER)
#define InsetForFooter UIEdgeInsetsMake(VERTICAL_BUFFER, HORIZONTAL_BUFFER, VERTICAL_BUFFER, HORIZONTAL_BUFFER)

@interface ZYFeedHeaderCell ()
{
    ZYList * _listObject;
    ASDisplayNode * _contentNode;
    ASNetworkImageNode * _avatarNode;
    ASTextNode * _nameNode;
    ASImageNode * _tagNode;
    ASButtonNode * _closeNode;
}
@end

@implementation ZYFeedHeaderCell

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if(self) {
        self.automaticallyManagesSubnodes = YES;
        _listObject = object;
        _contentNode = [ASDisplayNode new];
        
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

- (void)didLoad
{
    [super didLoad];
//    _avatarNode.view.backgroundColor = [UIColor redColor];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
//    self.style.preferredSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
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
