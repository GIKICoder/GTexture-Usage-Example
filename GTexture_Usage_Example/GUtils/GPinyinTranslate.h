//
//  GPinyinTranslate.h
//  GKit
//
//  Created by GIKI on 17/3/6.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPinyinTranslate : NSObject

/**
 拼音转换

 @param hzString 汉字
 @return 汉字拼音
 */
+ (NSString *)g_convert:(NSString *)hzString;
/**
 快速拼音转换 （有缓存）
 
 @param hzString 汉字
 @return 汉字拼音
 */
+ (NSString *)g_quickConvert:(NSString *)hzString;

/**
 清除缓存
 */
+ (void)clearCache;

@end
