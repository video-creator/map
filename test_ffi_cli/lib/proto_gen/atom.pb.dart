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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'atom.pbenum.dart';

export 'atom.pbenum.dart';

enum MALAtomField_Typevalue {
  i32, 
  i64, 
  ui32, 
  ui64, 
  db, 
  strv, 
  notSet
}

/// Atom Parsing
class MALAtomField extends $pb.GeneratedMessage {
  factory MALAtomField({
    $core.String? name,
    $fixnum.Int64? pos,
    $core.int? bits,
    $core.String? extraVal,
    $core.int? big,
    $core.String? value,
    $core.int? i32,
    $fixnum.Int64? i64,
    $core.int? ui32,
    $fixnum.Int64? ui64,
    $core.double? db,
    $core.String? strv,
    MDPFieldDisplayType? type,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (pos != null) {
      $result.pos = pos;
    }
    if (bits != null) {
      $result.bits = bits;
    }
    if (extraVal != null) {
      $result.extraVal = extraVal;
    }
    if (big != null) {
      $result.big = big;
    }
    if (value != null) {
      $result.value = value;
    }
    if (i32 != null) {
      $result.i32 = i32;
    }
    if (i64 != null) {
      $result.i64 = i64;
    }
    if (ui32 != null) {
      $result.ui32 = ui32;
    }
    if (ui64 != null) {
      $result.ui64 = ui64;
    }
    if (db != null) {
      $result.db = db;
    }
    if (strv != null) {
      $result.strv = strv;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  MALAtomField._() : super();
  factory MALAtomField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAtomField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MALAtomField_Typevalue> _MALAtomField_TypevalueByTag = {
    8 : MALAtomField_Typevalue.i32,
    9 : MALAtomField_Typevalue.i64,
    10 : MALAtomField_Typevalue.ui32,
    11 : MALAtomField_Typevalue.ui64,
    12 : MALAtomField_Typevalue.db,
    13 : MALAtomField_Typevalue.strv,
    0 : MALAtomField_Typevalue.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAtomField', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..oo(0, [8, 9, 10, 11, 12, 13])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aInt64(2, _omitFieldNames ? '' : 'pos')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'bits', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'extraVal')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'big', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'value')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'i32', $pb.PbFieldType.O3)
    ..aInt64(9, _omitFieldNames ? '' : 'i64')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'ui32', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'ui64', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(12, _omitFieldNames ? '' : 'db', $pb.PbFieldType.OD)
    ..aOS(13, _omitFieldNames ? '' : 'strv')
    ..e<MDPFieldDisplayType>(14, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MDPFieldDisplayType.int64, valueOf: MDPFieldDisplayType.valueOf, enumValues: MDPFieldDisplayType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAtomField clone() => MALAtomField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAtomField copyWith(void Function(MALAtomField) updates) => super.copyWith((message) => updates(message as MALAtomField)) as MALAtomField;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAtomField create() => MALAtomField._();
  MALAtomField createEmptyInstance() => create();
  static $pb.PbList<MALAtomField> createRepeated() => $pb.PbList<MALAtomField>();
  @$core.pragma('dart2js:noInline')
  static MALAtomField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAtomField>(create);
  static MALAtomField? _defaultInstance;

  MALAtomField_Typevalue whichTypevalue() => _MALAtomField_TypevalueByTag[$_whichOneof(0)]!;
  void clearTypevalue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pos => $_getI64(1);
  @$pb.TagNumber(2)
  set pos($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPos() => $_has(1);
  @$pb.TagNumber(2)
  void clearPos() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bits => $_getIZ(2);
  @$pb.TagNumber(3)
  set bits($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBits() => $_has(2);
  @$pb.TagNumber(3)
  void clearBits() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get extraVal => $_getSZ(3);
  @$pb.TagNumber(4)
  set extraVal($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtraVal() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtraVal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get big => $_getIZ(4);
  @$pb.TagNumber(5)
  set big($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBig() => $_has(4);
  @$pb.TagNumber(5)
  void clearBig() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get value => $_getSZ(5);
  @$pb.TagNumber(7)
  set value($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasValue() => $_has(5);
  @$pb.TagNumber(7)
  void clearValue() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get i32 => $_getIZ(6);
  @$pb.TagNumber(8)
  set i32($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasI32() => $_has(6);
  @$pb.TagNumber(8)
  void clearI32() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get i64 => $_getI64(7);
  @$pb.TagNumber(9)
  set i64($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasI64() => $_has(7);
  @$pb.TagNumber(9)
  void clearI64() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get ui32 => $_getIZ(8);
  @$pb.TagNumber(10)
  set ui32($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasUi32() => $_has(8);
  @$pb.TagNumber(10)
  void clearUi32() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get ui64 => $_getI64(9);
  @$pb.TagNumber(11)
  set ui64($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasUi64() => $_has(9);
  @$pb.TagNumber(11)
  void clearUi64() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get db => $_getN(10);
  @$pb.TagNumber(12)
  set db($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasDb() => $_has(10);
  @$pb.TagNumber(12)
  void clearDb() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get strv => $_getSZ(11);
  @$pb.TagNumber(13)
  set strv($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasStrv() => $_has(11);
  @$pb.TagNumber(13)
  void clearStrv() => clearField(13);

  @$pb.TagNumber(14)
  MDPFieldDisplayType get type => $_getN(12);
  @$pb.TagNumber(14)
  set type(MDPFieldDisplayType v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasType() => $_has(12);
  @$pb.TagNumber(14)
  void clearType() => clearField(14);
}

class MALAtom extends $pb.GeneratedMessage {
  factory MALAtom({
    $core.String? name,
    $fixnum.Int64? pos,
    $fixnum.Int64? size,
    $core.Iterable<MALAtomField>? fields,
    $core.Iterable<MALAtom>? childBoxes,
    $core.int? headerSize,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (pos != null) {
      $result.pos = pos;
    }
    if (size != null) {
      $result.size = size;
    }
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    if (childBoxes != null) {
      $result.childBoxes.addAll(childBoxes);
    }
    if (headerSize != null) {
      $result.headerSize = headerSize;
    }
    return $result;
  }
  MALAtom._() : super();
  factory MALAtom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAtom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAtom', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aInt64(2, _omitFieldNames ? '' : 'pos')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..pc<MALAtomField>(4, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: MALAtomField.create)
    ..pc<MALAtom>(5, _omitFieldNames ? '' : 'childBoxes', $pb.PbFieldType.PM, subBuilder: MALAtom.create)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'headerSize', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAtom clone() => MALAtom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAtom copyWith(void Function(MALAtom) updates) => super.copyWith((message) => updates(message as MALAtom)) as MALAtom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAtom create() => MALAtom._();
  MALAtom createEmptyInstance() => create();
  static $pb.PbList<MALAtom> createRepeated() => $pb.PbList<MALAtom>();
  @$core.pragma('dart2js:noInline')
  static MALAtom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAtom>(create);
  static MALAtom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pos => $_getI64(1);
  @$pb.TagNumber(2)
  set pos($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPos() => $_has(1);
  @$pb.TagNumber(2)
  void clearPos() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MALAtomField> get fields => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<MALAtom> get childBoxes => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get headerSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set headerSize($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeaderSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeaderSize() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
