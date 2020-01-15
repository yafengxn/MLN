//
//  MLNPerspectiveAttribute.h
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import <Foundation/Foundation.h>
#import "MLNPerspectiveIndentifiers.h"
#import "MLNPerspectiveAttriType.h"

NS_ASSUME_NONNULL_BEGIN

@class MLNPerspectiveDisplayItem;

@interface MLNPerspectiveAttribute : NSObject <NSCopying>

@property (nonatomic, assign) MLNPerspectiveAttrIdentifier identifier;

@property (nonatomic, strong) id value;

@property (nonatomic, assign) MLNPerspectiveAttriType attrType;

@property (nonatomic, weak) MLNPerspectiveDisplayItem *targetDisplayItem;

@end

NS_ASSUME_NONNULL_END
