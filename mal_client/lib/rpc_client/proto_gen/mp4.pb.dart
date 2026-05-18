//
//  Generated code. Do not modify.
//  source: mp4.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'nal.pb.dart' as $1;
import 'stream.pb.dart' as $2;

/// MP4 Specific
class MALMP4Mvhd extends $pb.GeneratedMessage {
  factory MALMP4Mvhd({
    $fixnum.Int64? timescale,
    $fixnum.Int64? duration,
    $fixnum.Int64? matrix,
  }) {
    final $result = create();
    if (timescale != null) {
      $result.timescale = timescale;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (matrix != null) {
      $result.matrix = matrix;
    }
    return $result;
  }
  MALMP4Mvhd._() : super();
  factory MALMP4Mvhd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALMP4Mvhd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALMP4Mvhd', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timescale')
    ..aInt64(2, _omitFieldNames ? '' : 'duration')
    ..aInt64(3, _omitFieldNames ? '' : 'matrix')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALMP4Mvhd clone() => MALMP4Mvhd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALMP4Mvhd copyWith(void Function(MALMP4Mvhd) updates) => super.copyWith((message) => updates(message as MALMP4Mvhd)) as MALMP4Mvhd;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALMP4Mvhd create() => MALMP4Mvhd._();
  MALMP4Mvhd createEmptyInstance() => create();
  static $pb.PbList<MALMP4Mvhd> createRepeated() => $pb.PbList<MALMP4Mvhd>();
  @$core.pragma('dart2js:noInline')
  static MALMP4Mvhd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALMP4Mvhd>(create);
  static MALMP4Mvhd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timescale => $_getI64(0);
  @$pb.TagNumber(1)
  set timescale($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimescale() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimescale() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get matrix => $_getI64(2);
  @$pb.TagNumber(3)
  set matrix($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatrix() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatrix() => clearField(3);
}

class MALMp4Priv extends $pb.GeneratedMessage {
  factory MALMp4Priv({
    MALMP4Mvhd? mvhd,
  }) {
    final $result = create();
    if (mvhd != null) {
      $result.mvhd = mvhd;
    }
    return $result;
  }
  MALMp4Priv._() : super();
  factory MALMp4Priv.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALMp4Priv.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALMp4Priv', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALMP4Mvhd>(1, _omitFieldNames ? '' : 'mvhd', subBuilder: MALMP4Mvhd.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALMp4Priv clone() => MALMp4Priv()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALMp4Priv copyWith(void Function(MALMp4Priv) updates) => super.copyWith((message) => updates(message as MALMp4Priv)) as MALMp4Priv;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALMp4Priv create() => MALMp4Priv._();
  MALMp4Priv createEmptyInstance() => create();
  static $pb.PbList<MALMp4Priv> createRepeated() => $pb.PbList<MALMp4Priv>();
  @$core.pragma('dart2js:noInline')
  static MALMp4Priv getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALMp4Priv>(create);
  static MALMp4Priv? _defaultInstance;

  @$pb.TagNumber(1)
  MALMP4Mvhd get mvhd => $_getN(0);
  @$pb.TagNumber(1)
  set mvhd(MALMP4Mvhd v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMvhd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMvhd() => clearField(1);
  @$pb.TagNumber(1)
  MALMP4Mvhd ensureMvhd() => $_ensure(0);
}

class MALMP4Mdhd extends $pb.GeneratedMessage {
  factory MALMP4Mdhd({
    $fixnum.Int64? timescale,
    $fixnum.Int64? duration,
  }) {
    final $result = create();
    if (timescale != null) {
      $result.timescale = timescale;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  MALMP4Mdhd._() : super();
  factory MALMP4Mdhd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALMP4Mdhd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALMP4Mdhd', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timescale')
    ..aInt64(2, _omitFieldNames ? '' : 'duration')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALMP4Mdhd clone() => MALMP4Mdhd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALMP4Mdhd copyWith(void Function(MALMP4Mdhd) updates) => super.copyWith((message) => updates(message as MALMP4Mdhd)) as MALMP4Mdhd;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALMP4Mdhd create() => MALMP4Mdhd._();
  MALMP4Mdhd createEmptyInstance() => create();
  static $pb.PbList<MALMP4Mdhd> createRepeated() => $pb.PbList<MALMP4Mdhd>();
  @$core.pragma('dart2js:noInline')
  static MALMP4Mdhd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALMP4Mdhd>(create);
  static MALMP4Mdhd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timescale => $_getI64(0);
  @$pb.TagNumber(1)
  set timescale($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimescale() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimescale() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);
}

class MALMP4Stream extends $pb.GeneratedMessage {
  factory MALMP4Stream({
    $2.MALStream? base,
    $core.Iterable<$fixnum.Int64>? stss,
    $core.Iterable<StscEntry>? stsc,
    $core.Iterable<$fixnum.Int64>? stsz,
    $core.Iterable<$fixnum.Int64>? stco,
    $core.Iterable<SttsEntry>? stts,
    $core.Iterable<CttsEntry>? ctts,
    $core.Iterable<ElstEntry>? elst,
    MALMP4Mdhd? mdhd,
    MALMP4Tkhd? tkhd,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (stss != null) {
      $result.stss.addAll(stss);
    }
    if (stsc != null) {
      $result.stsc.addAll(stsc);
    }
    if (stsz != null) {
      $result.stsz.addAll(stsz);
    }
    if (stco != null) {
      $result.stco.addAll(stco);
    }
    if (stts != null) {
      $result.stts.addAll(stts);
    }
    if (ctts != null) {
      $result.ctts.addAll(ctts);
    }
    if (elst != null) {
      $result.elst.addAll(elst);
    }
    if (mdhd != null) {
      $result.mdhd = mdhd;
    }
    if (tkhd != null) {
      $result.tkhd = tkhd;
    }
    return $result;
  }
  MALMP4Stream._() : super();
  factory MALMP4Stream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALMP4Stream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALMP4Stream', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<$2.MALStream>(1, _omitFieldNames ? '' : 'base', subBuilder: $2.MALStream.create)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'stss', $pb.PbFieldType.K6)
    ..pc<StscEntry>(3, _omitFieldNames ? '' : 'stsc', $pb.PbFieldType.PM, subBuilder: StscEntry.create)
    ..p<$fixnum.Int64>(4, _omitFieldNames ? '' : 'stsz', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(5, _omitFieldNames ? '' : 'stco', $pb.PbFieldType.K6)
    ..pc<SttsEntry>(6, _omitFieldNames ? '' : 'stts', $pb.PbFieldType.PM, subBuilder: SttsEntry.create)
    ..pc<CttsEntry>(7, _omitFieldNames ? '' : 'ctts', $pb.PbFieldType.PM, subBuilder: CttsEntry.create)
    ..pc<ElstEntry>(8, _omitFieldNames ? '' : 'elst', $pb.PbFieldType.PM, subBuilder: ElstEntry.create)
    ..aOM<MALMP4Mdhd>(9, _omitFieldNames ? '' : 'mdhd', subBuilder: MALMP4Mdhd.create)
    ..aOM<MALMP4Tkhd>(10, _omitFieldNames ? '' : 'tkhd', subBuilder: MALMP4Tkhd.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALMP4Stream clone() => MALMP4Stream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALMP4Stream copyWith(void Function(MALMP4Stream) updates) => super.copyWith((message) => updates(message as MALMP4Stream)) as MALMP4Stream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALMP4Stream create() => MALMP4Stream._();
  MALMP4Stream createEmptyInstance() => create();
  static $pb.PbList<MALMP4Stream> createRepeated() => $pb.PbList<MALMP4Stream>();
  @$core.pragma('dart2js:noInline')
  static MALMP4Stream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALMP4Stream>(create);
  static MALMP4Stream? _defaultInstance;

  @$pb.TagNumber(1)
  $2.MALStream get base => $_getN(0);
  @$pb.TagNumber(1)
  set base($2.MALStream v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  $2.MALStream ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get stss => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<StscEntry> get stsc => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$fixnum.Int64> get stsz => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$fixnum.Int64> get stco => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<SttsEntry> get stts => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<CttsEntry> get ctts => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<ElstEntry> get elst => $_getList(7);

  @$pb.TagNumber(9)
  MALMP4Mdhd get mdhd => $_getN(8);
  @$pb.TagNumber(9)
  set mdhd(MALMP4Mdhd v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasMdhd() => $_has(8);
  @$pb.TagNumber(9)
  void clearMdhd() => clearField(9);
  @$pb.TagNumber(9)
  MALMP4Mdhd ensureMdhd() => $_ensure(8);

  @$pb.TagNumber(10)
  MALMP4Tkhd get tkhd => $_getN(9);
  @$pb.TagNumber(10)
  set tkhd(MALMP4Tkhd v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasTkhd() => $_has(9);
  @$pb.TagNumber(10)
  void clearTkhd() => clearField(10);
  @$pb.TagNumber(10)
  MALMP4Tkhd ensureTkhd() => $_ensure(9);
}

class StscEntry extends $pb.GeneratedMessage {
  factory StscEntry({
    $fixnum.Int64? firstChunk,
    $fixnum.Int64? samplesPerChunk,
    $fixnum.Int64? sampleDescriptionIndex,
  }) {
    final $result = create();
    if (firstChunk != null) {
      $result.firstChunk = firstChunk;
    }
    if (samplesPerChunk != null) {
      $result.samplesPerChunk = samplesPerChunk;
    }
    if (sampleDescriptionIndex != null) {
      $result.sampleDescriptionIndex = sampleDescriptionIndex;
    }
    return $result;
  }
  StscEntry._() : super();
  factory StscEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StscEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StscEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'firstChunk')
    ..aInt64(2, _omitFieldNames ? '' : 'samplesPerChunk')
    ..aInt64(3, _omitFieldNames ? '' : 'sampleDescriptionIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StscEntry clone() => StscEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StscEntry copyWith(void Function(StscEntry) updates) => super.copyWith((message) => updates(message as StscEntry)) as StscEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StscEntry create() => StscEntry._();
  StscEntry createEmptyInstance() => create();
  static $pb.PbList<StscEntry> createRepeated() => $pb.PbList<StscEntry>();
  @$core.pragma('dart2js:noInline')
  static StscEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StscEntry>(create);
  static StscEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get firstChunk => $_getI64(0);
  @$pb.TagNumber(1)
  set firstChunk($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstChunk() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get samplesPerChunk => $_getI64(1);
  @$pb.TagNumber(2)
  set samplesPerChunk($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSamplesPerChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearSamplesPerChunk() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get sampleDescriptionIndex => $_getI64(2);
  @$pb.TagNumber(3)
  set sampleDescriptionIndex($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSampleDescriptionIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSampleDescriptionIndex() => clearField(3);
}

class SttsEntry extends $pb.GeneratedMessage {
  factory SttsEntry({
    $fixnum.Int64? sampleCount,
    $fixnum.Int64? sampleDelta,
  }) {
    final $result = create();
    if (sampleCount != null) {
      $result.sampleCount = sampleCount;
    }
    if (sampleDelta != null) {
      $result.sampleDelta = sampleDelta;
    }
    return $result;
  }
  SttsEntry._() : super();
  factory SttsEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SttsEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SttsEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sampleCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'sampleDelta', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SttsEntry clone() => SttsEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SttsEntry copyWith(void Function(SttsEntry) updates) => super.copyWith((message) => updates(message as SttsEntry)) as SttsEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SttsEntry create() => SttsEntry._();
  SttsEntry createEmptyInstance() => create();
  static $pb.PbList<SttsEntry> createRepeated() => $pb.PbList<SttsEntry>();
  @$core.pragma('dart2js:noInline')
  static SttsEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SttsEntry>(create);
  static SttsEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sampleCount => $_getI64(0);
  @$pb.TagNumber(1)
  set sampleCount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSampleCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSampleCount() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sampleDelta => $_getI64(1);
  @$pb.TagNumber(2)
  set sampleDelta($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSampleDelta() => $_has(1);
  @$pb.TagNumber(2)
  void clearSampleDelta() => clearField(2);
}

class CttsEntry extends $pb.GeneratedMessage {
  factory CttsEntry({
    $fixnum.Int64? sampleCount,
    $fixnum.Int64? sampleOffset,
  }) {
    final $result = create();
    if (sampleCount != null) {
      $result.sampleCount = sampleCount;
    }
    if (sampleOffset != null) {
      $result.sampleOffset = sampleOffset;
    }
    return $result;
  }
  CttsEntry._() : super();
  factory CttsEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CttsEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CttsEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sampleCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'sampleOffset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CttsEntry clone() => CttsEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CttsEntry copyWith(void Function(CttsEntry) updates) => super.copyWith((message) => updates(message as CttsEntry)) as CttsEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CttsEntry create() => CttsEntry._();
  CttsEntry createEmptyInstance() => create();
  static $pb.PbList<CttsEntry> createRepeated() => $pb.PbList<CttsEntry>();
  @$core.pragma('dart2js:noInline')
  static CttsEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CttsEntry>(create);
  static CttsEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sampleCount => $_getI64(0);
  @$pb.TagNumber(1)
  set sampleCount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSampleCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSampleCount() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sampleOffset => $_getI64(1);
  @$pb.TagNumber(2)
  set sampleOffset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSampleOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearSampleOffset() => clearField(2);
}

class ElstEntry extends $pb.GeneratedMessage {
  factory ElstEntry({
    $fixnum.Int64? segmentDuration,
    $fixnum.Int64? mediaTime,
    $fixnum.Int64? mediaRateInteger,
    $fixnum.Int64? mediaRateFraction,
  }) {
    final $result = create();
    if (segmentDuration != null) {
      $result.segmentDuration = segmentDuration;
    }
    if (mediaTime != null) {
      $result.mediaTime = mediaTime;
    }
    if (mediaRateInteger != null) {
      $result.mediaRateInteger = mediaRateInteger;
    }
    if (mediaRateFraction != null) {
      $result.mediaRateFraction = mediaRateFraction;
    }
    return $result;
  }
  ElstEntry._() : super();
  factory ElstEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ElstEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ElstEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'segmentDuration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'mediaTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'mediaRateInteger', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'mediaRateFraction', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ElstEntry clone() => ElstEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ElstEntry copyWith(void Function(ElstEntry) updates) => super.copyWith((message) => updates(message as ElstEntry)) as ElstEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ElstEntry create() => ElstEntry._();
  ElstEntry createEmptyInstance() => create();
  static $pb.PbList<ElstEntry> createRepeated() => $pb.PbList<ElstEntry>();
  @$core.pragma('dart2js:noInline')
  static ElstEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ElstEntry>(create);
  static ElstEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get segmentDuration => $_getI64(0);
  @$pb.TagNumber(1)
  set segmentDuration($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSegmentDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearSegmentDuration() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mediaTime => $_getI64(1);
  @$pb.TagNumber(2)
  set mediaTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMediaTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediaTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get mediaRateInteger => $_getI64(2);
  @$pb.TagNumber(3)
  set mediaRateInteger($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMediaRateInteger() => $_has(2);
  @$pb.TagNumber(3)
  void clearMediaRateInteger() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mediaRateFraction => $_getI64(3);
  @$pb.TagNumber(4)
  set mediaRateFraction($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaRateFraction() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaRateFraction() => clearField(4);
}

class MALMP4Tkhd extends $pb.GeneratedMessage {
  factory MALMP4Tkhd({
    $fixnum.Int64? trackID,
    $fixnum.Int64? duration,
    $fixnum.Int64? matrix,
    $core.double? width,
    $core.double? height,
  }) {
    final $result = create();
    if (trackID != null) {
      $result.trackID = trackID;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (matrix != null) {
      $result.matrix = matrix;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  MALMP4Tkhd._() : super();
  factory MALMP4Tkhd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALMP4Tkhd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALMP4Tkhd', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'trackID', protoName: 'track_ID')
    ..aInt64(2, _omitFieldNames ? '' : 'duration')
    ..aInt64(3, _omitFieldNames ? '' : 'matrix')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALMP4Tkhd clone() => MALMP4Tkhd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALMP4Tkhd copyWith(void Function(MALMP4Tkhd) updates) => super.copyWith((message) => updates(message as MALMP4Tkhd)) as MALMP4Tkhd;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALMP4Tkhd create() => MALMP4Tkhd._();
  MALMP4Tkhd createEmptyInstance() => create();
  static $pb.PbList<MALMP4Tkhd> createRepeated() => $pb.PbList<MALMP4Tkhd>();
  @$core.pragma('dart2js:noInline')
  static MALMP4Tkhd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALMP4Tkhd>(create);
  static MALMP4Tkhd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get trackID => $_getI64(0);
  @$pb.TagNumber(1)
  set trackID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrackID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get matrix => $_getI64(2);
  @$pb.TagNumber(3)
  set matrix($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatrix() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatrix() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get width => $_getN(3);
  @$pb.TagNumber(4)
  set width($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get height => $_getN(4);
  @$pb.TagNumber(5)
  set height($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);
}

class MALHVCC extends $pb.GeneratedMessage {
  factory MALHVCC({
    $core.Iterable<$1.MALHEVCVPS>? vpsList,
    $core.Iterable<$1.MALHEVCSPS>? spsList,
    $core.Iterable<$1.MALHEVCPPS>? ppsList,
    $core.Iterable<$1.MALHEVCSEI>? seiList,
  }) {
    final $result = create();
    if (vpsList != null) {
      $result.vpsList.addAll(vpsList);
    }
    if (spsList != null) {
      $result.spsList.addAll(spsList);
    }
    if (ppsList != null) {
      $result.ppsList.addAll(ppsList);
    }
    if (seiList != null) {
      $result.seiList.addAll(seiList);
    }
    return $result;
  }
  MALHVCC._() : super();
  factory MALHVCC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALHVCC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALHVCC', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..pc<$1.MALHEVCVPS>(4, _omitFieldNames ? '' : 'vpsList', $pb.PbFieldType.PM, subBuilder: $1.MALHEVCVPS.create)
    ..pc<$1.MALHEVCSPS>(5, _omitFieldNames ? '' : 'spsList', $pb.PbFieldType.PM, subBuilder: $1.MALHEVCSPS.create)
    ..pc<$1.MALHEVCPPS>(6, _omitFieldNames ? '' : 'ppsList', $pb.PbFieldType.PM, subBuilder: $1.MALHEVCPPS.create)
    ..pc<$1.MALHEVCSEI>(7, _omitFieldNames ? '' : 'seiList', $pb.PbFieldType.PM, subBuilder: $1.MALHEVCSEI.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALHVCC clone() => MALHVCC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALHVCC copyWith(void Function(MALHVCC) updates) => super.copyWith((message) => updates(message as MALHVCC)) as MALHVCC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALHVCC create() => MALHVCC._();
  MALHVCC createEmptyInstance() => create();
  static $pb.PbList<MALHVCC> createRepeated() => $pb.PbList<MALHVCC>();
  @$core.pragma('dart2js:noInline')
  static MALHVCC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALHVCC>(create);
  static MALHVCC? _defaultInstance;

  @$pb.TagNumber(4)
  $core.List<$1.MALHEVCVPS> get vpsList => $_getList(0);

  @$pb.TagNumber(5)
  $core.List<$1.MALHEVCSPS> get spsList => $_getList(1);

  @$pb.TagNumber(6)
  $core.List<$1.MALHEVCPPS> get ppsList => $_getList(2);

  @$pb.TagNumber(7)
  $core.List<$1.MALHEVCSEI> get seiList => $_getList(3);
}

class MALAVCC extends $pb.GeneratedMessage {
  factory MALAVCC({
    $fixnum.Int64? lengthSizeMinusOne,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
    $core.Iterable<$1.MALAVCSPS>? spsList,
    $core.Iterable<$1.MALAVCPPS>? ppsList,
  }) {
    final $result = create();
    if (lengthSizeMinusOne != null) {
      $result.lengthSizeMinusOne = lengthSizeMinusOne;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (spsList != null) {
      $result.spsList.addAll(spsList);
    }
    if (ppsList != null) {
      $result.ppsList.addAll(ppsList);
    }
    return $result;
  }
  MALAVCC._() : super();
  factory MALAVCC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAVCC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAVCC', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'lengthSizeMinusOne')
    ..aInt64(2, _omitFieldNames ? '' : 'width')
    ..aInt64(3, _omitFieldNames ? '' : 'height')
    ..pc<$1.MALAVCSPS>(4, _omitFieldNames ? '' : 'spsList', $pb.PbFieldType.PM, subBuilder: $1.MALAVCSPS.create)
    ..pc<$1.MALAVCPPS>(5, _omitFieldNames ? '' : 'ppsList', $pb.PbFieldType.PM, subBuilder: $1.MALAVCPPS.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAVCC clone() => MALAVCC()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAVCC copyWith(void Function(MALAVCC) updates) => super.copyWith((message) => updates(message as MALAVCC)) as MALAVCC;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAVCC create() => MALAVCC._();
  MALAVCC createEmptyInstance() => create();
  static $pb.PbList<MALAVCC> createRepeated() => $pb.PbList<MALAVCC>();
  @$core.pragma('dart2js:noInline')
  static MALAVCC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAVCC>(create);
  static MALAVCC? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lengthSizeMinusOne => $_getI64(0);
  @$pb.TagNumber(1)
  set lengthSizeMinusOne($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLengthSizeMinusOne() => $_has(0);
  @$pb.TagNumber(1)
  void clearLengthSizeMinusOne() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get width => $_getI64(1);
  @$pb.TagNumber(2)
  set width($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$1.MALAVCSPS> get spsList => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$1.MALAVCPPS> get ppsList => $_getList(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
