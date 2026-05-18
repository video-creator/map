//
//  Generated code. Do not modify.
//  source: nal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'atom.pb.dart' as $0;
import 'nal.pbenum.dart';

export 'nal.pbenum.dart';

/// NAL Unit Base
class MALNal extends $pb.GeneratedMessage {
  factory MALNal({
    $core.int? nalUnitType,
    $core.String? nalName,
  }) {
    final $result = create();
    if (nalUnitType != null) {
      $result.nalUnitType = nalUnitType;
    }
    if (nalName != null) {
      $result.nalName = nalName;
    }
    return $result;
  }
  MALNal._() : super();
  factory MALNal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALNal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALNal', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'nalUnitType', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'nalName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALNal clone() => MALNal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALNal copyWith(void Function(MALNal) updates) => super.copyWith((message) => updates(message as MALNal)) as MALNal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALNal create() => MALNal._();
  MALNal createEmptyInstance() => create();
  static $pb.PbList<MALNal> createRepeated() => $pb.PbList<MALNal>();
  @$core.pragma('dart2js:noInline')
  static MALNal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALNal>(create);
  static MALNal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nalUnitType => $_getIZ(0);
  @$pb.TagNumber(1)
  set nalUnitType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNalUnitType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNalUnitType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nalName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nalName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNalName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNalName() => clearField(2);
}

