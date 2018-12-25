//
//  UIViewController+GUtils.m
//  GKit
//
//  Created by GIKI on 2017/4/1.
//  Copyright © 2017年 GIKI. All rights reserved.
//

#import "UIViewController+GUtils.h"
#import "NSObject+GUtils.h"

@implementation UIViewController (GUtils)

- (UIViewController *)getPreviousViewController
{
    if (self.navigationController.viewControllers && self.navigationController.viewControllers.count > 1 && self.navigationController.topViewController == self) {
        NSUInteger count = self.navigationController.viewControllers.count;
        return (UIViewController *)[self.navigationController.viewControllers objectAtIndex:count - 2];
    }
    return nil;
}

- (BOOL)hasOverrideUIKitMethod:(SEL)selector
{
    // 排序依照 Xcode Interface Builder 里的控件排序，但保证子类在父类前面
    NSMutableArray<Class> *viewControllerSuperclasses = [[NSMutableArray alloc] initWithObjects:
                                                         [UIImagePickerController class],
                                                         [UINavigationController class],
                                                         [UITableViewController class],
                                                         [UICollectionViewController class],
                                                         [UITabBarController class],
                                                         [UISplitViewController class],
                                                         [UIPageViewController class],
                                                         [UIViewController class],
                                                         nil];
    
    if (NSClassFromString(@"UIAlertController")) {
        [viewControllerSuperclasses addObject:[UIAlertController class]];
    }
    if (NSClassFromString(@"UISearchController")) {
        [viewControllerSuperclasses addObject:[UISearchController class]];
    }
    for (NSInteger i = 0, l = viewControllerSuperclasses.count; i < l; i++) {
        Class superclass = viewControllerSuperclasses[i];
        if ([self hasOverrideMethod:selector ofSuperclass:superclass]) {
            return YES;
        }
    }
    return NO;
}

@end
