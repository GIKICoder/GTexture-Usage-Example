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
        self.placeholderFadeDuration = 2.5;
        
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

- (UIImage *)placeholderImage
{
    CGSize size = self.calculatedSize;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    [[UIColor whiteColor] setFill];
    [[UIColor colorWithWhite:0.9 alpha:1] setStroke];
    
    UIRectFill((CGRect){CGPointZero, size});
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:(CGPoint){size.width, size.height}];
    [path stroke];
    
    [path moveToPoint:(CGPoint){size.width, 0.0}];
    [path addLineToPoint:(CGPoint){0.0, size.height}];
    [path stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
