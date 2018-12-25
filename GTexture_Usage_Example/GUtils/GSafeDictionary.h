//
//  GSafeDictionary.h
//  GKit
//
//  Created by GIKI on 17/3/7.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSafeDictionary : NSDictionary

+ (instancetype)dictionary;

- (NSUInteger)count;

- (NSArray*)allKeys;

- (__kindof id)objectForKey:(NSString*)key;

- (void)setObject:(id)value forKey:(NSString *)key;

- (void)removeObjectForKey:(id)key;

- (void)removeAllObjects;

@end
