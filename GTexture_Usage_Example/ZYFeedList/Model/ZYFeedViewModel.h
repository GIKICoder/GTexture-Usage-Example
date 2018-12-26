//
//  ZYFeedViewModel.h
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/26.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYResponse.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZYFeedViewModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> * nodeClazzs;

@property (nonatomic, strong) ZYList * dataObject;

+ (instancetype)createFeedViewModel:(ZYList*)object extra:(NSDictionary*)extraParams;

@end

NS_ASSUME_NONNULL_END
