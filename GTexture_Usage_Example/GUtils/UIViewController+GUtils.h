//
//  UIViewController+GUtils.h
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (GUtils)

- (UIViewController *)getPreviousViewController;

- (BOOL)hasOverrideUIKitMethod:(SEL)selector;

@end
