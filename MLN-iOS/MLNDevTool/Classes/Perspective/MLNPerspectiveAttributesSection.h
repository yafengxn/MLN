//
//  MLNPerspectiveAttributesSection.h
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import <Foundation/Foundation.h>
#import "MLNPerspectiveIndentifiers.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MLNPerpectiveAttributesSectionStyle) {
    MLNPerpectiveAttributesSectionStyleDefault,
    MLNPerpectiveAttributesSectionStyleStyle0,
    MLNPerpectiveAttributesSectionStyleStyle1,
    MLNPerpectiveAttributesSectionStyleStyle2
};

@class MLNPerspectiveAttribute;

@interface MLNPerspectiveAttributesSection : NSObject

@property (nonatomic, copy) MLNPerspectiveAttrSectionIdentifier identifier;

@property (nonatomic, copy) NSArray<MLNPerspectiveAttribute *> *attributes;

@end

NS_ASSUME_NONNULL_END
