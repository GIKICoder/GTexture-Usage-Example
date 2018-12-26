//
//  ZYFeedContainerCell.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedContainerCell.h"

@implementation ZYFeedContainerCell

- (instancetype)initWithZYObject:(id)object
{
    self = [super init];
    if(self) {
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}
@end
