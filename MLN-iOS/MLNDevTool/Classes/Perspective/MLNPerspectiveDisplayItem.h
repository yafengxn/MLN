//
//  MLNPerspectiveDisplayItem.h
//  MLNDevTool
//
//  Created by Feng on 2020/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MLNPerspectiveObject;
@interface MLNPerspectiveDisplayItem : NSObject

@property (nonatomic, copy) NSArray<MLNPerspectiveDisplayItem *> *subItems;

@property (nonatomic, assign) CGRect frame;

@property (nonatomic, assign) CGRect bounds;

@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, assign) BOOL isHidden;

@property (nonatomic, strong) UIImage *screenShot;

@property (nonatomic, strong) MLNPerspectiveObject *viewObject;
@property (nonatomic, strong) MLNPerspectiveObject *layerObject;
@property (nonatomic, strong) MLNPerspectiveObject *hostViewControllerObject;


// attrGroups 列表
@property (nonatomic, copy) NSArray * attrGroupList;

// 父节点
@property (nonatomic, strong) MLNPerspectiveDisplayItem *superItem;

// 顶层的 UIWindow 为0，子 item 为1，依次
@property (nonatomic, assign) NSInteger indentLevel;

// 左边继承关系树中显示内容
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;

// 是否可展开
@property (nonatomic, assign, readonly) BOOL isExpandable;

// 是否已展开
@property (nonatomic, assign, readonly) BOOL isExpanded;

// 在顶层 item 坐标系中该 item 的 frame 值
@property (nonatomic, assign, readonly) CGRect frameToRoot;

@end

NS_ASSUME_NONNULL_END
