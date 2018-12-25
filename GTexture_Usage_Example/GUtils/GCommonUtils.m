//
//  GCommonUtils.m
//  GKit
//
//  Created by GIKI on 2017/4/7.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "GCommonUtils.h"

@implementation GCommonUtils
+ (void)inspectContextIfInvalidatedInDebugMode:(CGContextRef)context {
    if (!context) {
        // crash了就找zhoon或者molice
        NSAssert(NO, @"QMUI CGPostError, %@:%d %s, 非法的context：%@\n%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, context, [NSThread callStackSymbols]);
    }
}

+ (BOOL)inspectContextIfInvalidatedInReleaseMode:(CGContextRef)context {
    if (context) {
        return YES;
    }
    return NO;
}
@end
