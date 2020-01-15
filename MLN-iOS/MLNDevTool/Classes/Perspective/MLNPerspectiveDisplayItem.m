//
//  MLNPerspectiveDisplayItem.m
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import "MLNPerspectiveDisplayItem.h"

@interface MLNPerspectiveDisplayItem()

@property (nonatomic, assign) CGRect frameToRoot;
@property (nonatomic, assign, readwrite) BOOL isExpandable;
@property (nonatomic, assign, readwrite) BOOL isExpanded;

@end

@implementation MLNPerspectiveDisplayItem

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

@end
