//
//  MLNPerspectiveHieracrchyDisplayItemMaker.h
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MLNPerspectiveDisplayItem;

@interface MLNPerspectiveHieracrchyDisplayItemMaker : NSObject

+ (NSArray<MLNPerspectiveDisplayItem *> *)itemWithScreenshots:(BOOL)hasScreenshots attrList:(BOOL)hasAttrList lowImageQuaility:(BOOL)lowQuality includedwindows:(NSArray<UIWindow *> *)includedWindows excludedWindows:(NSArray<UIWindow *> *)exceluedWindows;

@end

NS_ASSUME_NONNULL_END
