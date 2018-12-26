//
//  ZYFeedVideoNode.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedVideoNode.h"

@interface ZYFeedVideoNode ()
@property (nonatomic, strong) ASNetworkImageNode * videImgNode;
@property (nonatomic, strong) ASTextNode * playCountNode;
@property (nonatomic, strong) ASTextNode * barrageNode;
@property (nonatomic, strong) ASTextNode * timeNode;
@end

@implementation ZYFeedVideoNode

- (instancetype)initWithZYObject:(ZYList *)object
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        
        _videImgNode = [[ASNetworkImageNode alloc] init];
        NSArray * values = object.videos.allValues;
        ZYVideo * video = [values firstObject];
        NSURL *url = [NSURL URLWithString:video.coverUrls.firstObject];
        _videImgNode.URL = url;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    _videImgNode.style.preferredSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-20, 303);
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:_videImgNode];
}
@end
