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
    ASStackLayoutSpec *headerStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    headerStack.direction = ASStackLayoutDirectionHorizontal;
    headerStack.spacing = 15;
    _avatarNode.style.preferredSize = CGSizeMake(kAvatarWidth, kAvatarWidth);
    _tagNode.style.preferredSize = CGSizeMake(26, 26);
    _closeNode.style.preferredSize = CGSizeMake(23, 23);
    headerStack.children = @[_avatarNode,_nameNode,_tagNode,_closeNode];
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    verticalStack.alignItems = ASStackLayoutAlignItemsCenter;
    verticalStack.children = @[[ASRatioLayoutSpec ratioLayoutSpecWithRatio:0.2 child:headerStack]];
    return verticalStack;
    
    /*
    NSMutableArray *headerChildren = [NSMutableArray array];
    NSMutableArray *verticalChildren = [NSMutableArray array];
    // Header stack
    ASStackLayoutSpec *headerStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    headerStack.alignItems = ASStackLayoutAlignItemsCenter;
    
    // Avatar Image, with inset - first thing in the header stack.
        _avatarNode.style.preferredSize = CGSizeMake(kAvatarWidth, kAvatarWidth);
        _tagNode.style.preferredSize = CGSizeMake(26, 26);
        _closeNode.style.preferredSize = CGSizeMake(23, 23);
    [headerChildren addObject:[ASInsetLayoutSpec insetLayoutSpecWithInsets:InsetForAvatar child:_avatarNode]];
    
    // User Name and Photo Location stack is next
    ASStackLayoutSpec *userPhotoLocationStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    userPhotoLocationStack.style.flexShrink = 1.0;
    [headerChildren addObject:userPhotoLocationStack];
    
    // Setup the inside of the User Name and Photo Location stack.
    _nameNode.style.flexShrink = 1.0;
    [userPhotoLocationStack setChildren:@[_nameNode]];
    
    if (_closeNode) {
        _closeNode.style.flexShrink = 1.0;
        [userPhotoLocationStack setChildren:[userPhotoLocationStack.children arrayByAddingObject:_closeNode]];
    }
    
    // Add a spacer to allow a flexible space between the User Name / Location stack, and the Timestamp.
    ASLayoutSpec *spacer = [ASLayoutSpec new];
    spacer.style.flexGrow = 1.0;
    [headerChildren addObject:spacer];

    // Add all of the above items to the horizontal header stack
    headerStack.children = headerChildren;
    

    // Main Vertical Stack: contains header, large main photo with fixed aspect ratio, and footer.
    ASStackLayoutSpec *verticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    
    [verticalChildren addObject:[ASRatioLayoutSpec ratioLayoutSpecWithRatio :1.0  child:headerStack]];
    verticalStack.children = verticalChildren;
    
    return verticalStack;
     */
}


#pragma mark - private Method

- (void)close:(id)sender
{
    NSLog(@"close Close");
}
@end
