//
//  MLNPerspectiveAttribute.m
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import "MLNPerspectiveAttribute.h"
#import "MLNPerspectiveDisplayItem.h"

@implementation MLNPerspectiveAttribute

#pragma mark - <NSCopying>
- (id)copyWithZone:(NSZone *)zone
{
    MLNPerspectiveAttribute *attribute = [MLNPerspectiveAttribute new];
    attribute.identifier = self.identifier;
    attribute.value = self.value;
    attribute.attrType = self.attrType;
    return attribute;
}



@end
