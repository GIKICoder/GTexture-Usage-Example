//
//  GTextureNodeController.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/23.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "GTextureNodeController.h"

@interface GTextureNodeController ()
@property (nonatomic, strong) ASScrollNode * scrollNode;
@end

@implementation GTextureNodeController

- (instancetype)init
{
    self = [super initWithNode:[ASDisplayNode new]];
    if (self) {
        _scrollNode = [[ASScrollNode alloc] init];
        [self.node addSubnode:_scrollNode];
        _scrollNode.backgroundColor = UIColor.blueColor;
        _scrollNode.automaticallyManagesContentSize = YES;
        _scrollNode.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            ASStackLayoutSpec *stack = [ASStackLayoutSpec verticalStackLayoutSpec];

            return stack;
        };
        __weak __typeof(self) weakself = self;
        self.node.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            ASWrapperLayoutSpec * layoutSpec = [ASWrapperLayoutSpec wrapperWithLayoutElement:weakself.scrollNode];
            return layoutSpec;
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Texture Node~";
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.node.frame = self.view.bounds;
//    _scrollNode.frame = self.view.bounds;
    _scrollNode.view.backgroundColor = [UIColor blueColor];
    
}


@end
