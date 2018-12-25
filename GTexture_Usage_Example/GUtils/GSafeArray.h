//
//  GSafeArray.h
//  GKit
//
//  Created by GIKI on 17/3/7.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSafeArray : NSObject

+ (instancetype)array;

- (NSUInteger)count;


- (id)objectAtIndex:(NSUInteger)index;


- (void)addObject:(id)object;


- (void)removeObject:(id)object;


- (void)removeAllObject;


- (void)iterateWitHandler:(BOOL(^)(id element))handler;


@end
