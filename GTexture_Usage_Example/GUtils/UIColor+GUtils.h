//
//  UIColor+GUtils.h
//  GKit
//
//  Created by GIKI on 17/3/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor g_colorWithHex:((__bridge NSString *)CFSTR(#_hex_))]
#endif

#define GColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define GColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define GRandomColor GColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@interface UIColor (GUtils)

/**
 @param hexString Example: @"0xFFF", @"66ccff", @"#66CCFF88"
 
 */
+ (UIColor *)g_colorWithHex:(NSString*)hexString;

+ (UIColor *)colorWithHex: (NSString *)hexColor;
@end