class MALHEVCNal extends $pb.GeneratedMessage {
  factory MALHEVCNal({
    MALNal? base,
    $core.int? forbiddenZeroBit,
    $core.int? nuhLayerId,
    $core.int? nuhTemporalIdPlus1,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (forbiddenZeroBit != null) {
      $result.forbiddenZeroBit = forbiddenZeroBit;
    }
    if (nuhLayerId != null) {
      $result.nuhLayerId = nuhLayerId;
    }
    if (nuhTemporalIdPlus1 != null) {
      $result.nuhTemporalIdPlus1 = nuhTemporalIdPlus1;
    }
    return $result;
  }
  MALHEVCNal._() : super();
  factory MALHEVCNal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCNal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCNal', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'forbiddenZeroBit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'nuhLayerId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'nuhTemporalIdPlus1', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCNal clone() => MALHEVCNal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCNal copyWith(void Function(MALHEVCNal) updates) => super.copyWith((message) => updates(message as MALHEVCNal)) as MALHEVCNal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCNal create() => MALHEVCNal._();
  MALHEVCNal createEmptyInstance() => create();
  static $pb.PbList<MALHEVCNal> createRepeated() => $pb.PbList<MALHEVCNal>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCNal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCNal>(create);
  static MALHEVCNal? _defaultInstance;

  @$pb.TagNumber(1)
  MALNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get forbiddenZeroBit => $_getIZ(1);
  @$pb.TagNumber(2)
  set forbiddenZeroBit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForbiddenZeroBit() => $_has(1);
  @$pb.TagNumber(2)
  void clearForbiddenZeroBit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nuhLayerId => $_getIZ(2);
  @$pb.TagNumber(3)
  set nuhLayerId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNuhLayerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNuhLayerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get nuhTemporalIdPlus1 => $_getIZ(3);
  @$pb.TagNumber(4)
  set nuhTemporalIdPlus1($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNuhTemporalIdPlus1() => $_has(3);
  @$pb.TagNumber(4)
  void clearNuhTemporalIdPlus1() => clearField(4);
}

class MALHEVCVPS extends $pb.GeneratedMessage {
  factory MALHEVCVPS({
    MALHEVCNal? base,
    $core.int? videoParameterSetId,
    $core.Iterable<$core.int>? layerIdxInVps,
    $core.Iterable<$core.int>? pocLsbNotPresentFlag,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (videoParameterSetId != null) {
      $result.videoParameterSetId = videoParameterSetId;
    }
    if (layerIdxInVps != null) {
      $result.layerIdxInVps.addAll(layerIdxInVps);
    }
    if (pocLsbNotPresentFlag != null) {
      $result.pocLsbNotPresentFlag.addAll(pocLsbNotPresentFlag);
    }
    return $result;
  }
  MALHEVCVPS._() : super();
  factory MALHEVCVPS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCVPS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCVPS', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALHEVCNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'videoParameterSetId', $pb.PbFieldType.O3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'LayerIdxInVps', $pb.PbFieldType.K3, protoName: 'LayerIdxInVps')
    ..p<$core.int>(4, _omitFieldNames ? '' : 'pocLsbNotPresentFlag', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCVPS clone() => MALHEVCVPS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCVPS copyWith(void Function(MALHEVCVPS) updates) => super.copyWith((message) => updates(message as MALHEVCVPS)) as MALHEVCVPS;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCVPS create() => MALHEVCVPS._();
  MALHEVCVPS createEmptyInstance() => create();
  static $pb.PbList<MALHEVCVPS> createRepeated() => $pb.PbList<MALHEVCVPS>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCVPS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCVPS>(create);
  static MALHEVCVPS? _defaultInstance;

  @$pb.TagNumber(1)
  MALHEVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get videoParameterSetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set videoParameterSetId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideoParameterSetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoParameterSetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get layerIdxInVps => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get pocLsbNotPresentFlag => $_getList(3);
}

class MALHEVCSPS extends $pb.GeneratedMessage {
  factory MALHEVCSPS({
    MALHEVCNal? base,
    $core.int? spsVideoParameterSetId,
    $core.int? seqParameterSetId,
    $core.int? picWidthInLumaSamples,
    $core.int? picHeightInLumaSamples,
    $core.int? log2MaxPicOrderCntLsbMinus4,
    $core.int? log2MinLumaCodingBlockSizeMinus3,
    $core.int? log2DiffMaxMinLumaCodingBlockSize,
    $core.int? separateColourPlaneFlag,
    $core.int? numShortTermRefPicSets,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (spsVideoParameterSetId != null) {
      $result.spsVideoParameterSetId = spsVideoParameterSetId;
    }
    if (seqParameterSetId != null) {
      $result.seqParameterSetId = seqParameterSetId;
    }
    if (picWidthInLumaSamples != null) {
      $result.picWidthInLumaSamples = picWidthInLumaSamples;
    }
    if (picHeightInLumaSamples != null) {
      $result.picHeightInLumaSamples = picHeightInLumaSamples;
    }
    if (log2MaxPicOrderCntLsbMinus4 != null) {
      $result.log2MaxPicOrderCntLsbMinus4 = log2MaxPicOrderCntLsbMinus4;
    }
    if (log2MinLumaCodingBlockSizeMinus3 != null) {
      $result.log2MinLumaCodingBlockSizeMinus3 = log2MinLumaCodingBlockSizeMinus3;
    }
    if (log2DiffMaxMinLumaCodingBlockSize != null) {
      $result.log2DiffMaxMinLumaCodingBlockSize = log2DiffMaxMinLumaCodingBlockSize;
    }
    if (separateColourPlaneFlag != null) {
      $result.separateColourPlaneFlag = separateColourPlaneFlag;
    }
    if (numShortTermRefPicSets != null) {
      $result.numShortTermRefPicSets = numShortTermRefPicSets;
    }
    return $result;
  }
  MALHEVCSPS._() : super();
  factory MALHEVCSPS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCSPS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCSPS', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALHEVCNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'spsVideoParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'seqParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'picWidthInLumaSamples', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'picHeightInLumaSamples', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'log2MaxPicOrderCntLsbMinus4', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'log2MinLumaCodingBlockSizeMinus3', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'log2DiffMaxMinLumaCodingBlockSize', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'separateColourPlaneFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'numShortTermRefPicSets', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCSPS clone() => MALHEVCSPS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCSPS copyWith(void Function(MALHEVCSPS) updates) => super.copyWith((message) => updates(message as MALHEVCSPS)) as MALHEVCSPS;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCSPS create() => MALHEVCSPS._();
  MALHEVCSPS createEmptyInstance() => create();
  static $pb.PbList<MALHEVCSPS> createRepeated() => $pb.PbList<MALHEVCSPS>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCSPS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCSPS>(create);
  static MALHEVCSPS? _defaultInstance;

  @$pb.TagNumber(1)
  MALHEVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get spsVideoParameterSetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set spsVideoParameterSetId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpsVideoParameterSetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpsVideoParameterSetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get seqParameterSetId => $_getIZ(2);
  @$pb.TagNumber(3)
  set seqParameterSetId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeqParameterSetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeqParameterSetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get picWidthInLumaSamples => $_getIZ(3);
  @$pb.TagNumber(4)
  set picWidthInLumaSamples($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPicWidthInLumaSamples() => $_has(3);
  @$pb.TagNumber(4)
  void clearPicWidthInLumaSamples() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get picHeightInLumaSamples => $_getIZ(4);
  @$pb.TagNumber(5)
  set picHeightInLumaSamples($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPicHeightInLumaSamples() => $_has(4);
  @$pb.TagNumber(5)
  void clearPicHeightInLumaSamples() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get log2MaxPicOrderCntLsbMinus4 => $_getIZ(5);
  @$pb.TagNumber(6)
  set log2MaxPicOrderCntLsbMinus4($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLog2MaxPicOrderCntLsbMinus4() => $_has(5);
  @$pb.TagNumber(6)
  void clearLog2MaxPicOrderCntLsbMinus4() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get log2MinLumaCodingBlockSizeMinus3 => $_getIZ(6);
  @$pb.TagNumber(7)
  set log2MinLumaCodingBlockSizeMinus3($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLog2MinLumaCodingBlockSizeMinus3() => $_has(6);
  @$pb.TagNumber(7)
  void clearLog2MinLumaCodingBlockSizeMinus3() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get log2DiffMaxMinLumaCodingBlockSize => $_getIZ(7);
  @$pb.TagNumber(8)
  set log2DiffMaxMinLumaCodingBlockSize($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLog2DiffMaxMinLumaCodingBlockSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearLog2DiffMaxMinLumaCodingBlockSize() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get separateColourPlaneFlag => $_getIZ(8);
  @$pb.TagNumber(9)
  set separateColourPlaneFlag($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSeparateColourPlaneFlag() => $_has(8);
  @$pb.TagNumber(9)
  void clearSeparateColourPlaneFlag() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get numShortTermRefPicSets => $_getIZ(9);
  @$pb.TagNumber(10)
  set numShortTermRefPicSets($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNumShortTermRefPicSets() => $_has(9);
  @$pb.TagNumber(10)
  void clearNumShortTermRefPicSets() => clearField(10);
}

class MALHEVCPPS extends $pb.GeneratedMessage {
  factory MALHEVCPPS({
    MALHEVCNal? base,
    $core.int? picParameterSetId,
    $core.int? seqParameterSetId,
    $core.int? dependentSliceSegmentsEnabledFlag,
    $core.int? numExtraSliceHeaderBits,
    $core.int? outputFlagPresentFlag,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (picParameterSetId != null) {
      $result.picParameterSetId = picParameterSetId;
    }
    if (seqParameterSetId != null) {
      $result.seqParameterSetId = seqParameterSetId;
    }
    if (dependentSliceSegmentsEnabledFlag != null) {
      $result.dependentSliceSegmentsEnabledFlag = dependentSliceSegmentsEnabledFlag;
    }
    if (numExtraSliceHeaderBits != null) {
      $result.numExtraSliceHeaderBits = numExtraSliceHeaderBits;
    }
    if (outputFlagPresentFlag != null) {
      $result.outputFlagPresentFlag = outputFlagPresentFlag;
    }
    return $result;
  }
  MALHEVCPPS._() : super();
  factory MALHEVCPPS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCPPS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCPPS', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALHEVCNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'picParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'seqParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'dependentSliceSegmentsEnabledFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'numExtraSliceHeaderBits', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'outputFlagPresentFlag', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCPPS clone() => MALHEVCPPS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCPPS copyWith(void Function(MALHEVCPPS) updates) => super.copyWith((message) => updates(message as MALHEVCPPS)) as MALHEVCPPS;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCPPS create() => MALHEVCPPS._();
  MALHEVCPPS createEmptyInstance() => create();
  static $pb.PbList<MALHEVCPPS> createRepeated() => $pb.PbList<MALHEVCPPS>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCPPS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCPPS>(create);
  static MALHEVCPPS? _defaultInstance;

  @$pb.TagNumber(1)
  MALHEVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get picParameterSetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set picParameterSetId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPicParameterSetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPicParameterSetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get seqParameterSetId => $_getIZ(2);
  @$pb.TagNumber(3)
  set seqParameterSetId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeqParameterSetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeqParameterSetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get dependentSliceSegmentsEnabledFlag => $_getIZ(3);
  @$pb.TagNumber(4)
  set dependentSliceSegmentsEnabledFlag($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDependentSliceSegmentsEnabledFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearDependentSliceSegmentsEnabledFlag() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get numExtraSliceHeaderBits => $_getIZ(4);
  @$pb.TagNumber(5)
  set numExtraSliceHeaderBits($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumExtraSliceHeaderBits() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumExtraSliceHeaderBits() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get outputFlagPresentFlag => $_getIZ(5);
  @$pb.TagNumber(6)
  set outputFlagPresentFlag($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOutputFlagPresentFlag() => $_has(5);
  @$pb.TagNumber(6)
  void clearOutputFlagPresentFlag() => clearField(6);
}

class MALSEIMasterDisplayColour extends $pb.GeneratedMessage {
  factory MALSEIMasterDisplayColour({
    $core.int? displayPrimariesX0,
    $core.int? displayPrimariesX1,
    $core.int? displayPrimariesX2,
    $core.int? displayPrimariesY0,
    $core.int? displayPrimariesY1,
    $core.int? displayPrimariesY2,
    $core.int? whitePointX,
    $core.int? whitePointY,
    $core.int? maxDisplayMasteringLuminance,
    $core.int? minDisplayMasteringLuminance,
  }) {
    final $result = create();
    if (displayPrimariesX0 != null) {
      $result.displayPrimariesX0 = displayPrimariesX0;
    }
    if (displayPrimariesX1 != null) {
      $result.displayPrimariesX1 = displayPrimariesX1;
    }
    if (displayPrimariesX2 != null) {
      $result.displayPrimariesX2 = displayPrimariesX2;
    }
    if (displayPrimariesY0 != null) {
      $result.displayPrimariesY0 = displayPrimariesY0;
    }
    if (displayPrimariesY1 != null) {
      $result.displayPrimariesY1 = displayPrimariesY1;
    }
    if (displayPrimariesY2 != null) {
      $result.displayPrimariesY2 = displayPrimariesY2;
    }
    if (whitePointX != null) {
      $result.whitePointX = whitePointX;
    }
    if (whitePointY != null) {
      $result.whitePointY = whitePointY;
    }
    if (maxDisplayMasteringLuminance != null) {
      $result.maxDisplayMasteringLuminance = maxDisplayMasteringLuminance;
    }
    if (minDisplayMasteringLuminance != null) {
      $result.minDisplayMasteringLuminance = minDisplayMasteringLuminance;
    }
    return $result;
  }
  MALSEIMasterDisplayColour._() : super();
  factory MALSEIMasterDisplayColour.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALSEIMasterDisplayColour.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALSEIMasterDisplayColour', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'displayPrimariesX0', $pb.PbFieldType.O3, protoName: 'display_primaries_x_0')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'displayPrimariesX1', $pb.PbFieldType.O3, protoName: 'display_primaries_x_1')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'displayPrimariesX2', $pb.PbFieldType.O3, protoName: 'display_primaries_x_2')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'displayPrimariesY0', $pb.PbFieldType.O3, protoName: 'display_primaries_y_0')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'displayPrimariesY1', $pb.PbFieldType.O3, protoName: 'display_primaries_y_1')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'displayPrimariesY2', $pb.PbFieldType.O3, protoName: 'display_primaries_y_2')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'whitePointX', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'whitePointY', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'maxDisplayMasteringLuminance', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'minDisplayMasteringLuminance', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALSEIMasterDisplayColour clone() => MALSEIMasterDisplayColour()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALSEIMasterDisplayColour copyWith(void Function(MALSEIMasterDisplayColour) updates) => super.copyWith((message) => updates(message as MALSEIMasterDisplayColour)) as MALSEIMasterDisplayColour;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALSEIMasterDisplayColour create() => MALSEIMasterDisplayColour._();
  MALSEIMasterDisplayColour createEmptyInstance() => create();
  static $pb.PbList<MALSEIMasterDisplayColour> createRepeated() => $pb.PbList<MALSEIMasterDisplayColour>();
  @$core.pragma('dart2js:noInline')
  static MALSEIMasterDisplayColour getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALSEIMasterDisplayColour>(create);
  static MALSEIMasterDisplayColour? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get displayPrimariesX0 => $_getIZ(0);
  @$pb.TagNumber(1)
  set displayPrimariesX0($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisplayPrimariesX0() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplayPrimariesX0() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get displayPrimariesX1 => $_getIZ(1);
  @$pb.TagNumber(2)
  set displayPrimariesX1($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayPrimariesX1() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayPrimariesX1() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get displayPrimariesX2 => $_getIZ(2);
  @$pb.TagNumber(3)
  set displayPrimariesX2($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayPrimariesX2() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayPrimariesX2() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get displayPrimariesY0 => $_getIZ(3);
  @$pb.TagNumber(4)
  set displayPrimariesY0($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplayPrimariesY0() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplayPrimariesY0() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get displayPrimariesY1 => $_getIZ(4);
  @$pb.TagNumber(5)
  set displayPrimariesY1($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplayPrimariesY1() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayPrimariesY1() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get displayPrimariesY2 => $_getIZ(5);
  @$pb.TagNumber(6)
  set displayPrimariesY2($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDisplayPrimariesY2() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplayPrimariesY2() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get whitePointX => $_getIZ(6);
  @$pb.TagNumber(7)
  set whitePointX($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWhitePointX() => $_has(6);
  @$pb.TagNumber(7)
  void clearWhitePointX() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get whitePointY => $_getIZ(7);
  @$pb.TagNumber(8)
  set whitePointY($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWhitePointY() => $_has(7);
  @$pb.TagNumber(8)
  void clearWhitePointY() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get maxDisplayMasteringLuminance => $_getIZ(8);
  @$pb.TagNumber(9)
  set maxDisplayMasteringLuminance($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMaxDisplayMasteringLuminance() => $_has(8);
  @$pb.TagNumber(9)
  void clearMaxDisplayMasteringLuminance() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get minDisplayMasteringLuminance => $_getIZ(9);
  @$pb.TagNumber(10)
  set minDisplayMasteringLuminance($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMinDisplayMasteringLuminance() => $_has(9);
  @$pb.TagNumber(10)
  void clearMinDisplayMasteringLuminance() => clearField(10);
}

class MALSEIContentLightLevelInfo extends $pb.GeneratedMessage {
  factory MALSEIContentLightLevelInfo({
    $core.int? maxContentLightLevel,
    $core.int? maxPicAverageLightLevel,
  }) {
    final $result = create();
    if (maxContentLightLevel != null) {
      $result.maxContentLightLevel = maxContentLightLevel;
    }
    if (maxPicAverageLightLevel != null) {
      $result.maxPicAverageLightLevel = maxPicAverageLightLevel;
    }
    return $result;
  }
  MALSEIContentLightLevelInfo._() : super();
  factory MALSEIContentLightLevelInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALSEIContentLightLevelInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALSEIContentLightLevelInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'maxContentLightLevel', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxPicAverageLightLevel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALSEIContentLightLevelInfo clone() => MALSEIContentLightLevelInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALSEIContentLightLevelInfo copyWith(void Function(MALSEIContentLightLevelInfo) updates) => super.copyWith((message) => updates(message as MALSEIContentLightLevelInfo)) as MALSEIContentLightLevelInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALSEIContentLightLevelInfo create() => MALSEIContentLightLevelInfo._();
  MALSEIContentLightLevelInfo createEmptyInstance() => create();
  static $pb.PbList<MALSEIContentLightLevelInfo> createRepeated() => $pb.PbList<MALSEIContentLightLevelInfo>();
  @$core.pragma('dart2js:noInline')
  static MALSEIContentLightLevelInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALSEIContentLightLevelInfo>(create);
  static MALSEIContentLightLevelInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxContentLightLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxContentLightLevel($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxContentLightLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxContentLightLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxPicAverageLightLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxPicAverageLightLevel($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxPicAverageLightLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxPicAverageLightLevel() => clearField(2);
}

class MALSEIUserDataRegisteredItuTT35 extends $pb.GeneratedMessage {
  factory MALSEIUserDataRegisteredItuTT35({
    $core.int? ituTT35CountryCode,
    $core.int? ituTT35CountryCodeExtensionByte,
    $core.String? ituTT35PayloadByte,
  }) {
    final $result = create();
    if (ituTT35CountryCode != null) {
      $result.ituTT35CountryCode = ituTT35CountryCode;
    }
    if (ituTT35CountryCodeExtensionByte != null) {
      $result.ituTT35CountryCodeExtensionByte = ituTT35CountryCodeExtensionByte;
    }
    if (ituTT35PayloadByte != null) {
      $result.ituTT35PayloadByte = ituTT35PayloadByte;
    }
    return $result;
  }
  MALSEIUserDataRegisteredItuTT35._() : super();
  factory MALSEIUserDataRegisteredItuTT35.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALSEIUserDataRegisteredItuTT35.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALSEIUserDataRegisteredItuTT35', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ituTT35CountryCode', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ituTT35CountryCodeExtensionByte', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'ituTT35PayloadByte')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALSEIUserDataRegisteredItuTT35 clone() => MALSEIUserDataRegisteredItuTT35()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALSEIUserDataRegisteredItuTT35 copyWith(void Function(MALSEIUserDataRegisteredItuTT35) updates) => super.copyWith((message) => updates(message as MALSEIUserDataRegisteredItuTT35)) as MALSEIUserDataRegisteredItuTT35;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALSEIUserDataRegisteredItuTT35 create() => MALSEIUserDataRegisteredItuTT35._();
  MALSEIUserDataRegisteredItuTT35 createEmptyInstance() => create();
  static $pb.PbList<MALSEIUserDataRegisteredItuTT35> createRepeated() => $pb.PbList<MALSEIUserDataRegisteredItuTT35>();
  @$core.pragma('dart2js:noInline')
  static MALSEIUserDataRegisteredItuTT35 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALSEIUserDataRegisteredItuTT35>(create);
  static MALSEIUserDataRegisteredItuTT35? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ituTT35CountryCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set ituTT35CountryCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasItuTT35CountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearItuTT35CountryCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ituTT35CountryCodeExtensionByte => $_getIZ(1);
  @$pb.TagNumber(2)
  set ituTT35CountryCodeExtensionByte($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasItuTT35CountryCodeExtensionByte() => $_has(1);
  @$pb.TagNumber(2)
  void clearItuTT35CountryCodeExtensionByte() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ituTT35PayloadByte => $_getSZ(2);
  @$pb.TagNumber(3)
  set ituTT35PayloadByte($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasItuTT35PayloadByte() => $_has(2);
  @$pb.TagNumber(3)
  void clearItuTT35PayloadByte() => clearField(3);
}

enum MALSEIMessage_SeiType {
  hevcSeiType, 
  avcSeiType, 
  notSet
}

enum MALSEIMessage_Payload {
  displayColour, 
  contentLightLevelInfo, 
  userDataRegisteredItuTT35, 
  notSet
}

class MALSEIMessage extends $pb.GeneratedMessage {
  factory MALSEIMessage({
    $core.String? key,
    $core.int? payloadType,
    $core.String? value,
    $core.int? payloadSize,
    $core.String? keyHex,
    $core.String? valueHex,
    MALHEVCSEI_MALHEVCSEIType? hevcSeiType,
    MALAVCSEI_MALAVCSEIType? avcSeiType,
    MALSEIMasterDisplayColour? displayColour,
    MALSEIContentLightLevelInfo? contentLightLevelInfo,
    MALSEIUserDataRegisteredItuTT35? userDataRegisteredItuTT35,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (payloadType != null) {
      $result.payloadType = payloadType;
    }
    if (value != null) {
      $result.value = value;
    }
    if (payloadSize != null) {
      $result.payloadSize = payloadSize;
    }
    if (keyHex != null) {
      $result.keyHex = keyHex;
    }
    if (valueHex != null) {
      $result.valueHex = valueHex;
    }
    if (hevcSeiType != null) {
      $result.hevcSeiType = hevcSeiType;
    }
    if (avcSeiType != null) {
      $result.avcSeiType = avcSeiType;
    }
    if (displayColour != null) {
      $result.displayColour = displayColour;
    }
    if (contentLightLevelInfo != null) {
      $result.contentLightLevelInfo = contentLightLevelInfo;
    }
    if (userDataRegisteredItuTT35 != null) {
      $result.userDataRegisteredItuTT35 = userDataRegisteredItuTT35;
    }
    return $result;
  }
  MALSEIMessage._() : super();
  factory MALSEIMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALSEIMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MALSEIMessage_SeiType> _MALSEIMessage_SeiTypeByTag = {
    7 : MALSEIMessage_SeiType.hevcSeiType,
    8 : MALSEIMessage_SeiType.avcSeiType,
    0 : MALSEIMessage_SeiType.notSet
  };
  static const $core.Map<$core.int, MALSEIMessage_Payload> _MALSEIMessage_PayloadByTag = {
    9 : MALSEIMessage_Payload.displayColour,
    10 : MALSEIMessage_Payload.contentLightLevelInfo,
    11 : MALSEIMessage_Payload.userDataRegisteredItuTT35,
    0 : MALSEIMessage_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALSEIMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..oo(1, [9, 10, 11])
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'payloadType', $pb.PbFieldType.O3, protoName: 'payloadType')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'payloadSize', $pb.PbFieldType.O3, protoName: 'payloadSize')
    ..aOS(5, _omitFieldNames ? '' : 'keyHex')
    ..aOS(6, _omitFieldNames ? '' : 'valueHex')
    ..e<MALHEVCSEI_MALHEVCSEIType>(7, _omitFieldNames ? '' : 'hevcSeiType', $pb.PbFieldType.OE, defaultOrMaker: MALHEVCSEI_MALHEVCSEIType.buffering_period_, valueOf: MALHEVCSEI_MALHEVCSEIType.valueOf, enumValues: MALHEVCSEI_MALHEVCSEIType.values)
    ..e<MALAVCSEI_MALAVCSEIType>(8, _omitFieldNames ? '' : 'avcSeiType', $pb.PbFieldType.OE, defaultOrMaker: MALAVCSEI_MALAVCSEIType.buffering_period_, valueOf: MALAVCSEI_MALAVCSEIType.valueOf, enumValues: MALAVCSEI_MALAVCSEIType.values)
    ..aOM<MALSEIMasterDisplayColour>(9, _omitFieldNames ? '' : 'displayColour', protoName: 'displayColour', subBuilder: MALSEIMasterDisplayColour.create)
    ..aOM<MALSEIContentLightLevelInfo>(10, _omitFieldNames ? '' : 'contentLightLevelInfo', protoName: 'contentLightLevelInfo', subBuilder: MALSEIContentLightLevelInfo.create)
    ..aOM<MALSEIUserDataRegisteredItuTT35>(11, _omitFieldNames ? '' : 'userDataRegisteredItuTT35', protoName: 'userDataRegisteredItuTT35', subBuilder: MALSEIUserDataRegisteredItuTT35.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALSEIMessage clone() => MALSEIMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALSEIMessage copyWith(void Function(MALSEIMessage) updates) => super.copyWith((message) => updates(message as MALSEIMessage)) as MALSEIMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALSEIMessage create() => MALSEIMessage._();
  MALSEIMessage createEmptyInstance() => create();
  static $pb.PbList<MALSEIMessage> createRepeated() => $pb.PbList<MALSEIMessage>();
  @$core.pragma('dart2js:noInline')
  static MALSEIMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALSEIMessage>(create);
  static MALSEIMessage? _defaultInstance;

  MALSEIMessage_SeiType whichSeiType() => _MALSEIMessage_SeiTypeByTag[$_whichOneof(0)]!;
  void clearSeiType() => clearField($_whichOneof(0));

  MALSEIMessage_Payload whichPayload() => _MALSEIMessage_PayloadByTag[$_whichOneof(1)]!;
  void clearPayload() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get payloadType => $_getIZ(1);
  @$pb.TagNumber(2)
  set payloadType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayloadType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayloadType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get payloadSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set payloadSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPayloadSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayloadSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get keyHex => $_getSZ(4);
  @$pb.TagNumber(5)
  set keyHex($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasKeyHex() => $_has(4);
  @$pb.TagNumber(5)
  void clearKeyHex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get valueHex => $_getSZ(5);
  @$pb.TagNumber(6)
  set valueHex($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasValueHex() => $_has(5);
  @$pb.TagNumber(6)
  void clearValueHex() => clearField(6);

  @$pb.TagNumber(7)
  MALHEVCSEI_MALHEVCSEIType get hevcSeiType => $_getN(6);
  @$pb.TagNumber(7)
  set hevcSeiType(MALHEVCSEI_MALHEVCSEIType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasHevcSeiType() => $_has(6);
  @$pb.TagNumber(7)
  void clearHevcSeiType() => clearField(7);

  @$pb.TagNumber(8)
  MALAVCSEI_MALAVCSEIType get avcSeiType => $_getN(7);
  @$pb.TagNumber(8)
  set avcSeiType(MALAVCSEI_MALAVCSEIType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAvcSeiType() => $_has(7);
  @$pb.TagNumber(8)
  void clearAvcSeiType() => clearField(8);

  @$pb.TagNumber(9)
  MALSEIMasterDisplayColour get displayColour => $_getN(8);
  @$pb.TagNumber(9)
  set displayColour(MALSEIMasterDisplayColour v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDisplayColour() => $_has(8);
  @$pb.TagNumber(9)
  void clearDisplayColour() => clearField(9);
  @$pb.TagNumber(9)
  MALSEIMasterDisplayColour ensureDisplayColour() => $_ensure(8);

  @$pb.TagNumber(10)
  MALSEIContentLightLevelInfo get contentLightLevelInfo => $_getN(9);
  @$pb.TagNumber(10)
  set contentLightLevelInfo(MALSEIContentLightLevelInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasContentLightLevelInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearContentLightLevelInfo() => clearField(10);
  @$pb.TagNumber(10)
  MALSEIContentLightLevelInfo ensureContentLightLevelInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  MALSEIUserDataRegisteredItuTT35 get userDataRegisteredItuTT35 => $_getN(10);
  @$pb.TagNumber(11)
  set userDataRegisteredItuTT35(MALSEIUserDataRegisteredItuTT35 v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserDataRegisteredItuTT35() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserDataRegisteredItuTT35() => clearField(11);
  @$pb.TagNumber(11)
  MALSEIUserDataRegisteredItuTT35 ensureUserDataRegisteredItuTT35() => $_ensure(10);
}

class MALHEVCSEI extends $pb.GeneratedMessage {
  factory MALHEVCSEI({
    MALHEVCNal? base,
    $core.Iterable<MALSEIMessage>? messageList,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (messageList != null) {
      $result.messageList.addAll(messageList);
    }
    return $result;
  }
  MALHEVCSEI._() : super();
  factory MALHEVCSEI.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCSEI.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCSEI', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALHEVCNal.create)
    ..pc<MALSEIMessage>(2, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM, protoName: 'messageList', subBuilder: MALSEIMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCSEI clone() => MALHEVCSEI()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCSEI copyWith(void Function(MALHEVCSEI) updates) => super.copyWith((message) => updates(message as MALHEVCSEI)) as MALHEVCSEI;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCSEI create() => MALHEVCSEI._();
  MALHEVCSEI createEmptyInstance() => create();
  static $pb.PbList<MALHEVCSEI> createRepeated() => $pb.PbList<MALHEVCSEI>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCSEI getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCSEI>(create);
  static MALHEVCSEI? _defaultInstance;

  @$pb.TagNumber(1)
  MALHEVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<MALSEIMessage> get messageList => $_getList(1);
}

class MALHEVCSliceSegmentHeader extends $pb.GeneratedMessage {
  factory MALHEVCSliceSegmentHeader({
    $core.int? firstSliceSegmentInPicFlag,
    $core.int? noOutputOfPriorPicsFlag,
    $core.int? slicePicParameterSetId,
    $core.int? sliceSegmentAddress,
    $core.int? sliceType,
    $core.int? slicePicOrderCntLsb,
  }) {
    final $result = create();
    if (firstSliceSegmentInPicFlag != null) {
      $result.firstSliceSegmentInPicFlag = firstSliceSegmentInPicFlag;
    }
    if (noOutputOfPriorPicsFlag != null) {
      $result.noOutputOfPriorPicsFlag = noOutputOfPriorPicsFlag;
    }
    if (slicePicParameterSetId != null) {
      $result.slicePicParameterSetId = slicePicParameterSetId;
    }
    if (sliceSegmentAddress != null) {
      $result.sliceSegmentAddress = sliceSegmentAddress;
    }
    if (sliceType != null) {
      $result.sliceType = sliceType;
    }
    if (slicePicOrderCntLsb != null) {
      $result.slicePicOrderCntLsb = slicePicOrderCntLsb;
    }
    return $result;
  }
  MALHEVCSliceSegmentHeader._() : super();
  factory MALHEVCSliceSegmentHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCSliceSegmentHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCSliceSegmentHeader', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'firstSliceSegmentInPicFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'noOutputOfPriorPicsFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'slicePicParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sliceSegmentAddress', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'sliceType', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'slicePicOrderCntLsb', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCSliceSegmentHeader clone() => MALHEVCSliceSegmentHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCSliceSegmentHeader copyWith(void Function(MALHEVCSliceSegmentHeader) updates) => super.copyWith((message) => updates(message as MALHEVCSliceSegmentHeader)) as MALHEVCSliceSegmentHeader;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCSliceSegmentHeader create() => MALHEVCSliceSegmentHeader._();
  MALHEVCSliceSegmentHeader createEmptyInstance() => create();
  static $pb.PbList<MALHEVCSliceSegmentHeader> createRepeated() => $pb.PbList<MALHEVCSliceSegmentHeader>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCSliceSegmentHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCSliceSegmentHeader>(create);
  static MALHEVCSliceSegmentHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get firstSliceSegmentInPicFlag => $_getIZ(0);
  @$pb.TagNumber(1)
  set firstSliceSegmentInPicFlag($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstSliceSegmentInPicFlag() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstSliceSegmentInPicFlag() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get noOutputOfPriorPicsFlag => $_getIZ(1);
  @$pb.TagNumber(2)
  set noOutputOfPriorPicsFlag($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoOutputOfPriorPicsFlag() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoOutputOfPriorPicsFlag() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get slicePicParameterSetId => $_getIZ(2);
  @$pb.TagNumber(3)
  set slicePicParameterSetId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSlicePicParameterSetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlicePicParameterSetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sliceSegmentAddress => $_getIZ(3);
  @$pb.TagNumber(4)
  set sliceSegmentAddress($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSliceSegmentAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearSliceSegmentAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sliceType => $_getIZ(4);
  @$pb.TagNumber(5)
  set sliceType($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSliceType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSliceType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get slicePicOrderCntLsb => $_getIZ(5);
  @$pb.TagNumber(6)
  set slicePicOrderCntLsb($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSlicePicOrderCntLsb() => $_has(5);
  @$pb.TagNumber(6)
  void clearSlicePicOrderCntLsb() => clearField(6);
}

class MALHEVCSliceSegmentLayerRbsp extends $pb.GeneratedMessage {
  factory MALHEVCSliceSegmentLayerRbsp({
    MALHEVCNal? base,
    MALHEVCSliceSegmentHeader? header,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (header != null) {
      $result.header = header;
    }
    return $result;
  }
  MALHEVCSliceSegmentLayerRbsp._() : super();
  factory MALHEVCSliceSegmentLayerRbsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHEVCSliceSegmentLayerRbsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHEVCSliceSegmentLayerRbsp', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALHEVCNal.create)
    ..aOM<MALHEVCSliceSegmentHeader>(2, _omitFieldNames ? '' : 'header', subBuilder: MALHEVCSliceSegmentHeader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHEVCSliceSegmentLayerRbsp clone() => MALHEVCSliceSegmentLayerRbsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHEVCSliceSegmentLayerRbsp copyWith(void Function(MALHEVCSliceSegmentLayerRbsp) updates) => super.copyWith((message) => updates(message as MALHEVCSliceSegmentLayerRbsp)) as MALHEVCSliceSegmentLayerRbsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHEVCSliceSegmentLayerRbsp create() => MALHEVCSliceSegmentLayerRbsp._();
  MALHEVCSliceSegmentLayerRbsp createEmptyInstance() => create();
  static $pb.PbList<MALHEVCSliceSegmentLayerRbsp> createRepeated() => $pb.PbList<MALHEVCSliceSegmentLayerRbsp>();
  @$core.pragma('dart2js:noInline')
  static MALHEVCSliceSegmentLayerRbsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHEVCSliceSegmentLayerRbsp>(create);
  static MALHEVCSliceSegmentLayerRbsp? _defaultInstance;

  @$pb.TagNumber(1)
  MALHEVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  MALHEVCSliceSegmentHeader get header => $_getN(1);
  @$pb.TagNumber(2)
  set header(MALHEVCSliceSegmentHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
  @$pb.TagNumber(2)
  MALHEVCSliceSegmentHeader ensureHeader() => $_ensure(1);
}

class MALAVCNal extends $pb.GeneratedMessage {
  factory MALAVCNal({
    MALNal? base,
    $core.int? nalRefIdc,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (nalRefIdc != null) {
      $result.nalRefIdc = nalRefIdc;
    }
    return $result;
  }
  MALAVCNal._() : super();
  factory MALAVCNal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCNal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCNal', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'nalRefIdc', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCNal clone() => MALAVCNal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCNal copyWith(void Function(MALAVCNal) updates) => super.copyWith((message) => updates(message as MALAVCNal)) as MALAVCNal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCNal create() => MALAVCNal._();
  MALAVCNal createEmptyInstance() => create();
  static $pb.PbList<MALAVCNal> createRepeated() => $pb.PbList<MALAVCNal>();
  @$core.pragma('dart2js:noInline')
  static MALAVCNal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCNal>(create);
  static MALAVCNal? _defaultInstance;

  @$pb.TagNumber(1)
  MALNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get nalRefIdc => $_getIZ(1);
  @$pb.TagNumber(2)
  set nalRefIdc($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNalRefIdc() => $_has(1);
  @$pb.TagNumber(2)
  void clearNalRefIdc() => clearField(2);
}

class MALAVCSPS extends $pb.GeneratedMessage {
  factory MALAVCSPS({
    MALAVCNal? base,
    $core.int? profileIdc,
    $core.int? levelIdc,
    $core.int? seqParameterSetId,
    $core.int? chromaFormatIdc,
    $core.int? bitDepthLumaMinus8,
    $core.int? bitDepthChromaMinus8,
    $core.int? log2MaxFrameNumMinus4,
    $core.int? picOrderCntType,
    $core.int? deltaPicOrderAlwaysZeroFlag,
    $core.int? numRefFramesInPicOrderCntCycle,
    $core.Iterable<$core.int>? offsetForRefFrame,
    $core.int? log2MaxPicOrderCntLsbMinus4,
    $core.int? maxNumRefFrames,
    $core.int? picWidthInMbsMinus1,
    $core.int? picHeightInMapUnitsMinus1,
    $core.int? frameMbsOnlyFlag,
    $core.int? mbAdaptiveFrameFieldFlag,
    $core.int? frameCroppingFlag,
    $core.int? separateColourPlaneFlag,
    $core.int? offsetForNonRefPic,
    $core.int? offsetForTopToBottomField,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (profileIdc != null) {
      $result.profileIdc = profileIdc;
    }
    if (levelIdc != null) {
      $result.levelIdc = levelIdc;
    }
    if (seqParameterSetId != null) {
      $result.seqParameterSetId = seqParameterSetId;
    }
    if (chromaFormatIdc != null) {
      $result.chromaFormatIdc = chromaFormatIdc;
    }
    if (bitDepthLumaMinus8 != null) {
      $result.bitDepthLumaMinus8 = bitDepthLumaMinus8;
    }
    if (bitDepthChromaMinus8 != null) {
      $result.bitDepthChromaMinus8 = bitDepthChromaMinus8;
    }
    if (log2MaxFrameNumMinus4 != null) {
      $result.log2MaxFrameNumMinus4 = log2MaxFrameNumMinus4;
    }
    if (picOrderCntType != null) {
      $result.picOrderCntType = picOrderCntType;
    }
    if (deltaPicOrderAlwaysZeroFlag != null) {
      $result.deltaPicOrderAlwaysZeroFlag = deltaPicOrderAlwaysZeroFlag;
    }
    if (numRefFramesInPicOrderCntCycle != null) {
      $result.numRefFramesInPicOrderCntCycle = numRefFramesInPicOrderCntCycle;
    }
    if (offsetForRefFrame != null) {
      $result.offsetForRefFrame.addAll(offsetForRefFrame);
    }
    if (log2MaxPicOrderCntLsbMinus4 != null) {
      $result.log2MaxPicOrderCntLsbMinus4 = log2MaxPicOrderCntLsbMinus4;
    }
    if (maxNumRefFrames != null) {
      $result.maxNumRefFrames = maxNumRefFrames;
    }
    if (picWidthInMbsMinus1 != null) {
      $result.picWidthInMbsMinus1 = picWidthInMbsMinus1;
    }
    if (picHeightInMapUnitsMinus1 != null) {
      $result.picHeightInMapUnitsMinus1 = picHeightInMapUnitsMinus1;
    }
    if (frameMbsOnlyFlag != null) {
      $result.frameMbsOnlyFlag = frameMbsOnlyFlag;
    }
    if (mbAdaptiveFrameFieldFlag != null) {
      $result.mbAdaptiveFrameFieldFlag = mbAdaptiveFrameFieldFlag;
    }
    if (frameCroppingFlag != null) {
      $result.frameCroppingFlag = frameCroppingFlag;
    }
    if (separateColourPlaneFlag != null) {
      $result.separateColourPlaneFlag = separateColourPlaneFlag;
    }
    if (offsetForNonRefPic != null) {
      $result.offsetForNonRefPic = offsetForNonRefPic;
    }
    if (offsetForTopToBottomField != null) {
      $result.offsetForTopToBottomField = offsetForTopToBottomField;
    }
    return $result;
  }
  MALAVCSPS._() : super();
  factory MALAVCSPS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCSPS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCSPS', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALAVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALAVCNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'profileIdc', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'levelIdc', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'seqParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'chromaFormatIdc', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'bitDepthLumaMinus8', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'bitDepthChromaMinus8', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'log2MaxFrameNumMinus4', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'picOrderCntType', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'deltaPicOrderAlwaysZeroFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'numRefFramesInPicOrderCntCycle', $pb.PbFieldType.O3)
    ..p<$core.int>(12, _omitFieldNames ? '' : 'offsetForRefFrame', $pb.PbFieldType.K3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'log2MaxPicOrderCntLsbMinus4', $pb.PbFieldType.O3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'maxNumRefFrames', $pb.PbFieldType.O3)
    ..a<$core.int>(15, _omitFieldNames ? '' : 'picWidthInMbsMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(16, _omitFieldNames ? '' : 'picHeightInMapUnitsMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'frameMbsOnlyFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(18, _omitFieldNames ? '' : 'mbAdaptiveFrameFieldFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(19, _omitFieldNames ? '' : 'frameCroppingFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(20, _omitFieldNames ? '' : 'separateColourPlaneFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(21, _omitFieldNames ? '' : 'offsetForNonRefPic', $pb.PbFieldType.O3)
    ..a<$core.int>(22, _omitFieldNames ? '' : 'offsetForTopToBottomField', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCSPS clone() => MALAVCSPS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCSPS copyWith(void Function(MALAVCSPS) updates) => super.copyWith((message) => updates(message as MALAVCSPS)) as MALAVCSPS;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCSPS create() => MALAVCSPS._();
  MALAVCSPS createEmptyInstance() => create();
  static $pb.PbList<MALAVCSPS> createRepeated() => $pb.PbList<MALAVCSPS>();
  @$core.pragma('dart2js:noInline')
  static MALAVCSPS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCSPS>(create);
  static MALAVCSPS? _defaultInstance;

  @$pb.TagNumber(1)
  MALAVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALAVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALAVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get profileIdc => $_getIZ(1);
  @$pb.TagNumber(2)
  set profileIdc($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProfileIdc() => $_has(1);
  @$pb.TagNumber(2)
  void clearProfileIdc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get levelIdc => $_getIZ(2);
  @$pb.TagNumber(3)
  set levelIdc($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLevelIdc() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevelIdc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get seqParameterSetId => $_getIZ(3);
  @$pb.TagNumber(4)
  set seqParameterSetId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSeqParameterSetId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSeqParameterSetId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chromaFormatIdc => $_getIZ(4);
  @$pb.TagNumber(5)
  set chromaFormatIdc($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChromaFormatIdc() => $_has(4);
  @$pb.TagNumber(5)
  void clearChromaFormatIdc() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get bitDepthLumaMinus8 => $_getIZ(5);
  @$pb.TagNumber(6)
  set bitDepthLumaMinus8($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBitDepthLumaMinus8() => $_has(5);
  @$pb.TagNumber(6)
  void clearBitDepthLumaMinus8() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get bitDepthChromaMinus8 => $_getIZ(6);
  @$pb.TagNumber(7)
  set bitDepthChromaMinus8($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBitDepthChromaMinus8() => $_has(6);
  @$pb.TagNumber(7)
  void clearBitDepthChromaMinus8() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get log2MaxFrameNumMinus4 => $_getIZ(7);
  @$pb.TagNumber(8)
  set log2MaxFrameNumMinus4($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLog2MaxFrameNumMinus4() => $_has(7);
  @$pb.TagNumber(8)
  void clearLog2MaxFrameNumMinus4() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get picOrderCntType => $_getIZ(8);
  @$pb.TagNumber(9)
  set picOrderCntType($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPicOrderCntType() => $_has(8);
  @$pb.TagNumber(9)
  void clearPicOrderCntType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get deltaPicOrderAlwaysZeroFlag => $_getIZ(9);
  @$pb.TagNumber(10)
  set deltaPicOrderAlwaysZeroFlag($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDeltaPicOrderAlwaysZeroFlag() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeltaPicOrderAlwaysZeroFlag() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get numRefFramesInPicOrderCntCycle => $_getIZ(10);
  @$pb.TagNumber(11)
  set numRefFramesInPicOrderCntCycle($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNumRefFramesInPicOrderCntCycle() => $_has(10);
  @$pb.TagNumber(11)
  void clearNumRefFramesInPicOrderCntCycle() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get offsetForRefFrame => $_getList(11);

  @$pb.TagNumber(13)
  $core.int get log2MaxPicOrderCntLsbMinus4 => $_getIZ(12);
  @$pb.TagNumber(13)
  set log2MaxPicOrderCntLsbMinus4($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLog2MaxPicOrderCntLsbMinus4() => $_has(12);
  @$pb.TagNumber(13)
  void clearLog2MaxPicOrderCntLsbMinus4() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get maxNumRefFrames => $_getIZ(13);
  @$pb.TagNumber(14)
  set maxNumRefFrames($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMaxNumRefFrames() => $_has(13);
  @$pb.TagNumber(14)
  void clearMaxNumRefFrames() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get picWidthInMbsMinus1 => $_getIZ(14);
  @$pb.TagNumber(15)
  set picWidthInMbsMinus1($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPicWidthInMbsMinus1() => $_has(14);
  @$pb.TagNumber(15)
  void clearPicWidthInMbsMinus1() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get picHeightInMapUnitsMinus1 => $_getIZ(15);
  @$pb.TagNumber(16)
  set picHeightInMapUnitsMinus1($core.int v) { $_setSignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasPicHeightInMapUnitsMinus1() => $_has(15);
  @$pb.TagNumber(16)
  void clearPicHeightInMapUnitsMinus1() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get frameMbsOnlyFlag => $_getIZ(16);
  @$pb.TagNumber(17)
  set frameMbsOnlyFlag($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasFrameMbsOnlyFlag() => $_has(16);
  @$pb.TagNumber(17)
  void clearFrameMbsOnlyFlag() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get mbAdaptiveFrameFieldFlag => $_getIZ(17);
  @$pb.TagNumber(18)
  set mbAdaptiveFrameFieldFlag($core.int v) { $_setSignedInt32(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasMbAdaptiveFrameFieldFlag() => $_has(17);
  @$pb.TagNumber(18)
  void clearMbAdaptiveFrameFieldFlag() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get frameCroppingFlag => $_getIZ(18);
  @$pb.TagNumber(19)
  set frameCroppingFlag($core.int v) { $_setSignedInt32(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasFrameCroppingFlag() => $_has(18);
  @$pb.TagNumber(19)
  void clearFrameCroppingFlag() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get separateColourPlaneFlag => $_getIZ(19);
  @$pb.TagNumber(20)
  set separateColourPlaneFlag($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSeparateColourPlaneFlag() => $_has(19);
  @$pb.TagNumber(20)
  void clearSeparateColourPlaneFlag() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get offsetForNonRefPic => $_getIZ(20);
  @$pb.TagNumber(21)
  set offsetForNonRefPic($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasOffsetForNonRefPic() => $_has(20);
  @$pb.TagNumber(21)
  void clearOffsetForNonRefPic() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get offsetForTopToBottomField => $_getIZ(21);
  @$pb.TagNumber(22)
  set offsetForTopToBottomField($core.int v) { $_setSignedInt32(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasOffsetForTopToBottomField() => $_has(21);
  @$pb.TagNumber(22)
  void clearOffsetForTopToBottomField() => clearField(22);
}

class MALAVCPPS extends $pb.GeneratedMessage {
  factory MALAVCPPS({
    MALAVCNal? base,
    $core.int? picParameterSetId,
    $core.int? seqParameterSetId,
    $core.int? entropyCodingModeFlag,
    $core.int? bottomFieldPicOrderInFramePresentFlag,
    $core.int? redundantPicCntPresentFlag,
    $core.int? weightedPredFlag,
    $core.int? weightedBipredIdc,
    $core.int? deblockingFilterControlPresentFlag,
    $core.int? numSliceGroupsMinus1,
    $core.int? sliceGroupMapType,
    $core.int? sliceGroupChangeRateMinus1,
    $core.int? picSizeInMapUnitsMinus1,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (picParameterSetId != null) {
      $result.picParameterSetId = picParameterSetId;
    }
    if (seqParameterSetId != null) {
      $result.seqParameterSetId = seqParameterSetId;
    }
    if (entropyCodingModeFlag != null) {
      $result.entropyCodingModeFlag = entropyCodingModeFlag;
    }
    if (bottomFieldPicOrderInFramePresentFlag != null) {
      $result.bottomFieldPicOrderInFramePresentFlag = bottomFieldPicOrderInFramePresentFlag;
    }
    if (redundantPicCntPresentFlag != null) {
      $result.redundantPicCntPresentFlag = redundantPicCntPresentFlag;
    }
    if (weightedPredFlag != null) {
      $result.weightedPredFlag = weightedPredFlag;
    }
    if (weightedBipredIdc != null) {
      $result.weightedBipredIdc = weightedBipredIdc;
    }
    if (deblockingFilterControlPresentFlag != null) {
      $result.deblockingFilterControlPresentFlag = deblockingFilterControlPresentFlag;
    }
    if (numSliceGroupsMinus1 != null) {
      $result.numSliceGroupsMinus1 = numSliceGroupsMinus1;
    }
    if (sliceGroupMapType != null) {
      $result.sliceGroupMapType = sliceGroupMapType;
    }
    if (sliceGroupChangeRateMinus1 != null) {
      $result.sliceGroupChangeRateMinus1 = sliceGroupChangeRateMinus1;
    }
    if (picSizeInMapUnitsMinus1 != null) {
      $result.picSizeInMapUnitsMinus1 = picSizeInMapUnitsMinus1;
    }
    return $result;
  }
  MALAVCPPS._() : super();
  factory MALAVCPPS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCPPS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCPPS', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALAVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALAVCNal.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'picParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'seqParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'entropyCodingModeFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'bottomFieldPicOrderInFramePresentFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'redundantPicCntPresentFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'weightedPredFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'weightedBipredIdc', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'deblockingFilterControlPresentFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'numSliceGroupsMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'sliceGroupMapType', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'sliceGroupChangeRateMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'picSizeInMapUnitsMinus1', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCPPS clone() => MALAVCPPS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCPPS copyWith(void Function(MALAVCPPS) updates) => super.copyWith((message) => updates(message as MALAVCPPS)) as MALAVCPPS;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCPPS create() => MALAVCPPS._();
  MALAVCPPS createEmptyInstance() => create();
  static $pb.PbList<MALAVCPPS> createRepeated() => $pb.PbList<MALAVCPPS>();
  @$core.pragma('dart2js:noInline')
  static MALAVCPPS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCPPS>(create);
  static MALAVCPPS? _defaultInstance;

  @$pb.TagNumber(1)
  MALAVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALAVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALAVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get picParameterSetId => $_getIZ(1);
  @$pb.TagNumber(2)
  set picParameterSetId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPicParameterSetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPicParameterSetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get seqParameterSetId => $_getIZ(2);
  @$pb.TagNumber(3)
  set seqParameterSetId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeqParameterSetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeqParameterSetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get entropyCodingModeFlag => $_getIZ(3);
  @$pb.TagNumber(4)
  set entropyCodingModeFlag($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEntropyCodingModeFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearEntropyCodingModeFlag() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get bottomFieldPicOrderInFramePresentFlag => $_getIZ(4);
  @$pb.TagNumber(5)
  set bottomFieldPicOrderInFramePresentFlag($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBottomFieldPicOrderInFramePresentFlag() => $_has(4);
  @$pb.TagNumber(5)
  void clearBottomFieldPicOrderInFramePresentFlag() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get redundantPicCntPresentFlag => $_getIZ(5);
  @$pb.TagNumber(6)
  set redundantPicCntPresentFlag($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRedundantPicCntPresentFlag() => $_has(5);
  @$pb.TagNumber(6)
  void clearRedundantPicCntPresentFlag() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get weightedPredFlag => $_getIZ(6);
  @$pb.TagNumber(7)
  set weightedPredFlag($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWeightedPredFlag() => $_has(6);
  @$pb.TagNumber(7)
  void clearWeightedPredFlag() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get weightedBipredIdc => $_getIZ(7);
  @$pb.TagNumber(8)
  set weightedBipredIdc($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWeightedBipredIdc() => $_has(7);
  @$pb.TagNumber(8)
  void clearWeightedBipredIdc() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get deblockingFilterControlPresentFlag => $_getIZ(8);
  @$pb.TagNumber(9)
  set deblockingFilterControlPresentFlag($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDeblockingFilterControlPresentFlag() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeblockingFilterControlPresentFlag() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get numSliceGroupsMinus1 => $_getIZ(9);
  @$pb.TagNumber(10)
  set numSliceGroupsMinus1($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNumSliceGroupsMinus1() => $_has(9);
  @$pb.TagNumber(10)
  void clearNumSliceGroupsMinus1() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get sliceGroupMapType => $_getIZ(10);
  @$pb.TagNumber(11)
  set sliceGroupMapType($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSliceGroupMapType() => $_has(10);
  @$pb.TagNumber(11)
  void clearSliceGroupMapType() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get sliceGroupChangeRateMinus1 => $_getIZ(11);
  @$pb.TagNumber(12)
  set sliceGroupChangeRateMinus1($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSliceGroupChangeRateMinus1() => $_has(11);
  @$pb.TagNumber(12)
  void clearSliceGroupChangeRateMinus1() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get picSizeInMapUnitsMinus1 => $_getIZ(12);
  @$pb.TagNumber(13)
  set picSizeInMapUnitsMinus1($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPicSizeInMapUnitsMinus1() => $_has(12);
  @$pb.TagNumber(13)
  void clearPicSizeInMapUnitsMinus1() => clearField(13);
}

class MALAVCSliceHeader extends $pb.GeneratedMessage {
  factory MALAVCSliceHeader({
    $core.int? firstMbInSlice,
    $core.int? sliceType,
    $core.int? colourPlaneId,
    $core.int? picParameterSetId,
    $core.int? frameNum,
    $core.int? fieldPicFlag,
    $core.int? bottomFieldFlag,
    $core.int? idrPicId,
    $core.int? picOrderCntLsb,
    $core.int? deltaPicOrderCntBottom,
    $core.Iterable<$core.int>? deltaPicOrderCnt,
    $core.int? sliceQpDelta,
    $core.int? numRefIdxActiveOverrideFlag,
    $core.int? numRefIdxL0ActiveMinus1,
    $core.int? numRefIdxL1ActiveMinus1,
    $core.int? memoryManagementControlOperation,
  }) {
    final $result = create();
    if (firstMbInSlice != null) {
      $result.firstMbInSlice = firstMbInSlice;
    }
    if (sliceType != null) {
      $result.sliceType = sliceType;
    }
    if (colourPlaneId != null) {
      $result.colourPlaneId = colourPlaneId;
    }
    if (picParameterSetId != null) {
      $result.picParameterSetId = picParameterSetId;
    }
    if (frameNum != null) {
      $result.frameNum = frameNum;
    }
    if (fieldPicFlag != null) {
      $result.fieldPicFlag = fieldPicFlag;
    }
    if (bottomFieldFlag != null) {
      $result.bottomFieldFlag = bottomFieldFlag;
    }
    if (idrPicId != null) {
      $result.idrPicId = idrPicId;
    }
    if (picOrderCntLsb != null) {
      $result.picOrderCntLsb = picOrderCntLsb;
    }
    if (deltaPicOrderCntBottom != null) {
      $result.deltaPicOrderCntBottom = deltaPicOrderCntBottom;
    }
    if (deltaPicOrderCnt != null) {
      $result.deltaPicOrderCnt.addAll(deltaPicOrderCnt);
    }
    if (sliceQpDelta != null) {
      $result.sliceQpDelta = sliceQpDelta;
    }
    if (numRefIdxActiveOverrideFlag != null) {
      $result.numRefIdxActiveOverrideFlag = numRefIdxActiveOverrideFlag;
    }
    if (numRefIdxL0ActiveMinus1 != null) {
      $result.numRefIdxL0ActiveMinus1 = numRefIdxL0ActiveMinus1;
    }
    if (numRefIdxL1ActiveMinus1 != null) {
      $result.numRefIdxL1ActiveMinus1 = numRefIdxL1ActiveMinus1;
    }
    if (memoryManagementControlOperation != null) {
      $result.memoryManagementControlOperation = memoryManagementControlOperation;
    }
    return $result;
  }
  MALAVCSliceHeader._() : super();
  factory MALAVCSliceHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCSliceHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCSliceHeader', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'firstMbInSlice', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'sliceType', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'colourPlaneId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'picParameterSetId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'frameNum', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'fieldPicFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'bottomFieldFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'idrPicId', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'picOrderCntLsb', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'deltaPicOrderCntBottom', $pb.PbFieldType.O3)
    ..p<$core.int>(11, _omitFieldNames ? '' : 'deltaPicOrderCnt', $pb.PbFieldType.K3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'sliceQpDelta', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'numRefIdxActiveOverrideFlag', $pb.PbFieldType.O3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'numRefIdxL0ActiveMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(15, _omitFieldNames ? '' : 'numRefIdxL1ActiveMinus1', $pb.PbFieldType.O3)
    ..a<$core.int>(16, _omitFieldNames ? '' : 'memoryManagementControlOperation', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCSliceHeader clone() => MALAVCSliceHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCSliceHeader copyWith(void Function(MALAVCSliceHeader) updates) => super.copyWith((message) => updates(message as MALAVCSliceHeader)) as MALAVCSliceHeader;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCSliceHeader create() => MALAVCSliceHeader._();
  MALAVCSliceHeader createEmptyInstance() => create();
  static $pb.PbList<MALAVCSliceHeader> createRepeated() => $pb.PbList<MALAVCSliceHeader>();
  @$core.pragma('dart2js:noInline')
  static MALAVCSliceHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCSliceHeader>(create);
  static MALAVCSliceHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get firstMbInSlice => $_getIZ(0);
  @$pb.TagNumber(1)
  set firstMbInSlice($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstMbInSlice() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstMbInSlice() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get sliceType => $_getIZ(1);
  @$pb.TagNumber(2)
  set sliceType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSliceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSliceType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get colourPlaneId => $_getIZ(2);
  @$pb.TagNumber(3)
  set colourPlaneId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasColourPlaneId() => $_has(2);
  @$pb.TagNumber(3)
  void clearColourPlaneId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get picParameterSetId => $_getIZ(3);
  @$pb.TagNumber(4)
  set picParameterSetId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPicParameterSetId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPicParameterSetId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get frameNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set frameNum($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFrameNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrameNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get fieldPicFlag => $_getIZ(5);
  @$pb.TagNumber(6)
  set fieldPicFlag($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFieldPicFlag() => $_has(5);
  @$pb.TagNumber(6)
  void clearFieldPicFlag() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get bottomFieldFlag => $_getIZ(6);
  @$pb.TagNumber(7)
  set bottomFieldFlag($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBottomFieldFlag() => $_has(6);
  @$pb.TagNumber(7)
  void clearBottomFieldFlag() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get idrPicId => $_getIZ(7);
  @$pb.TagNumber(8)
  set idrPicId($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIdrPicId() => $_has(7);
  @$pb.TagNumber(8)
  void clearIdrPicId() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get picOrderCntLsb => $_getIZ(8);
  @$pb.TagNumber(9)
  set picOrderCntLsb($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPicOrderCntLsb() => $_has(8);
  @$pb.TagNumber(9)
  void clearPicOrderCntLsb() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get deltaPicOrderCntBottom => $_getIZ(9);
  @$pb.TagNumber(10)
  set deltaPicOrderCntBottom($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDeltaPicOrderCntBottom() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeltaPicOrderCntBottom() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get deltaPicOrderCnt => $_getList(10);

  @$pb.TagNumber(12)
  $core.int get sliceQpDelta => $_getIZ(11);
  @$pb.TagNumber(12)
  set sliceQpDelta($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSliceQpDelta() => $_has(11);
  @$pb.TagNumber(12)
  void clearSliceQpDelta() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get numRefIdxActiveOverrideFlag => $_getIZ(12);
  @$pb.TagNumber(13)
  set numRefIdxActiveOverrideFlag($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNumRefIdxActiveOverrideFlag() => $_has(12);
  @$pb.TagNumber(13)
  void clearNumRefIdxActiveOverrideFlag() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get numRefIdxL0ActiveMinus1 => $_getIZ(13);
  @$pb.TagNumber(14)
  set numRefIdxL0ActiveMinus1($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNumRefIdxL0ActiveMinus1() => $_has(13);
  @$pb.TagNumber(14)
  void clearNumRefIdxL0ActiveMinus1() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get numRefIdxL1ActiveMinus1 => $_getIZ(14);
  @$pb.TagNumber(15)
  set numRefIdxL1ActiveMinus1($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasNumRefIdxL1ActiveMinus1() => $_has(14);
  @$pb.TagNumber(15)
  void clearNumRefIdxL1ActiveMinus1() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get memoryManagementControlOperation => $_getIZ(15);
  @$pb.TagNumber(16)
  set memoryManagementControlOperation($core.int v) { $_setSignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasMemoryManagementControlOperation() => $_has(15);
  @$pb.TagNumber(16)
  void clearMemoryManagementControlOperation() => clearField(16);
}

class MALAVCSliceWithOutPartitioning extends $pb.GeneratedMessage {
  factory MALAVCSliceWithOutPartitioning({
    MALAVCNal? base,
    MALAVCSliceHeader? header,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (header != null) {
      $result.header = header;
    }
    return $result;
  }
  MALAVCSliceWithOutPartitioning._() : super();
  factory MALAVCSliceWithOutPartitioning.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCSliceWithOutPartitioning.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCSliceWithOutPartitioning', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALAVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALAVCNal.create)
    ..aOM<MALAVCSliceHeader>(2, _omitFieldNames ? '' : 'header', subBuilder: MALAVCSliceHeader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCSliceWithOutPartitioning clone() => MALAVCSliceWithOutPartitioning()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCSliceWithOutPartitioning copyWith(void Function(MALAVCSliceWithOutPartitioning) updates) => super.copyWith((message) => updates(message as MALAVCSliceWithOutPartitioning)) as MALAVCSliceWithOutPartitioning;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCSliceWithOutPartitioning create() => MALAVCSliceWithOutPartitioning._();
  MALAVCSliceWithOutPartitioning createEmptyInstance() => create();
  static $pb.PbList<MALAVCSliceWithOutPartitioning> createRepeated() => $pb.PbList<MALAVCSliceWithOutPartitioning>();
  @$core.pragma('dart2js:noInline')
  static MALAVCSliceWithOutPartitioning getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCSliceWithOutPartitioning>(create);
  static MALAVCSliceWithOutPartitioning? _defaultInstance;

  @$pb.TagNumber(1)
  MALAVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALAVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALAVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  MALAVCSliceHeader get header => $_getN(1);
  @$pb.TagNumber(2)
  set header(MALAVCSliceHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
  @$pb.TagNumber(2)
  MALAVCSliceHeader ensureHeader() => $_ensure(1);
}

class MALAVCSlicePartitionA extends $pb.GeneratedMessage {
  factory MALAVCSlicePartitionA({
    MALAVCNal? base,
    MALAVCSliceHeader? header,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (header != null) {
      $result.header = header;
    }
    return $result;
  }
  MALAVCSlicePartitionA._() : super();
  factory MALAVCSlicePartitionA.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCSlicePartitionA.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCSlicePartitionA', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALAVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALAVCNal.create)
    ..aOM<MALAVCSliceHeader>(2, _omitFieldNames ? '' : 'header', subBuilder: MALAVCSliceHeader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCSlicePartitionA clone() => MALAVCSlicePartitionA()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCSlicePartitionA copyWith(void Function(MALAVCSlicePartitionA) updates) => super.copyWith((message) => updates(message as MALAVCSlicePartitionA)) as MALAVCSlicePartitionA;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCSlicePartitionA create() => MALAVCSlicePartitionA._();
  MALAVCSlicePartitionA createEmptyInstance() => create();
  static $pb.PbList<MALAVCSlicePartitionA> createRepeated() => $pb.PbList<MALAVCSlicePartitionA>();
  @$core.pragma('dart2js:noInline')
  static MALAVCSlicePartitionA getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCSlicePartitionA>(create);
  static MALAVCSlicePartitionA? _defaultInstance;

  @$pb.TagNumber(1)
  MALAVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALAVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALAVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  MALAVCSliceHeader get header => $_getN(1);
  @$pb.TagNumber(2)
  set header(MALAVCSliceHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
  @$pb.TagNumber(2)
  MALAVCSliceHeader ensureHeader() => $_ensure(1);
}

class MALAVCSEI extends $pb.GeneratedMessage {
  factory MALAVCSEI({
    MALAVCNal? base,
    $core.Iterable<MALSEIMessage>? messageList,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (messageList != null) {
      $result.messageList.addAll(messageList);
    }
    return $result;
  }
  MALAVCSEI._() : super();
  factory MALAVCSEI.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCSEI.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCSEI', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALAVCNal>(1, _omitFieldNames ? '' : 'base', subBuilder: MALAVCNal.create)
    ..pc<MALSEIMessage>(2, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM, protoName: 'messageList', subBuilder: MALSEIMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCSEI clone() => MALAVCSEI()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCSEI copyWith(void Function(MALAVCSEI) updates) => super.copyWith((message) => updates(message as MALAVCSEI)) as MALAVCSEI;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCSEI create() => MALAVCSEI._();
  MALAVCSEI createEmptyInstance() => create();
  static $pb.PbList<MALAVCSEI> createRepeated() => $pb.PbList<MALAVCSEI>();
  @$core.pragma('dart2js:noInline')
  static MALAVCSEI getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCSEI>(create);
  static MALAVCSEI? _defaultInstance;

  @$pb.TagNumber(1)
  MALAVCNal get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(MALAVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  MALAVCNal ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<MALSEIMessage> get messageList => $_getList(1);
}

class MALPSCell extends $pb.GeneratedMessage {
  factory MALPSCell({
    $core.bool? enable,
    $core.String? val,
  }) {
    final $result = create();
    if (enable != null) {
      $result.enable = enable;
    }
    if (val != null) {
      $result.val = val;
    }
    return $result;
  }
  MALPSCell._() : super();
  factory MALPSCell.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALPSCell.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALPSCell', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enable')
    ..aOS(2, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALPSCell clone() => MALPSCell()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALPSCell copyWith(void Function(MALPSCell) updates) => super.copyWith((message) => updates(message as MALPSCell)) as MALPSCell;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALPSCell create() => MALPSCell._();
  MALPSCell createEmptyInstance() => create();
  static $pb.PbList<MALPSCell> createRepeated() => $pb.PbList<MALPSCell>();
  @$core.pragma('dart2js:noInline')
  static MALPSCell getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALPSCell>(create);
  static MALPSCell? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enable => $_getBF(0);
  @$pb.TagNumber(1)
  set enable($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get val => $_getSZ(1);
  @$pb.TagNumber(2)
  set val($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class MALPSItem extends $pb.GeneratedMessage {
  factory MALPSItem({
    $core.Iterable<MALPSItem>? childs,
    $core.Iterable<MALPSCell>? cells,
  }) {
    final $result = create();
    if (childs != null) {
      $result.childs.addAll(childs);
    }
    if (cells != null) {
      $result.cells.addAll(cells);
    }
    return $result;
  }
  MALPSItem._() : super();
  factory MALPSItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALPSItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALPSItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..pc<MALPSItem>(1, _omitFieldNames ? '' : 'childs', $pb.PbFieldType.PM, subBuilder: MALPSItem.create)
    ..pc<MALPSCell>(2, _omitFieldNames ? '' : 'cells', $pb.PbFieldType.PM, subBuilder: MALPSCell.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALPSItem clone() => MALPSItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALPSItem copyWith(void Function(MALPSItem) updates) => super.copyWith((message) => updates(message as MALPSItem)) as MALPSItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALPSItem create() => MALPSItem._();
  MALPSItem createEmptyInstance() => create();
  static $pb.PbList<MALPSItem> createRepeated() => $pb.PbList<MALPSItem>();
  @$core.pragma('dart2js:noInline')
  static MALPSItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALPSItem>(create);
  static MALPSItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MALPSItem> get childs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<MALPSCell> get cells => $_getList(1);
}

enum MALPacketNal_Nal {
  hevcNal, 
  hevcVps, 
  hevcSps, 
  hevcPps, 
  hevcSei, 
  hevcRbsp, 
  avcNal, 
  avcSps, 
  avcPps, 
  avcOutRbsp, 
  avcPartARbsp, 
  avcSei, 
  notSet
}

class MALPacketNal extends $pb.GeneratedMessage {
  factory MALPacketNal({
    MALHEVCNal? hevcNal,
    MALHEVCVPS? hevcVps,
    MALHEVCSPS? hevcSps,
    MALHEVCPPS? hevcPps,
    MALHEVCSEI? hevcSei,
    MALHEVCSliceSegmentLayerRbsp? hevcRbsp,
    MALAVCNal? avcNal,
    MALAVCSPS? avcSps,
    MALAVCPPS? avcPps,
    MALAVCSliceWithOutPartitioning? avcOutRbsp,
    MALAVCSlicePartitionA? avcPartARbsp,
    MALAVCSEI? avcSei,
    $core.Iterable<$0.MALAtomField>? displayFields,
  }) {
    final $result = create();
    if (hevcNal != null) {
      $result.hevcNal = hevcNal;
    }
    if (hevcVps != null) {
      $result.hevcVps = hevcVps;
    }
    if (hevcSps != null) {
      $result.hevcSps = hevcSps;
    }
    if (hevcPps != null) {
      $result.hevcPps = hevcPps;
    }
    if (hevcSei != null) {
      $result.hevcSei = hevcSei;
    }
    if (hevcRbsp != null) {
      $result.hevcRbsp = hevcRbsp;
    }
    if (avcNal != null) {
      $result.avcNal = avcNal;
    }
    if (avcSps != null) {
      $result.avcSps = avcSps;
    }
    if (avcPps != null) {
      $result.avcPps = avcPps;
    }
    if (avcOutRbsp != null) {
      $result.avcOutRbsp = avcOutRbsp;
    }
    if (avcPartARbsp != null) {
      $result.avcPartARbsp = avcPartARbsp;
    }
    if (avcSei != null) {
      $result.avcSei = avcSei;
    }
    if (displayFields != null) {
      $result.displayFields.addAll(displayFields);
    }
    return $result;
  }
  MALPacketNal._() : super();
  factory MALPacketNal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALPacketNal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MALPacketNal_Nal> _MALPacketNal_NalByTag = {
    1 : MALPacketNal_Nal.hevcNal,
    2 : MALPacketNal_Nal.hevcVps,
    3 : MALPacketNal_Nal.hevcSps,
    4 : MALPacketNal_Nal.hevcPps,
    5 : MALPacketNal_Nal.hevcSei,
    6 : MALPacketNal_Nal.hevcRbsp,
    7 : MALPacketNal_Nal.avcNal,
    8 : MALPacketNal_Nal.avcSps,
    9 : MALPacketNal_Nal.avcPps,
    10 : MALPacketNal_Nal.avcOutRbsp,
    11 : MALPacketNal_Nal.avcPartARbsp,
    12 : MALPacketNal_Nal.avcSei,
    0 : MALPacketNal_Nal.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALPacketNal', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    ..aOM<MALHEVCNal>(1, _omitFieldNames ? '' : 'hevcNal', subBuilder: MALHEVCNal.create)
    ..aOM<MALHEVCVPS>(2, _omitFieldNames ? '' : 'hevcVps', subBuilder: MALHEVCVPS.create)
    ..aOM<MALHEVCSPS>(3, _omitFieldNames ? '' : 'hevcSps', subBuilder: MALHEVCSPS.create)
    ..aOM<MALHEVCPPS>(4, _omitFieldNames ? '' : 'hevcPps', subBuilder: MALHEVCPPS.create)
    ..aOM<MALHEVCSEI>(5, _omitFieldNames ? '' : 'hevcSei', subBuilder: MALHEVCSEI.create)
    ..aOM<MALHEVCSliceSegmentLayerRbsp>(6, _omitFieldNames ? '' : 'hevcRbsp', subBuilder: MALHEVCSliceSegmentLayerRbsp.create)
    ..aOM<MALAVCNal>(7, _omitFieldNames ? '' : 'avcNal', subBuilder: MALAVCNal.create)
    ..aOM<MALAVCSPS>(8, _omitFieldNames ? '' : 'avcSps', subBuilder: MALAVCSPS.create)
    ..aOM<MALAVCPPS>(9, _omitFieldNames ? '' : 'avcPps', subBuilder: MALAVCPPS.create)
    ..aOM<MALAVCSliceWithOutPartitioning>(10, _omitFieldNames ? '' : 'avcOutRbsp', subBuilder: MALAVCSliceWithOutPartitioning.create)
    ..aOM<MALAVCSlicePartitionA>(11, _omitFieldNames ? '' : 'avcPartARbsp', subBuilder: MALAVCSlicePartitionA.create)
    ..aOM<MALAVCSEI>(12, _omitFieldNames ? '' : 'avcSei', subBuilder: MALAVCSEI.create)
    ..pc<$0.MALAtomField>(13, _omitFieldNames ? '' : 'displayFields', $pb.PbFieldType.PM, subBuilder: $0.MALAtomField.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALPacketNal clone() => MALPacketNal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALPacketNal copyWith(void Function(MALPacketNal) updates) => super.copyWith((message) => updates(message as MALPacketNal)) as MALPacketNal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALPacketNal create() => MALPacketNal._();
  MALPacketNal createEmptyInstance() => create();
  static $pb.PbList<MALPacketNal> createRepeated() => $pb.PbList<MALPacketNal>();
  @$core.pragma('dart2js:noInline')
  static MALPacketNal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALPacketNal>(create);
  static MALPacketNal? _defaultInstance;

  MALPacketNal_Nal whichNal() => _MALPacketNal_NalByTag[$_whichOneof(0)]!;
  void clearNal() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MALHEVCNal get hevcNal => $_getN(0);
  @$pb.TagNumber(1)
  set hevcNal(MALHEVCNal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHevcNal() => $_has(0);
  @$pb.TagNumber(1)
  void clearHevcNal() => clearField(1);
  @$pb.TagNumber(1)
  MALHEVCNal ensureHevcNal() => $_ensure(0);

  @$pb.TagNumber(2)
  MALHEVCVPS get hevcVps => $_getN(1);
  @$pb.TagNumber(2)
  set hevcVps(MALHEVCVPS v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHevcVps() => $_has(1);
  @$pb.TagNumber(2)
  void clearHevcVps() => clearField(2);
  @$pb.TagNumber(2)
  MALHEVCVPS ensureHevcVps() => $_ensure(1);

  @$pb.TagNumber(3)
  MALHEVCSPS get hevcSps => $_getN(2);
  @$pb.TagNumber(3)
  set hevcSps(MALHEVCSPS v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasHevcSps() => $_has(2);
  @$pb.TagNumber(3)
  void clearHevcSps() => clearField(3);
  @$pb.TagNumber(3)
  MALHEVCSPS ensureHevcSps() => $_ensure(2);

  @$pb.TagNumber(4)
  MALHEVCPPS get hevcPps => $_getN(3);
  @$pb.TagNumber(4)
  set hevcPps(MALHEVCPPS v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHevcPps() => $_has(3);
  @$pb.TagNumber(4)
  void clearHevcPps() => clearField(4);
  @$pb.TagNumber(4)
  MALHEVCPPS ensureHevcPps() => $_ensure(3);

  @$pb.TagNumber(5)
  MALHEVCSEI get hevcSei => $_getN(4);
  @$pb.TagNumber(5)
  set hevcSei(MALHEVCSEI v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasHevcSei() => $_has(4);
  @$pb.TagNumber(5)
  void clearHevcSei() => clearField(5);
  @$pb.TagNumber(5)
  MALHEVCSEI ensureHevcSei() => $_ensure(4);

  @$pb.TagNumber(6)
  MALHEVCSliceSegmentLayerRbsp get hevcRbsp => $_getN(5);
  @$pb.TagNumber(6)
  set hevcRbsp(MALHEVCSliceSegmentLayerRbsp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasHevcRbsp() => $_has(5);
  @$pb.TagNumber(6)
  void clearHevcRbsp() => clearField(6);
  @$pb.TagNumber(6)
  MALHEVCSliceSegmentLayerRbsp ensureHevcRbsp() => $_ensure(5);

  @$pb.TagNumber(7)
  MALAVCNal get avcNal => $_getN(6);
  @$pb.TagNumber(7)
  set avcNal(MALAVCNal v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvcNal() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvcNal() => clearField(7);
  @$pb.TagNumber(7)
  MALAVCNal ensureAvcNal() => $_ensure(6);

  @$pb.TagNumber(8)
  MALAVCSPS get avcSps => $_getN(7);
  @$pb.TagNumber(8)
  set avcSps(MALAVCSPS v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAvcSps() => $_has(7);
  @$pb.TagNumber(8)
  void clearAvcSps() => clearField(8);
  @$pb.TagNumber(8)
  MALAVCSPS ensureAvcSps() => $_ensure(7);

  @$pb.TagNumber(9)
  MALAVCPPS get avcPps => $_getN(8);
  @$pb.TagNumber(9)
  set avcPps(MALAVCPPS v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAvcPps() => $_has(8);
  @$pb.TagNumber(9)
  void clearAvcPps() => clearField(9);
  @$pb.TagNumber(9)
  MALAVCPPS ensureAvcPps() => $_ensure(8);

  @$pb.TagNumber(10)
  MALAVCSliceWithOutPartitioning get avcOutRbsp => $_getN(9);
  @$pb.TagNumber(10)
  set avcOutRbsp(MALAVCSliceWithOutPartitioning v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvcOutRbsp() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvcOutRbsp() => clearField(10);
  @$pb.TagNumber(10)
  MALAVCSliceWithOutPartitioning ensureAvcOutRbsp() => $_ensure(9);

  @$pb.TagNumber(11)
  MALAVCSlicePartitionA get avcPartARbsp => $_getN(10);
  @$pb.TagNumber(11)
  set avcPartARbsp(MALAVCSlicePartitionA v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAvcPartARbsp() => $_has(10);
  @$pb.TagNumber(11)
  void clearAvcPartARbsp() => clearField(11);
  @$pb.TagNumber(11)
  MALAVCSlicePartitionA ensureAvcPartARbsp() => $_ensure(10);

  @$pb.TagNumber(12)
  MALAVCSEI get avcSei => $_getN(11);
  @$pb.TagNumber(12)
  set avcSei(MALAVCSEI v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasAvcSei() => $_has(11);
  @$pb.TagNumber(12)
  void clearAvcSei() => clearField(12);
  @$pb.TagNumber(12)
  MALAVCSEI ensureAvcSei() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.List<$0.MALAtomField> get displayFields => $_getList(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
