//
//  Generated code. Do not modify.
//  source: mal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MALPacketFlag extends $pb.ProtobufEnum {
  static const MALPacketFlag MAL_PACKET_FLAG_NONE = MALPacketFlag._(0, _omitEnumNames ? '' : 'MAL_PACKET_FLAG_NONE');
  static const MALPacketFlag MAL_PACKET_FLAG_IDR = MALPacketFlag._(1, _omitEnumNames ? '' : 'MAL_PACKET_FLAG_IDR');
  static const MALPacketFlag MAL_PACKET_FLAG_I = MALPacketFlag._(2, _omitEnumNames ? '' : 'MAL_PACKET_FLAG_I');
  static const MALPacketFlag MAL_PACKET_FLAG_P = MALPacketFlag._(3, _omitEnumNames ? '' : 'MAL_PACKET_FLAG_P');
  static const MALPacketFlag MAL_PACKET_FLAG_B = MALPacketFlag._(4, _omitEnumNames ? '' : 'MAL_PACKET_FLAG_B');

  static const $core.List<MALPacketFlag> values = <MALPacketFlag> [
    MAL_PACKET_FLAG_NONE,
    MAL_PACKET_FLAG_IDR,
    MAL_PACKET_FLAG_I,
    MAL_PACKET_FLAG_P,
    MAL_PACKET_FLAG_B,
  ];

  static final $core.Map<$core.int, MALPacketFlag> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALPacketFlag? valueOf($core.int value) => _byValue[value];

  const MALPacketFlag._($core.int v, $core.String n) : super(v, n);
}

class MALVideoPixelFormat extends $pb.ProtobufEnum {
  static const MALVideoPixelFormat NONE = MALVideoPixelFormat._(0, _omitEnumNames ? '' : 'NONE');
  static const MALVideoPixelFormat YUV420P = MALVideoPixelFormat._(1, _omitEnumNames ? '' : 'YUV420P');
  static const MALVideoPixelFormat YUV420P10LE = MALVideoPixelFormat._(2, _omitEnumNames ? '' : 'YUV420P10LE');
  static const MALVideoPixelFormat ARGB = MALVideoPixelFormat._(3, _omitEnumNames ? '' : 'ARGB');
  static const MALVideoPixelFormat RGBA = MALVideoPixelFormat._(4, _omitEnumNames ? '' : 'RGBA');
  static const MALVideoPixelFormat YUVJ420P = MALVideoPixelFormat._(5, _omitEnumNames ? '' : 'YUVJ420P');

  static const $core.List<MALVideoPixelFormat> values = <MALVideoPixelFormat> [
    NONE,
    YUV420P,
    YUV420P10LE,
    ARGB,
    RGBA,
    YUVJ420P,
  ];

  static final $core.Map<$core.int, MALVideoPixelFormat> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALVideoPixelFormat? valueOf($core.int value) => _byValue[value];

  const MALVideoPixelFormat._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
