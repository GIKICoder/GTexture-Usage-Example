//
//  NSString+GUtils.h
//  GKit
//
//  Created by GIKI on 2017/4/17.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (GUtils)

- (CGSize)sizeWithfont:(UIFont*)font;


/**
 是否包含字符串
 
 @param string 子字符串
 @return YES/NO
 */
- (BOOL)isIncludesString:(NSString *)string;

/**
 是否为空或者全部为空格

 @return yes/no
 */
- (BOOL)isEmpty;

- (NSAttributedString *)attributedWithFontSize:(CGFloat)size
                                         color:(nullable UIColor *)color;

#pragma mark - Hash
///=============================================================================
/// @name Hash
///=============================================================================

/**
 Returns a lowercase NSString for md2 hash.
 */
- (NSString *)md2String;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (NSString *)md4String;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (NSString *)sha1String;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (NSString *)sha224String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (NSString *)sha256String;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (NSString *)sha384String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (NSString *)sha512String;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (NSString *)crc32String;


#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 Returns an NSString for base64 encoded.
 */
- (NSString *)base64EncodedString;

/**
 Returns an NSString from base64 encoded string.
 @param base64EncodedString The encoded string.
 */
+ (NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)stringByURLEncode;

/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)stringByURLDecode;

/**
 Escape commmon HTML to Entity.
 Example: "a<b" will be escape to "a&lt;b".
 */
- (NSString *)stringByEscapingHTML;


@end
