//
//  UIImage+GUtils.h
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GUtils)

/**
 在当前图片的上下左右增加一些空白（不支持负值），通常用于调节NSAttributedString里的图片与文字的间距

 @param extension 要拓展的大小
 @return 拓展后的图片
 */
- (UIImage *)imageWithSpacingExtensionInsets:(UIEdgeInsets)extension;

- (UIImage *)imageWithAlpha:(CGFloat)alpha;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

/**
 切圆角图片

 @param size 图片size
 @return 圆角图片
 */
- (UIImage *)makeCircularImageWithSize:(CGSize)size;
@end
