//
//  MLNUIDebuggerTypeConverter.m
//  MLNDevTool
//
//  Created by Feng on 2020/2/25.
//

#import "MLNUIDebuggerTypeConverter.h"

@implementation MLNUIDebuggerTypeConverter

+ (pbpoint *)pointWithCGPoint:(CGPoint)aPoint
{
    pbpoint *point = [pbpoint new];
    point.x = aPoint.x;
    point.y = aPoint.y;
    return point;
}

+ (pbsize *)sizeWithCGSize:(CGSize)aSize;
{
    pbsize *size = [pbsize new];
    size.width = aSize.width;
    size.height = aSize.height;
    return size;
}

+ (pbrect *)rectWithCGRect:(CGRect)aRect
{
    pbpoint *orgin = [self pointWithCGPoint:aRect.origin];
    pbsize *size = [self sizeWithCGSize:aRect.size];
    pbrect *rect = [pbrect new];
    rect.origin = orgin;
    rect.size = size;
    return rect;
}

@end
