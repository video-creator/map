//
//  Generated code. Do not modify.
//  source: atom.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MDPFieldDisplayType extends $pb.ProtobufEnum {
  static const MDPFieldDisplayType int64 = MDPFieldDisplayType._(0, _omitEnumNames ? '' : 'int64');
  static const MDPFieldDisplayType string = MDPFieldDisplayType._(1, _omitEnumNames ? '' : 'string');
  static const MDPFieldDisplayType separator = MDPFieldDisplayType._(2, _omitEnumNames ? '' : 'separator');
  static const MDPFieldDisplayType hex = MDPFieldDisplayType._(3, _omitEnumNames ? '' : 'hex');
  static const MDPFieldDisplayType double_ = MDPFieldDisplayType._(4, _omitEnumNames ? '' : 'double');
  static const MDPFieldDisplayType fixed_16X16_float = MDPFieldDisplayType._(5, _omitEnumNames ? '' : 'fixed_16X16_float');
  static const MDPFieldDisplayType int32 = MDPFieldDisplayType._(6, _omitEnumNames ? '' : 'int32');
  static const MDPFieldDisplayType uint32 = MDPFieldDisplayType._(7, _omitEnumNames ? '' : 'uint32');
  static const MDPFieldDisplayType uint64 = MDPFieldDisplayType._(8, _omitEnumNames ? '' : 'uint64');

  static const $core.List<MDPFieldDisplayType> values = <MDPFieldDisplayType> [
    int64,
    string,
    separator,
    hex,
    double_,
    fixed_16X16_float,
    int32,
    uint32,
    uint64,
  ];

  static final $core.Map<$core.int, MDPFieldDisplayType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MDPFieldDisplayType? valueOf($core.int value) => _byValue[value];

  const MDPFieldDisplayType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
