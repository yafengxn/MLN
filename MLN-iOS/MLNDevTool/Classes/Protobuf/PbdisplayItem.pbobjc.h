// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: PBDisplayItem.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class pbcolor;
@class pbdisplayitem;
@class pbimage;
@class pblookinattributegroup;
@class pbobject;
@class pbrect;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - PbdisplayItemRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface PbdisplayItemRoot : GPBRootObject
@end

#pragma mark - pbdisplayitem

typedef GPB_ENUM(pbdisplayitem_FieldNumber) {
  pbdisplayitem_FieldNumber_SubitemsArray = 1,
  pbdisplayitem_FieldNumber_IsHidden = 2,
  pbdisplayitem_FieldNumber_Alpha = 3,
  pbdisplayitem_FieldNumber_Frame = 4,
  pbdisplayitem_FieldNumber_Bounds = 5,
  pbdisplayitem_FieldNumber_SoloScreenshot = 6,
  pbdisplayitem_FieldNumber_GroupScreenshot = 7,
  pbdisplayitem_FieldNumber_ViewObject = 8,
  pbdisplayitem_FieldNumber_LayerObject = 9,
  pbdisplayitem_FieldNumber_HostViewControllerObject = 10,
  pbdisplayitem_FieldNumber_AttributeGroupListArray = 11,
  pbdisplayitem_FieldNumber_RepresentedAsKeyWindow = 12,
  pbdisplayitem_FieldNumber_BackgroundColor = 13,
  pbdisplayitem_FieldNumber_SuperItem = 14,
  pbdisplayitem_FieldNumber_DisplayObject = 15,
  pbdisplayitem_FieldNumber_Title = 16,
  pbdisplayitem_FieldNumber_Subtitle = 17,
  pbdisplayitem_FieldNumber_IndentLevel = 18,
  pbdisplayitem_FieldNumber_RepresentedForSystemClass = 19,
  pbdisplayitem_FieldNumber_IsExpanded = 20,
  pbdisplayitem_FieldNumber_IsExpandable = 21,
  pbdisplayitem_FieldNumber_DisplayingInHierarchy = 22,
  pbdisplayitem_FieldNumber_InHiddenHierarchy = 23,
  pbdisplayitem_FieldNumber_AppropriateScreenshot = 24,
  pbdisplayitem_FieldNumber_FrameToRoot = 25,
};

@interface pbdisplayitem : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<pbdisplayitem*> *subitemsArray;
/** The number of items in @c subitemsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger subitemsArray_Count;

@property(nonatomic, readwrite) BOOL isHidden;

@property(nonatomic, readwrite) float alpha;

@property(nonatomic, readwrite, strong, null_resettable) pbrect *frame;
/** Test to see if @c frame has been set. */
@property(nonatomic, readwrite) BOOL hasFrame;

@property(nonatomic, readwrite, strong, null_resettable) pbrect *bounds;
/** Test to see if @c bounds has been set. */
@property(nonatomic, readwrite) BOOL hasBounds;

/** 不存在subitems，该属性为nil */
@property(nonatomic, readwrite, strong, null_resettable) pbimage *soloScreenshot;
/** Test to see if @c soloScreenshot has been set. */
@property(nonatomic, readwrite) BOOL hasSoloScreenshot;

/** 不管subitems是否存在，该属性始终不为nil */
@property(nonatomic, readwrite, strong, null_resettable) pbimage *groupScreenshot;
/** Test to see if @c groupScreenshot has been set. */
@property(nonatomic, readwrite) BOOL hasGroupScreenshot;

@property(nonatomic, readwrite, strong, null_resettable) pbobject *viewObject;
/** Test to see if @c viewObject has been set. */
@property(nonatomic, readwrite) BOOL hasViewObject;

@property(nonatomic, readwrite, strong, null_resettable) pbobject *layerObject;
/** Test to see if @c layerObject has been set. */
@property(nonatomic, readwrite) BOOL hasLayerObject;

@property(nonatomic, readwrite, strong, null_resettable) pbobject *hostViewControllerObject;
/** Test to see if @c hostViewControllerObject has been set. */
@property(nonatomic, readwrite) BOOL hasHostViewControllerObject;

/** attributeGroup 列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<pblookinattributegroup*> *attributeGroupListArray;
/** The number of items in @c attributeGroupListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger attributeGroupListArray_Count;

/** 如果当前 item 为uiWindow且是 keyWindow 该属性为true */
@property(nonatomic, readwrite) BOOL representedAsKeyWindow;

@property(nonatomic, readwrite, strong, null_resettable) pbcolor *backgroundColor;
/** Test to see if @c backgroundColor has been set. */
@property(nonatomic, readwrite) BOOL hasBackgroundColor;

@property(nonatomic, readwrite, strong, null_resettable) pbdisplayitem *superItem;
/** Test to see if @c superItem has been set. */
@property(nonatomic, readwrite) BOOL hasSuperItem;

@property(nonatomic, readwrite, strong, null_resettable) pbobject *displayObject;
/** Test to see if @c displayObject has been set. */
@property(nonatomic, readwrite) BOOL hasDisplayObject;

/** 该item在左边 hierachy 中显示的字符串，现在返回其shortClassName */
@property(nonatomic, readwrite, copy, null_resettable) NSString *title;

@property(nonatomic, readwrite, copy, null_resettable) NSString *subtitle;

@property(nonatomic, readwrite) int32_t indentLevel;

@property(nonatomic, readwrite) BOOL representedForSystemClass;

/** 是否展开 */
@property(nonatomic, readwrite) BOOL isExpanded;

/** 是否可展开 */
@property(nonatomic, readwrite) BOOL isExpandable;

@property(nonatomic, readwrite) BOOL displayingInHierarchy;

/** 如果自身或任意一个上层元素的 isHidden 为 YES 或 alpha 为 0，则该属性返回 YES */
@property(nonatomic, readwrite) BOOL inHiddenHierarchy;

/** 返回 soloScreenshot 或 groupScreenshot */
@property(nonatomic, readwrite, strong, null_resettable) pbimage *appropriateScreenshot;
/** Test to see if @c appropriateScreenshot has been set. */
@property(nonatomic, readwrite) BOOL hasAppropriateScreenshot;

/** 在当前 hierarchy 的最顶层的 item 的坐标系中，该 item 的 frame 值 */
@property(nonatomic, readwrite, strong, null_resettable) pbrect *frameToRoot;
/** Test to see if @c frameToRoot has been set. */
@property(nonatomic, readwrite) BOOL hasFrameToRoot;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
