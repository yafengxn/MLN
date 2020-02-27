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
//    displayItem.soloScreenshot = [MLNUIDebuggerTypeConverter imageWithUIImage:lookinItem.soloScreenshot];
//    displayItem.groupScreenshot = [MLNUIDebuggerTypeConverter imageWithUIImage:lookinItem.groupScreenshot];
    displayItem.viewObject = [MLNUIDebuggerTypeConverter objectWithLookinObject:lookinItem.viewObject];
    displayItem.layerObject = [MLNUIDebuggerTypeConverter objectWithLookinObject:lookinItem.layerObject];
    displayItem.hostViewControllerObject = [MLNUIDebuggerTypeConverter objectWithLookinObject:lookinItem.hostViewControllerObject];
//    displayItem.attributeGroupListArray = [self attributeGroupListArray:lookinItem.attributesGroupList];
    displayItem.title = lookinItem.title;
    displayItem.subtitle = lookinItem.subtitle;
    
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

+ (NSMutableArray *)attributeGroupListArray:(NSArray *)aAttributeGroupListArray
{
    NSMutableArray *attributeGroupArray = [NSMutableArray arrayWithCapacity:aAttributeGroupListArray.count];
    
    for (LookinAttributesGroup *eachAttributeGroup in aAttributeGroupListArray) {
        
    }
    
    return attributeGroupArray;
}


@end
