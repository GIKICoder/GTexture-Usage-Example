//
//  NSObject+GUtils.m
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "NSObject+GUtils.h"
#import <objc/message.h>

@implementation NSObject (GUtils)

- (BOOL)hasOverrideMethod:(SEL)selector ofSuperclass:(Class)superclass
{
    if (![[self class] isSubclassOfClass:superclass]) {
        //        NSLog(@"%s, %@ 并非 %@ 的父类", __func__, NSStringFromClass(superclass), NSStringFromClass([self class]));
        return NO;
    }
    
    if (![superclass instancesRespondToSelector:selector]) {
        //        NSLog(@"%s, 父类 %@ 自己本来就无法响应 %@ 方法", __func__, NSStringFromClass(superclass), NSStringFromSelector(selector));
        return NO;
    }
    
    Method superclassMethod = class_getInstanceMethod(superclass, selector);
    Method instanceMethod = class_getInstanceMethod([self class], selector);
    if (!instanceMethod || instanceMethod == superclassMethod) {
        return NO;
    }
    return YES;
}

@end
