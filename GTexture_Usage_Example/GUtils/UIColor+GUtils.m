//
//  UIColor+GUtils.m
//  GKit
//
//  Created by GIKI on 17/3/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "UIColor+GUtils.h"

@implementation UIColor (GUtils)

#pragma mark -- public Method

+ (UIColor *)g_colorWithHex:(NSString*)hexString
{
    CGFloat red,green,blue,alpha;
    if (doProcessHexStringToRgba(hexString, &red, &green, &blue, &alpha)) {
         return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    return nil;
}

+ (UIColor *)colorWithHex: (NSString *)hexColor
{
    return [UIColor g_colorWithHex:hexColor];
}

#pragma mark -- private Method

static BOOL doProcessHexStringToRgba(NSString *hex, CGFloat *r, CGFloat *g, CGFloat *b,CGFloat *a)
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    hex = [[hex stringByTrimmingCharactersInSet:set] uppercaseString];
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    } else if ([hex hasPrefix:@"0X"]) {
        hex = [hex substringFromIndex:2];
    }
    
    NSUInteger length = hex.length;
     //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
     //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = hexStrToInt([hex substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([hex substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([hex substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = hexStrToInt([hex substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
 
    } else {
        *r = hexStrToInt([hex substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([hex substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([hex substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = hexStrToInt([hex substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;

    }
    
    return YES;
}

static inline NSUInteger hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}
@end
