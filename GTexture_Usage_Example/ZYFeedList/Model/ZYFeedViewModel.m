//
//  ZYFeedViewModel.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedViewModel.h"

@interface ZYFeedViewModel()

@end

@implementation ZYFeedViewModel

+ (instancetype)createFeedViewModel:(id)object extra:(NSDictionary*)extraParams
{
    return [[ZYFeedViewModel alloc] initFeedViewModelWithObject:object extraParams:extraParams];
}

- (instancetype)initFeedViewModelWithObject:(ZYList *)object extraParams:(NSDictionary*)extraParams
{
    if (self = [super init]) {
        self.dataObject = object;
        [self processDataResponse];
    }
    return self;
}

- (void)processDataResponse
{
    NSMutableArray * arrayM = [NSMutableArray array];
    [arrayM addObject:@"ZYFeedHeaderNode"];
    if (self.dataObject.content.length > 0) {
        [arrayM addObject:@"ZYFeedTextNode"];
    }
    if (self.dataObject.topic.topic.length > 0) {
        [arrayM addObject:@"ZYFeedTagNode"];
    }
    if (self.dataObject.videos.allValues.count>0) {
        [arrayM addObject:@"ZYFeedVideoNode"];
    } else if (self.dataObject.imgs.count > 0) {
        [arrayM addObject:@"ZYFeedPhotoWallNode"];
    }
    if (self.dataObject.godReviews.count > 0) {
        [arrayM addObject:@"ZYFeedGodReviewsNode"];
    }
    [arrayM addObject:@"ZYFeedToolBarNode"];
    self.nodeClazzs = arrayM.copy;
}
@end

