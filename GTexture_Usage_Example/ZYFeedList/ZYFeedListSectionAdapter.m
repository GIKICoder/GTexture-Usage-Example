//
//  ZYFeedListSectionAdapter.m
//  GTexture_Usage_Example
//
//  Created by GIKI on 2018/12/24.
//  Copyright © 2018 GIKI. All rights reserved.
//

#import "ZYFeedListSectionAdapter.h"
#import "ZYResponse.h"
#import "ZYFeedHeaderCell.h"
@interface ZYFeedListSectionAdapter ()
@property (nonatomic, strong) NSArray * datas;
@end

@implementation ZYFeedListSectionAdapter

#pragma mark - override

- (void)didUpdateToObject:(ZYResponse*)object
{
    self.datas = object.data.list;
}

- (NSInteger)numberOfItems
{
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    return [ASIGListSectionControllerMethods cellForItemAtIndex:index sectionController:self];
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    return [ASIGListSectionControllerMethods sizeForItemAtIndex:index];
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
    // nop
}

#pragma mark - ASSectionController

- (ASCellNodeBlock)nodeBlockForItemAtIndex:(NSInteger)index
{
    id object = self.datas[index];
    ASCellNode * (^cellNodeBlock)(void) = nil;
    cellNodeBlock = ^{
        ZYFeedHeaderCell * header = [[ZYFeedHeaderCell alloc] initWithZYObject:object];
        return header;
    };
    return cellNodeBlock;
}

- (void)beginBatchFetchWithContext:(ASBatchContext *)context
{
    dispatch_async(dispatch_get_main_queue(), ^{
     
    });
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size
                                             color:(nullable UIColor *)color firstWordColor:(nullable UIColor *)firstWordColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    if (string) {
        NSDictionary *attributes                    = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                                        NSFontAttributeName: [UIFont systemFontOfSize:size]};
        attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
        
        if (firstWordColor) {
            NSRange firstSpaceRange = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
            NSRange firstWordRange  = NSMakeRange(0, firstSpaceRange.location);
            [attributedString addAttribute:NSForegroundColorAttributeName value:firstWordColor range:firstWordRange];
        }
    }
    
    return attributedString;
}

@end
