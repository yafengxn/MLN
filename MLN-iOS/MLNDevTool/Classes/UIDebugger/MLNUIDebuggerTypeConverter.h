//
//  MLNUIDebuggerTypeConverter.h
//  MLNDevTool
//
//  Created by Feng on 2020/2/25.
//

#import <Foundation/Foundation.h>
#import "MLNProtobuf.h"
#import "LookinAttrIdentifiers.h"

NS_ASSUME_NONNULL_BEGIN

@class LookinObject;
@class LookinAttributesGroup;
@class LookinAttributeSection;
@class LookinAttribute;

@interface MLNUIDebuggerTypeConverter : NSObject

+ (pbpoint *)pointWithCGPoint:(CGPoint)aPoint;
+ (pbsize *)sizeWithCGSize:(CGSize)aSize;
+ (pbrect *)rectWithCGRect:(CGRect)aRect;
+ (pbimage *)imageWithUIImage:(UIImage *)aImage;
+ (pbobject *)objectWithLookinObject:(LookinObject *)aObject;
+ (pblookinattributegroup *)attributeGroupWithLookinAttributesGroup:(LookinAttributesGroup *)aGroup;
+ (pblookinattributesection *)attributeGroupWithLookinAttributesSection:(LookinAttributeSection*)aGroup;
+ (pblookinattribute *)attributeWithLookinAttribute:(LookinAttribute *)aAttribute;

+ (PBLookinAttrGroupIdentifier)attrGroupIdentifier:(LookinAttrGroupIdentifier)aAttrGroupIdentifier;
+ (PBLookinAttrSectionIdentifier)attrSectionIdentifier:(LookinAttrSectionIdentifier)aAttrSectionIdentifier;
+ (PBLookinAttrIdentifier)attrIdentifier:(LookinAttrIdentifier)aAttrIdentifier;

@end

NS_ASSUME_NONNULL_END
