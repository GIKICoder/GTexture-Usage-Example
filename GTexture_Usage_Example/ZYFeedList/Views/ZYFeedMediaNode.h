//
//  ZYFeedMediaNode.h
//  GTexture_Usage_Example
//
//  Created by GIKI on 2019/1/6.
//  Copyright © 2019 GIKI. All rights reserved.
//

#import "ZYFeedBaseNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYFeedMediaNode : ASCellNode

- (instancetype)initWithImageurl:(NSURL*)url imageSize:(CGSize)size isVideo:(BOOL)isVideo;
@end

NS_ASSUME_NONNULL_END
