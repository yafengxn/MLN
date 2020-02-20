// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: PBBaseCommand.proto

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

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum pbbasecommand_InstructionType

typedef GPB_ENUM(pbbasecommand_InstructionType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  pbbasecommand_InstructionType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** ping 指令，用于心跳 */
  pbbasecommand_InstructionType_Ping = 0,

  /** pong 指令， 用户心跳 */
  pbbasecommand_InstructionType_Pong = 1,

  /** 同步入口文件的指令 */
  pbbasecommand_InstructionType_EntryFile = 2,

  /** 文件更新指令 */
  pbbasecommand_InstructionType_Update = 3,

  /** 刷新指令 */
  pbbasecommand_InstructionType_Reload = 4,

  /** 同步设备信息指令 */
  pbbasecommand_InstructionType_Device = 5,

  /** 打印日志指令 */
  pbbasecommand_InstructionType_Log = 6,

  /** 打印error指令 */
  pbbasecommand_InstructionType_Error = 7,

  /** 关闭连接指令 */
  pbbasecommand_InstructionType_Close = 8,

  /** 文件移动指令 */
  pbbasecommand_InstructionType_Move = 9,

  /** 文件重命名指令 */
  pbbasecommand_InstructionType_Rename = 10,

  /** 删除文件指令 */
  pbbasecommand_InstructionType_Remove = 11,

  /** 创建文件指令 */
  pbbasecommand_InstructionType_Create = 12,
    
  /** 代码覆盖率汇总文件指令*/
  pbbasecommand_InstructionType_Coveragesummary = 13,
    
  /** 获取代码覆盖率详细报告指令 */
  pbbasecommand_InstructionType_CoverageDetail = 14,
    
  /** 代码覆盖率报告可视化指令 */
  pbbasecommand_InstructionType_CoverageVisual = 15,
    
    
  pbbasecommand_InstructionType_Basepoint = 16,
};

GPBEnumDescriptor *pbbasecommand_InstructionType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL pbbasecommand_InstructionType_IsValidValue(int32_t value);

#pragma mark - PbbaseCommandRoot

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
@interface PbbaseCommandRoot : GPBRootObject
@end

#pragma mark - pbbasecommand

typedef GPB_ENUM(pbbasecommand_FieldNumber) {
  pbbasecommand_FieldNumber_Version = 1,
  pbbasecommand_FieldNumber_OsType = 2,
  pbbasecommand_FieldNumber_SerialNumber = 3,
  pbbasecommand_FieldNumber_Ip = 4,
  pbbasecommand_FieldNumber_Port = 5,
  pbbasecommand_FieldNumber_Instruction = 6,
  pbbasecommand_FieldNumber_Timestamp = 7,
};

@interface pbbasecommand : GPBMessage

/** 指令协议版本 */
@property(nonatomic, readwrite) int32_t version;

/** 设备的系统类型 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osType;

/** 设备的SN码或UUID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *serialNumber;

@property(nonatomic, readwrite, copy, null_resettable) NSString *ip;

@property(nonatomic, readwrite) int32_t port;

@property(nonatomic, readwrite) int32_t instruction;

@property(nonatomic, readwrite) int64_t timestamp;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
