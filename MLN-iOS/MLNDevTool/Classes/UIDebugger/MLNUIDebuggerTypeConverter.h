//
//  MLNUIDebuggerTypeConverter.h
//  MLNDevTool
//
//  Created by Feng on 2020/2/25.
//

#import <Foundation/Foundation.h>
#import "MLNProtobuf.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLNUIDebuggerTypeConverter : NSObject

+ (pbpoint *)pointWithCGPoint:(CGPoint)aPoint;
+ (pbsize *)sizeWithCGSize:(CGSize)aSize;
+ (pbrect *)rectWithCGRect:(CGRect)aRect;



@end

NS_ASSUME_NONNULL_END
