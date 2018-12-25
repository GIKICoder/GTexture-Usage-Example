//
//  GCommonUtils.h
//  GKit
//
//  Created by GIKI on 2017/4/7.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GCommonUtils : NSObject
/// context是否合法
+ (void)inspectContextIfInvalidatedInDebugMode:(CGContextRef _Nonnull)context;
+ (BOOL)inspectContextIfInvalidatedInReleaseMode:(CGContextRef _Nonnull)context;
@end
