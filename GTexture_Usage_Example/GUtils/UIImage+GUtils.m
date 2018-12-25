//
//  UIImage+GUtils.m
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "UIImage+GUtils.h"
#import "GCGDefines.h"
#import "GCommonUtils.h"
#ifdef DEBUG
#define CGContextInspectContext(context) [GCommonUtils inspectContextIfInvalidatedInDebugMode:context]
#else
#define CGContextInspectContext(context) if(![GCommonUtils inspectContextIfInvalidatedInReleaseMode:context]){return nil;}
#endif
@implementation UIImage (GUtils)

- (UIImage *)imageWithSpacingExtensionInsets:(UIEdgeInsets)extension
{
    CGSize contextSize = CGSizeMake(self.size.width + UIEdgeInsetsGetHorizontalValue(extension), self.size.height + UIEdgeInsetsGetVerticalValue(extension));
    UIGraphicsBeginImageContextWithOptions(contextSize, self.opaque, self.scale);
    [self drawAtPoint:CGPointMake(extension.left, extension.top)];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

#pragma mark -- private

- (BOOL)opaque
{
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    BOOL opaque = alphaInfo == kCGImageAlphaNoneSkipLast
    || alphaInfo == kCGImageAlphaNoneSkipFirst
    || alphaInfo == kCGImageAlphaNone;
    return opaque;
}



- (UIImage *)imageWithAlpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextInspectContext(context);
    CGRect drawingRect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:drawingRect blendMode:kCGBlendModeNormal alpha:alpha];
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageOut;
}



- (UIImage *)imageWithTintColor:(UIColor *)tintColor
{
    UIImage *imageIn = self;
    CGRect rect = CGRectMake(0, 0, imageIn.size.width, imageIn.size.height);
    UIGraphicsBeginImageContextWithOptions(imageIn.size, self.opaque, imageIn.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextInspectContext(context);
    CGContextTranslateCTM(context, 0, imageIn.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextClipToMask(context, rect, imageIn.CGImage);
    CGContextSetFillColorWithColor(context, tintColor.CGColor);
    CGContextFillRect(context, rect);
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageOut;
}

- (UIImage *)makeCircularImageWithSize:(CGSize)size
{
    // make a CGRect with the image's size
    CGRect circleRect = (CGRect) {CGPointZero, size};
    
    // begin the image context since we're not in a drawRect:
    UIGraphicsBeginImageContextWithOptions(circleRect.size, NO, 0);
    
    // create a UIBezierPath circle
    UIBezierPath *circle = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:circleRect.size.width/2];
    
    // clip to the circle
    [circle addClip];
    
    // draw the image in the circleRect *AFTER* the context is clipped
    [self drawInRect:circleRect];
    
    // create a border (for white background pictures)
#if StrokeRoundedImages
    circle.lineWidth = 1;
    [[UIColor darkGrayColor] set];
    [circle stroke];
#endif
    
    // get an image from the image context
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end the image context since we're not in a drawRect:
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

@end
