//
//  ZYFeedBaseNode.h
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ZYResponse.h"
#import "UIColor+GUtils.h"
#import "UIImage+GUtils.h"
#import "NSString+GUtils.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZYFeedBaseNode : ASDisplayNode

@property (nonatomic, strong) ZYList * listObject;

- (instancetype)initWithZYObject:(id)object;

+ (CGFloat)customNodeHeight;
@end

NS_ASSUME_NONNULL_END
