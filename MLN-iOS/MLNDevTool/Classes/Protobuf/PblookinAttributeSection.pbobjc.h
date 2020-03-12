// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: PBLookinAttributeSection.proto

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

@class pblookinattribute;
GPB_ENUM_FWD_DECLARE(PBLookinAttrSectionIdentifier);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - PblookinAttributeSectionRoot

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
@interface PblookinAttributeSectionRoot : GPBRootObject
@end

#pragma mark - pblookinattributesection

typedef GPB_ENUM(pblookinattributesection_FieldNumber) {
  pblookinattributesection_FieldNumber_Identifier = 1,
  pblookinattributesection_FieldNumber_Title = 2,
  pblookinattributesection_FieldNumber_AttributesArray = 3,
};

@interface pblookinattributesection : GPBMessage

@property(nonatomic, readwrite) enum PBLookinAttrSectionIdentifier identifier;

@property(nonatomic, readwrite, copy, null_resettable) NSString *title;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<pblookinattribute*> *attributesArray;
/** The number of items in @c attributesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger attributesArray_Count;

@end

/**
 * Fetches the raw value of a @c pblookinattributesection's @c identifier property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t pblookinattributesection_Identifier_RawValue(pblookinattributesection *message);
/**
 * Sets the raw value of an @c pblookinattributesection's @c identifier property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void Setpblookinattributesection_Identifier_RawValue(pblookinattributesection *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
