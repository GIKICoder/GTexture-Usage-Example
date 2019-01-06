//
//  ZYFeedMediaNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2019/1/6.
//  Copyright © 2019 GIKI. All rights reserved.
//

#import "ZYFeedMediaNode.h"
#import "ZYFeedPlayButtonNode.h"
@interface ZYFeedMediaNode ()
@property (nonatomic, strong) ASNetworkImageNode* imageNode;
@property (nonatomic, strong) ZYFeedPlayButtonNode* playButtonNode;
@property (nonatomic, assign) BOOL  isVideo;
@end

@implementation ZYFeedMediaNode

- (instancetype)initWithImageurl:(NSURL*)url imageSize:(CGSize)size isVideo:(BOOL)isVideo
{
    if (self  = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _isVideo = isVideo;
        ASNetworkImageNode* imageNode  = [[ASNetworkImageNode alloc] init];
        _imageNode = imageNode;
        imageNode.layerBacked = YES;
        imageNode.contentMode = UIViewContentModeScaleAspectFill;
        imageNode.style.preferredSize = size;
        imageNode.URL = url;
        
        if (isVideo) {
            _playButtonNode = [[ZYFeedPlayButtonNode alloc] init];
            _playButtonNode.style.preferredSize = [ZYFeedPlayButtonNode suggestedSizeWhenRenderedOverImageWithSizeInPoints:size];
        }
    }
    return self;
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASInsetLayoutSpec* imageInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:_imageNode];
    if (_isVideo) {
        return [ASOverlayLayoutSpec overlayLayoutSpecWithChild:imageInset overlay:[ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY child:_playButtonNode]];
    }
    return imageInset;
}

@end
