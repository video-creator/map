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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'atom.pb.dart' as $0;
import 'mal.pbenum.dart';
import 'nal.pb.dart' as $1;
import 'stream.pb.dart' as $2;

export 'mal.pbenum.dart';

class MALFormatContext extends $pb.GeneratedMessage {
  factory MALFormatContext({
    $core.Iterable<$2.MALStream>? streams,
    MALCheck? shallowCheck,
    MALDeepCheck? deepCheck,
    $0.MALAtom? rootAtom,
    $core.String? name,
    $core.double? duration,
  }) {
    final $result = create();
    if (streams != null) {
      $result.streams.addAll(streams);
    }
    if (shallowCheck != null) {
      $result.shallowCheck = shallowCheck;
    }
    if (deepCheck != null) {
      $result.deepCheck = deepCheck;
    }
    if (rootAtom != null) {
      $result.rootAtom = rootAtom;
    }
    if (name != null) {
      $result.name = name;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  MALFormatContext._() : super();
  factory MALFormatContext.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALFormatContext.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALFormatContext', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..pc<$2.MALStream>(1, _omitFieldNames ? '' : 'streams', $pb.PbFieldType.PM, subBuilder: $2.MALStream.create)
    ..aOM<MALCheck>(2, _omitFieldNames ? '' : 'shallowCheck', protoName: 'shallowCheck', subBuilder: MALCheck.create)
    ..aOM<MALDeepCheck>(3, _omitFieldNames ? '' : 'deepCheck', protoName: 'deepCheck', subBuilder: MALDeepCheck.create)
    ..aOM<$0.MALAtom>(4, _omitFieldNames ? '' : 'rootAtom', protoName: 'rootAtom', subBuilder: $0.MALAtom.create)
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALFormatContext clone() => MALFormatContext()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALFormatContext copyWith(void Function(MALFormatContext) updates) => super.copyWith((message) => updates(message as MALFormatContext)) as MALFormatContext;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALFormatContext create() => MALFormatContext._();
  MALFormatContext createEmptyInstance() => create();
  static $pb.PbList<MALFormatContext> createRepeated() => $pb.PbList<MALFormatContext>();
  @$core.pragma('dart2js:noInline')
  static MALFormatContext getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALFormatContext>(create);
  static MALFormatContext? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.MALStream> get streams => $_getList(0);

  @$pb.TagNumber(2)
  MALCheck get shallowCheck => $_getN(1);
  @$pb.TagNumber(2)
  set shallowCheck(MALCheck v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasShallowCheck() => $_has(1);
  @$pb.TagNumber(2)
  void clearShallowCheck() => clearField(2);
  @$pb.TagNumber(2)
  MALCheck ensureShallowCheck() => $_ensure(1);

  @$pb.TagNumber(3)
  MALDeepCheck get deepCheck => $_getN(2);
  @$pb.TagNumber(3)
  set deepCheck(MALDeepCheck v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeepCheck() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeepCheck() => clearField(3);
  @$pb.TagNumber(3)
  MALDeepCheck ensureDeepCheck() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.MALAtom get rootAtom => $_getN(3);
  @$pb.TagNumber(4)
  set rootAtom($0.MALAtom v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRootAtom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRootAtom() => clearField(4);
  @$pb.TagNumber(4)
  $0.MALAtom ensureRootAtom() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get duration => $_getN(5);
  @$pb.TagNumber(6)
  set duration($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
}

/// Common Messages
class MALCheck extends $pb.GeneratedMessage {
  factory MALCheck({
    $core.Iterable<$core.String>? warnings,
    $core.Iterable<$core.String>? errors,
  }) {
    final $result = create();
    if (warnings != null) {
      $result.warnings.addAll(warnings);
    }
    if (errors != null) {
      $result.errors.addAll(errors);
    }
    return $result;
  }
  MALCheck._() : super();
  factory MALCheck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALCheck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALCheck', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'warnings')
    ..pPS(2, _omitFieldNames ? '' : 'errors')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALCheck clone() => MALCheck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALCheck copyWith(void Function(MALCheck) updates) => super.copyWith((message) => updates(message as MALCheck)) as MALCheck;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALCheck create() => MALCheck._();
  MALCheck createEmptyInstance() => create();
  static $pb.PbList<MALCheck> createRepeated() => $pb.PbList<MALCheck>();
  @$core.pragma('dart2js:noInline')
  static MALCheck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALCheck>(create);
  static MALCheck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get warnings => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get errors => $_getList(1);
}

class MALShallowCheck extends $pb.GeneratedMessage {
  factory MALShallowCheck({
    MALCheck? check_1,
  }) {
    final $result = create();
    if (check_1 != null) {
      $result.check_1 = check_1;
    }
    return $result;
  }
  MALShallowCheck._() : super();
  factory MALShallowCheck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALShallowCheck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALShallowCheck', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALCheck>(1, _omitFieldNames ? '' : 'check', subBuilder: MALCheck.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALShallowCheck clone() => MALShallowCheck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALShallowCheck copyWith(void Function(MALShallowCheck) updates) => super.copyWith((message) => updates(message as MALShallowCheck)) as MALShallowCheck;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALShallowCheck create() => MALShallowCheck._();
  MALShallowCheck createEmptyInstance() => create();
  static $pb.PbList<MALShallowCheck> createRepeated() => $pb.PbList<MALShallowCheck>();
  @$core.pragma('dart2js:noInline')
  static MALShallowCheck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALShallowCheck>(create);
  static MALShallowCheck? _defaultInstance;

  @$pb.TagNumber(1)
  MALCheck get check_1 => $_getN(0);
  @$pb.TagNumber(1)
  set check_1(MALCheck v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCheck_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheck_1() => clearField(1);
  @$pb.TagNumber(1)
  MALCheck ensureCheck_1() => $_ensure(0);
}

class MALDeepCheck extends $pb.GeneratedMessage {
  factory MALDeepCheck({
    MALCheck? check_1,
  }) {
    final $result = create();
    if (check_1 != null) {
      $result.check_1 = check_1;
    }
    return $result;
  }
  MALDeepCheck._() : super();
  factory MALDeepCheck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALDeepCheck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALDeepCheck', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aOM<MALCheck>(1, _omitFieldNames ? '' : 'check', subBuilder: MALCheck.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALDeepCheck clone() => MALDeepCheck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALDeepCheck copyWith(void Function(MALDeepCheck) updates) => super.copyWith((message) => updates(message as MALDeepCheck)) as MALDeepCheck;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALDeepCheck create() => MALDeepCheck._();
  MALDeepCheck createEmptyInstance() => create();
  static $pb.PbList<MALDeepCheck> createRepeated() => $pb.PbList<MALDeepCheck>();
  @$core.pragma('dart2js:noInline')
  static MALDeepCheck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALDeepCheck>(create);
  static MALDeepCheck? _defaultInstance;

  @$pb.TagNumber(1)
  MALCheck get check_1 => $_getN(0);
  @$pb.TagNumber(1)
  set check_1(MALCheck v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCheck_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheck_1() => clearField(1);
  @$pb.TagNumber(1)
  MALCheck ensureCheck_1() => $_ensure(0);
}

class MALPacket extends $pb.GeneratedMessage {
  factory MALPacket({
    $fixnum.Int64? pos,
    $fixnum.Int64? pts,
    $core.double? ptsTime,
    $fixnum.Int64? dts,
    $fixnum.Int64? number,
    $core.int? sampleDescriptionIndex,
    $core.int? index,
    $core.int? nalRefIdc,
    $core.int? poc,
    MALPacketFlag? flag,
    $core.Iterable<$1.MALPacketNal>? nals,
    $fixnum.Int64? size,
    $core.List<$core.int>? data,
    $core.double? dtsTime,
  }) {
    final $result = create();
    if (pos != null) {
      $result.pos = pos;
    }
    if (pts != null) {
      $result.pts = pts;
    }
    if (ptsTime != null) {
      $result.ptsTime = ptsTime;
    }
    if (dts != null) {
      $result.dts = dts;
    }
    if (number != null) {
      $result.number = number;
    }
    if (sampleDescriptionIndex != null) {
      $result.sampleDescriptionIndex = sampleDescriptionIndex;
    }
    if (index != null) {
      $result.index = index;
    }
    if (nalRefIdc != null) {
      $result.nalRefIdc = nalRefIdc;
    }
    if (poc != null) {
      $result.poc = poc;
    }
    if (flag != null) {
      $result.flag = flag;
    }
    if (nals != null) {
      $result.nals.addAll(nals);
    }
    if (size != null) {
      $result.size = size;
    }
    if (data != null) {
      $result.data = data;
    }
    if (dtsTime != null) {
      $result.dtsTime = dtsTime;
    }
    return $result;
  }
  MALPacket._() : super();
  factory MALPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALPacket', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'pos')
    ..aInt64(2, _omitFieldNames ? '' : 'pts')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'ptsTime', $pb.PbFieldType.OD)
    ..aInt64(4, _omitFieldNames ? '' : 'dts')
    ..aInt64(5, _omitFieldNames ? '' : 'number')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'sampleDescriptionIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'nalRefIdc', $pb.PbFieldType.O3)
    ..a<$core.int>(15, _omitFieldNames ? '' : 'poc', $pb.PbFieldType.O3)
    ..e<MALPacketFlag>(16, _omitFieldNames ? '' : 'flag', $pb.PbFieldType.OE, defaultOrMaker: MALPacketFlag.MAL_PACKET_FLAG_NONE, valueOf: MALPacketFlag.valueOf, enumValues: MALPacketFlag.values)
    ..pc<$1.MALPacketNal>(17, _omitFieldNames ? '' : 'nals', $pb.PbFieldType.PM, subBuilder: $1.MALPacketNal.create)
    ..aInt64(18, _omitFieldNames ? '' : 'size')
    ..a<$core.List<$core.int>>(19, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..a<$core.double>(20, _omitFieldNames ? '' : 'dtsTime', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALPacket clone() => MALPacket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALPacket copyWith(void Function(MALPacket) updates) => super.copyWith((message) => updates(message as MALPacket)) as MALPacket;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALPacket create() => MALPacket._();
  MALPacket createEmptyInstance() => create();
  static $pb.PbList<MALPacket> createRepeated() => $pb.PbList<MALPacket>();
  @$core.pragma('dart2js:noInline')
  static MALPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALPacket>(create);
  static MALPacket? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get pos => $_getI64(0);
  @$pb.TagNumber(1)
  set pos($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPos() => $_has(0);
  @$pb.TagNumber(1)
  void clearPos() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pts => $_getI64(1);
  @$pb.TagNumber(2)
  set pts($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPts() => $_has(1);
  @$pb.TagNumber(2)
  void clearPts() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get ptsTime => $_getN(2);
  @$pb.TagNumber(3)
  set ptsTime($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPtsTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearPtsTime() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get dts => $_getI64(3);
  @$pb.TagNumber(4)
  set dts($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDts() => $_has(3);
  @$pb.TagNumber(4)
  void clearDts() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get number => $_getI64(4);
  @$pb.TagNumber(5)
  set number($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sampleDescriptionIndex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sampleDescriptionIndex($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSampleDescriptionIndex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSampleDescriptionIndex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get index => $_getIZ(6);
  @$pb.TagNumber(7)
  set index($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIndex() => $_has(6);
  @$pb.TagNumber(7)
  void clearIndex() => clearField(7);

  @$pb.TagNumber(14)
  $core.int get nalRefIdc => $_getIZ(7);
  @$pb.TagNumber(14)
  set nalRefIdc($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(14)
  $core.bool hasNalRefIdc() => $_has(7);
  @$pb.TagNumber(14)
  void clearNalRefIdc() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get poc => $_getIZ(8);
  @$pb.TagNumber(15)
  set poc($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(15)
  $core.bool hasPoc() => $_has(8);
  @$pb.TagNumber(15)
  void clearPoc() => clearField(15);

  @$pb.TagNumber(16)
  MALPacketFlag get flag => $_getN(9);
  @$pb.TagNumber(16)
  set flag(MALPacketFlag v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasFlag() => $_has(9);
  @$pb.TagNumber(16)
  void clearFlag() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<$1.MALPacketNal> get nals => $_getList(10);

  @$pb.TagNumber(18)
  $fixnum.Int64 get size => $_getI64(11);
  @$pb.TagNumber(18)
  set size($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(18)
  $core.bool hasSize() => $_has(11);
  @$pb.TagNumber(18)
  void clearSize() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.int> get data => $_getN(12);
  @$pb.TagNumber(19)
  set data($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(19)
  $core.bool hasData() => $_has(12);
  @$pb.TagNumber(19)
  void clearData() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get dtsTime => $_getN(13);
  @$pb.TagNumber(20)
  set dtsTime($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(20)
  $core.bool hasDtsTime() => $_has(13);
  @$pb.TagNumber(20)
  void clearDtsTime() => clearField(20);
}

enum MALFrame_Frame {
  videoFrame, 
  audioFrame, 
  notSet
}

class MALFrame extends $pb.GeneratedMessage {
  factory MALFrame({
    MALVideoFrame? videoFrame,
    MALAudioFrame? audioFrame,
    $fixnum.Int64? pktPos,
  }) {
    final $result = create();
    if (videoFrame != null) {
      $result.videoFrame = videoFrame;
    }
    if (audioFrame != null) {
      $result.audioFrame = audioFrame;
    }
    if (pktPos != null) {
      $result.pktPos = pktPos;
    }
    return $result;
  }
  MALFrame._() : super();
  factory MALFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MALFrame_Frame> _MALFrame_FrameByTag = {
    1 : MALFrame_Frame.videoFrame,
    2 : MALFrame_Frame.audioFrame,
    0 : MALFrame_Frame.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALFrame', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<MALVideoFrame>(1, _omitFieldNames ? '' : 'videoFrame', subBuilder: MALVideoFrame.create)
    ..aOM<MALAudioFrame>(2, _omitFieldNames ? '' : 'audioFrame', subBuilder: MALAudioFrame.create)
    ..aInt64(3, _omitFieldNames ? '' : 'pktPos')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALFrame clone() => MALFrame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALFrame copyWith(void Function(MALFrame) updates) => super.copyWith((message) => updates(message as MALFrame)) as MALFrame;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALFrame create() => MALFrame._();
  MALFrame createEmptyInstance() => create();
  static $pb.PbList<MALFrame> createRepeated() => $pb.PbList<MALFrame>();
  @$core.pragma('dart2js:noInline')
  static MALFrame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALFrame>(create);
  static MALFrame? _defaultInstance;

  MALFrame_Frame whichFrame() => _MALFrame_FrameByTag[$_whichOneof(0)]!;
  void clearFrame() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MALVideoFrame get videoFrame => $_getN(0);
  @$pb.TagNumber(1)
  set videoFrame(MALVideoFrame v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVideoFrame() => $_has(0);
  @$pb.TagNumber(1)
  void clearVideoFrame() => clearField(1);
  @$pb.TagNumber(1)
  MALVideoFrame ensureVideoFrame() => $_ensure(0);

  @$pb.TagNumber(2)
  MALAudioFrame get audioFrame => $_getN(1);
  @$pb.TagNumber(2)
  set audioFrame(MALAudioFrame v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAudioFrame() => $_has(1);
  @$pb.TagNumber(2)
  void clearAudioFrame() => clearField(2);
  @$pb.TagNumber(2)
  MALAudioFrame ensureAudioFrame() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pktPos => $_getI64(2);
  @$pb.TagNumber(3)
  set pktPos($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPktPos() => $_has(2);
  @$pb.TagNumber(3)
  void clearPktPos() => clearField(3);
}

class MALVideoFrame extends $pb.GeneratedMessage {
  factory MALVideoFrame({
    $core.int? width,
    $core.int? height,
    $core.List<$core.int>? rgbData,
    $core.List<$core.int>? frameData,
    MALVideoPixelFormat? pixelFormat,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (rgbData != null) {
      $result.rgbData = rgbData;
    }
    if (frameData != null) {
      $result.frameData = frameData;
    }
    if (pixelFormat != null) {
      $result.pixelFormat = pixelFormat;
    }
    return $result;
  }
  MALVideoFrame._() : super();
  factory MALVideoFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALVideoFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALVideoFrame', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'rgbData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'frameData', $pb.PbFieldType.OY)
    ..e<MALVideoPixelFormat>(8, _omitFieldNames ? '' : 'pixelFormat', $pb.PbFieldType.OE, defaultOrMaker: MALVideoPixelFormat.NONE, valueOf: MALVideoPixelFormat.valueOf, enumValues: MALVideoPixelFormat.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALVideoFrame clone() => MALVideoFrame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALVideoFrame copyWith(void Function(MALVideoFrame) updates) => super.copyWith((message) => updates(message as MALVideoFrame)) as MALVideoFrame;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALVideoFrame create() => MALVideoFrame._();
  MALVideoFrame createEmptyInstance() => create();
  static $pb.PbList<MALVideoFrame> createRepeated() => $pb.PbList<MALVideoFrame>();
  @$core.pragma('dart2js:noInline')
  static MALVideoFrame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALVideoFrame>(create);
  static MALVideoFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get width => $_getIZ(0);
  @$pb.TagNumber(1)
  set width($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getIZ(1);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get rgbData => $_getN(2);
  @$pb.TagNumber(3)
  set rgbData($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRgbData() => $_has(2);
  @$pb.TagNumber(3)
  void clearRgbData() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get frameData => $_getN(3);
  @$pb.TagNumber(4)
  set frameData($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrameData() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrameData() => clearField(4);

  @$pb.TagNumber(8)
  MALVideoPixelFormat get pixelFormat => $_getN(4);
  @$pb.TagNumber(8)
  set pixelFormat(MALVideoPixelFormat v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPixelFormat() => $_has(4);
  @$pb.TagNumber(8)
  void clearPixelFormat() => clearField(8);
}

class MALAudioFrame extends $pb.GeneratedMessage {
  factory MALAudioFrame() => create();
  MALAudioFrame._() : super();
  factory MALAudioFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAudioFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAudioFrame', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAudioFrame clone() => MALAudioFrame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAudioFrame copyWith(void Function(MALAudioFrame) updates) => super.copyWith((message) => updates(message as MALAudioFrame)) as MALAudioFrame;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAudioFrame create() => MALAudioFrame._();
  MALAudioFrame createEmptyInstance() => create();
  static $pb.PbList<MALAudioFrame> createRepeated() => $pb.PbList<MALAudioFrame>();
  @$core.pragma('dart2js:noInline')
  static MALAudioFrame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAudioFrame>(create);
  static MALAudioFrame? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
