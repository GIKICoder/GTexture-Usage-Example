//
//  GSafeArray.m
//  GKit
//
//  Created by GIKI on 17/3/7.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "GSafeArray.h"

@interface GSafeArray ()

@property (nonatomic, strong) NSLock* lock;

@property (nonatomic, strong) NSMutableArray* array;

@end

@implementation GSafeArray

+ (instancetype)array
{
    GSafeArray * array = [[GSafeArray alloc] init];
    return array;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.array = [NSMutableArray array];
        self.lock = [[NSLock alloc] init];
    }
    return self;
}

- (NSUInteger)count
{
    while (![self.lock tryLock]) {
        usleep(10*1000);
    }
    
    NSUInteger num = self.array.count;
    
    [self.lock unlock];
    
    return num;
}


- (id)objectAtIndex:(NSUInteger)index;
{
    while (![self.lock tryLock]) {
        usleep(10*1000);
    }
    
    if (self.array.count <= index) {
        [_lock unlock];
        return nil;
    }
    id object = [self.array objectAtIndex:index];
    
    [_lock unlock];
    
    return object;
}


- (void)addObject:(id)object
{
    if (!object) return;
    
    while (![self.lock tryLock]) {
        usleep(10*1000);
    }
    [self.array addObject:object];
    
    [self.lock unlock];
}


- (void)removeObject:(id)object
{
    if (!object) {
        return;
    }
    
    while (![_lock tryLock]) {
        usleep(10 * 1000);
    }
    
    [self.array removeObject:object];
    
    [self.lock unlock];
}


- (void)removeAllObject
{
    while (![_lock tryLock]) {
        usleep(10 * 1000);
    }
    
    [self.array removeAllObjects];
    
    [self.lock unlock];
}

- (void)iterateWitHandler:(BOOL(^)(id element))handler
{
    if (!handler) {
        return;
    }
    
    while (![_lock tryLock]) {
        usleep(10 * 1000);
    }
    
    for (id element in self.array) {
        BOOL result = handler(element);
        
        if (result) {
            break;
        }
    }
    
    handler = nil;
    
    [_lock unlock];
}

@end
