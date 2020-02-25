//
//  MLNHierarchyDisplayItemTransformer.m
//  MLNDevTool
//
//  Created by Feng on 2020/2/25.
//

#import "MLNHierarchyDisplayItemTransformer.h"
#import "LKS_HierarchyDisplayItemsMaker.h"
#import "MLNProtobuf.h"
#import "LookinDisplayItem.h"
#import "MLNUIDebuggerTypeConverter.h"

@implementation MLNHierarchyDisplayItemTransformer

+ (NSMutableArray *)currentScreenDisplayItems
{
    NSArray *hierachyDisplayItems = [LKS_HierarchyDisplayItemsMaker itemsWithScreenshots:YES attrList:YES lowImageQuality:YES includedWindows:nil excludedWindows:nil];
    return [self transformWithHierachyDisplayItems:hierachyDisplayItems];
}


+ (NSMutableArray *)transformWithHierachyDisplayItems:(NSArray *)dispalyItems
{
    NSMutableArray *transformedDisplayItems = [NSMutableArray new];
    
    for (LookinDisplayItem *eachItem in dispalyItems) {
        pbdisplayitem *item = [self transformWithItem:eachItem];
        [transformedDisplayItems addObject:item];
    }
    
    return transformedDisplayItems;
}


+ (pbdisplayitem *)transformWithItem:(LookinDisplayItem *)lookinItem
{
    pbdisplayitem *displayItem = [pbdisplayitem new];
    displayItem.subitemsArray = [self transformSubItems:lookinItem.subitems];
    displayItem.alpha = lookinItem.alpha;
    displayItem.isHidden = lookinItem.isHidden;
    displayItem.frame = [MLNUIDebuggerTypeConverter rectWithCGRect:lookinItem.frame];
    displayItem.bounds = [MLNUIDebuggerTypeConverter rectWithCGRect:lookinItem.bounds];
    
    // 其他类型转换
    // ...
    
    return displayItem;
}


+ (NSMutableArray *)transformSubItems:(NSArray *)subItems
{
    NSMutableArray *targetSubItems = [NSMutableArray arrayWithCapacity:subItems.count];
    for (LookinDisplayItem *eachItem in subItems) {
        pbdisplayitem *displayItem = [self transformWithItem:eachItem];
        [targetSubItems addObject:displayItem];
    }
    return targetSubItems;
}

@end
