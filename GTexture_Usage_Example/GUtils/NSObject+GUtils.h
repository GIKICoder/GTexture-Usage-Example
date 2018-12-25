//
//  NSObject+GUtils.h
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GUtils)

- (BOOL)hasOverrideMethod:(SEL)selector ofSuperclass:(Class)superclass;

@end
