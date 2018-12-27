//
//  ZYFeedContainerCell.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedContainerCell.h"
#import "ZYFeedBaseNode.h"
@interface ZYFeedContainerCell ()
@property (nonatomic, strong) ZYFeedViewModel * viewModel;
@property (nonatomic, strong) NSArray * nodes;
@end

@implementation ZYFeedContainerCell

- (instancetype)initWithZYObject:(id)object
{
    self = [super init];
    if(self) {
        self.automaticallyManagesSubnodes = YES;
        self.viewModel = object;
        if (self.viewModel.nodeClazzs.count > 0) {
            __block NSMutableArray * nodesM = [NSMutableArray array];
            [self.viewModel.nodeClazzs enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                Class clazz = NSClassFromString(obj);
                id node = [[clazz alloc] initWithZYObject:self.viewModel.dataObject];
                if ([node isKindOfClass:[ZYFeedBaseNode class]]) {
                    [nodesM addObject:node];
                }
            }];
            self.nodes = nodesM.copy;
        }
        self.placeholderEnabled = YES;
        self.placeholderFadeDuration = 0.25;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    [self.nodes enumerateObjectsUsingBlock:^(ZYFeedBaseNode* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[obj class] customNodeHeight]>0) {
            obj.style.preferredSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [[obj class] customNodeHeight]);
        }
    }];
    ASStackLayoutSpec * spec = [ASStackLayoutSpec verticalStackLayoutSpec];
    spec.spacing = 0;
    spec.children = self.nodes;
    return spec;
}


@end
