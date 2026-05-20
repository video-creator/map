//
//  Generated code. Do not modify.
//  source: stream.proto
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
import 'stream.pbenum.dart';

export 'stream.pbenum.dart';

/// Video Configuration Base
class MALVideoConfig extends $pb.GeneratedMessage {
  factory MALVideoConfig({
    $fixnum.Int64? lengthSizeMinusOne,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
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
    return $result;
  }
  MALVideoConfig._() : super();
  factory MALVideoConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALVideoConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALVideoConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'lengthSizeMinusOne')
    ..aInt64(2, _omitFieldNames ? '' : 'width')
    ..aInt64(3, _omitFieldNames ? '' : 'height')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALVideoConfig clone() => MALVideoConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALVideoConfig copyWith(void Function(MALVideoConfig) updates) => super.copyWith((message) => updates(message as MALVideoConfig)) as MALVideoConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALVideoConfig create() => MALVideoConfig._();
  MALVideoConfig createEmptyInstance() => create();
  static $pb.PbList<MALVideoConfig> createRepeated() => $pb.PbList<MALVideoConfig>();
  @$core.pragma('dart2js:noInline')
  static MALVideoConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALVideoConfig>(create);
  static MALVideoConfig? _defaultInstance;

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
}

enum MALStream_Stream {
  videoStream, 
  audioStream, 
  notSet
}

enum MALStream_CodecType {
  videoCodec, 
  audioCodec, 
  subtitleCodec, 
  notSet
}

/// Stream & Format
class MALStream extends $pb.GeneratedMessage {
  factory MALStream({
    MALMediaType? mediaType,
    $core.int? index,
    $fixnum.Int64? maxSampleSize,
    MALVideoStream? videoStream,
    MALAudioStream? audioStream,
    $core.double? duration,
    $fixnum.Int64? totalFrames,
    $core.double? bitrate,
    MALVideoCodecType? videoCodec,
    MALAudioCodecType? audioCodec,
    MALSubtitleCodecType? subtitleCodec,
    $core.String? codecName,
  }) {
    final $result = create();
    if (mediaType != null) {
      $result.mediaType = mediaType;
    }
    if (index != null) {
      $result.index = index;
    }
    if (maxSampleSize != null) {
      $result.maxSampleSize = maxSampleSize;
    }
    if (videoStream != null) {
      $result.videoStream = videoStream;
    }
    if (audioStream != null) {
      $result.audioStream = audioStream;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (totalFrames != null) {
      $result.totalFrames = totalFrames;
    }
    if (bitrate != null) {
      $result.bitrate = bitrate;
    }
    if (videoCodec != null) {
      $result.videoCodec = videoCodec;
    }
    if (audioCodec != null) {
      $result.audioCodec = audioCodec;
    }
    if (subtitleCodec != null) {
      $result.subtitleCodec = subtitleCodec;
    }
    if (codecName != null) {
      $result.codecName = codecName;
    }
    return $result;
  }
  MALStream._() : super();
  factory MALStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MALStream_Stream> _MALStream_StreamByTag = {
    7 : MALStream_Stream.videoStream,
    8 : MALStream_Stream.audioStream,
    0 : MALStream_Stream.notSet
  };
  static const $core.Map<$core.int, MALStream_CodecType> _MALStream_CodecTypeByTag = {
    12 : MALStream_CodecType.videoCodec,
    13 : MALStream_CodecType.audioCodec,
    14 : MALStream_CodecType.subtitleCodec,
    0 : MALStream_CodecType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..oo(1, [12, 13, 14])
    ..e<MALMediaType>(1, _omitFieldNames ? '' : 'mediaType', $pb.PbFieldType.OE, defaultOrMaker: MALMediaType.MAL_MEDIA_TYPE_NONE, valueOf: MALMediaType.valueOf, enumValues: MALMediaType.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aInt64(6, _omitFieldNames ? '' : 'maxSampleSize')
    ..aOM<MALVideoStream>(7, _omitFieldNames ? '' : 'videoStream', subBuilder: MALVideoStream.create)
    ..aOM<MALAudioStream>(8, _omitFieldNames ? '' : 'audioStream', subBuilder: MALAudioStream.create)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OD)
    ..aInt64(10, _omitFieldNames ? '' : 'totalFrames')
    ..a<$core.double>(11, _omitFieldNames ? '' : 'bitrate', $pb.PbFieldType.OD)
    ..e<MALVideoCodecType>(12, _omitFieldNames ? '' : 'videoCodec', $pb.PbFieldType.OE, defaultOrMaker: MALVideoCodecType.MAL_VIDEO_CODEC_NONE, valueOf: MALVideoCodecType.valueOf, enumValues: MALVideoCodecType.values)
    ..e<MALAudioCodecType>(13, _omitFieldNames ? '' : 'audioCodec', $pb.PbFieldType.OE, defaultOrMaker: MALAudioCodecType.MAL_AUDIO_CODEC_NONE, valueOf: MALAudioCodecType.valueOf, enumValues: MALAudioCodecType.values)
    ..e<MALSubtitleCodecType>(14, _omitFieldNames ? '' : 'subtitleCodec', $pb.PbFieldType.OE, defaultOrMaker: MALSubtitleCodecType.MAL_SUBTITLE_CODEC_NONE, valueOf: MALSubtitleCodecType.valueOf, enumValues: MALSubtitleCodecType.values)
    ..aOS(15, _omitFieldNames ? '' : 'codecName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALStream clone() => MALStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALStream copyWith(void Function(MALStream) updates) => super.copyWith((message) => updates(message as MALStream)) as MALStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALStream create() => MALStream._();
  MALStream createEmptyInstance() => create();
  static $pb.PbList<MALStream> createRepeated() => $pb.PbList<MALStream>();
  @$core.pragma('dart2js:noInline')
  static MALStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALStream>(create);
  static MALStream? _defaultInstance;

  MALStream_Stream whichStream() => _MALStream_StreamByTag[$_whichOneof(0)]!;
  void clearStream() => clearField($_whichOneof(0));

  MALStream_CodecType whichCodecType() => _MALStream_CodecTypeByTag[$_whichOneof(1)]!;
  void clearCodecType() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  MALMediaType get mediaType => $_getN(0);
  @$pb.TagNumber(1)
  set mediaType(MALMediaType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMediaType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMediaType() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxSampleSize => $_getI64(2);
  @$pb.TagNumber(6)
  set maxSampleSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxSampleSize() => $_has(2);
  @$pb.TagNumber(6)
  void clearMaxSampleSize() => clearField(6);

  @$pb.TagNumber(7)
  MALVideoStream get videoStream => $_getN(3);
  @$pb.TagNumber(7)
  set videoStream(MALVideoStream v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasVideoStream() => $_has(3);
  @$pb.TagNumber(7)
  void clearVideoStream() => clearField(7);
  @$pb.TagNumber(7)
  MALVideoStream ensureVideoStream() => $_ensure(3);

  @$pb.TagNumber(8)
  MALAudioStream get audioStream => $_getN(4);
  @$pb.TagNumber(8)
  set audioStream(MALAudioStream v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAudioStream() => $_has(4);
  @$pb.TagNumber(8)
  void clearAudioStream() => clearField(8);
  @$pb.TagNumber(8)
  MALAudioStream ensureAudioStream() => $_ensure(4);

  @$pb.TagNumber(9)
  $core.double get duration => $_getN(5);
  @$pb.TagNumber(9)
  set duration($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(9)
  void clearDuration() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get totalFrames => $_getI64(6);
  @$pb.TagNumber(10)
  set totalFrames($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasTotalFrames() => $_has(6);
  @$pb.TagNumber(10)
  void clearTotalFrames() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get bitrate => $_getN(7);
  @$pb.TagNumber(11)
  set bitrate($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(11)
  $core.bool hasBitrate() => $_has(7);
  @$pb.TagNumber(11)
  void clearBitrate() => clearField(11);

  @$pb.TagNumber(12)
  MALVideoCodecType get videoCodec => $_getN(8);
  @$pb.TagNumber(12)
  set videoCodec(MALVideoCodecType v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasVideoCodec() => $_has(8);
  @$pb.TagNumber(12)
  void clearVideoCodec() => clearField(12);

  @$pb.TagNumber(13)
  MALAudioCodecType get audioCodec => $_getN(9);
  @$pb.TagNumber(13)
  set audioCodec(MALAudioCodecType v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasAudioCodec() => $_has(9);
  @$pb.TagNumber(13)
  void clearAudioCodec() => clearField(13);

  @$pb.TagNumber(14)
  MALSubtitleCodecType get subtitleCodec => $_getN(10);
  @$pb.TagNumber(14)
  set subtitleCodec(MALSubtitleCodecType v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasSubtitleCodec() => $_has(10);
  @$pb.TagNumber(14)
  void clearSubtitleCodec() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get codecName => $_getSZ(11);
  @$pb.TagNumber(15)
  set codecName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(15)
  $core.bool hasCodecName() => $_has(11);
  @$pb.TagNumber(15)
  void clearCodecName() => clearField(15);
}

class MALVideoStream extends $pb.GeneratedMessage {
  factory MALVideoStream({
    $core.int? width,
    $core.int? height,
    $core.Iterable<MALVideoConfig>? videoConfigs,
    $core.Iterable<$1.MALPSItem>? psItems,
    $core.String? profile,
    $fixnum.Int64? iFrames,
    $fixnum.Int64? pFrames,
    $fixnum.Int64? bFrames,
    $core.int? fps,
    $core.String? sync,
    $core.Iterable<$1.MALPSItem>? displayItems,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (videoConfigs != null) {
      $result.videoConfigs.addAll(videoConfigs);
    }
    if (psItems != null) {
      $result.psItems.addAll(psItems);
    }
    if (profile != null) {
      $result.profile = profile;
    }
    if (iFrames != null) {
      $result.iFrames = iFrames;
    }
    if (pFrames != null) {
      $result.pFrames = pFrames;
    }
    if (bFrames != null) {
      $result.bFrames = bFrames;
    }
    if (fps != null) {
      $result.fps = fps;
    }
    if (sync != null) {
      $result.sync = sync;
    }
    if (displayItems != null) {
      $result.displayItems.addAll(displayItems);
    }
    return $result;
  }
  MALVideoStream._() : super();
  factory MALVideoStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALVideoStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALVideoStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..pc<MALVideoConfig>(3, _omitFieldNames ? '' : 'videoConfigs', $pb.PbFieldType.PM, subBuilder: MALVideoConfig.create)
    ..pc<$1.MALPSItem>(4, _omitFieldNames ? '' : 'psItems', $pb.PbFieldType.PM, subBuilder: $1.MALPSItem.create)
    ..aOS(5, _omitFieldNames ? '' : 'profile')
    ..aInt64(6, _omitFieldNames ? '' : 'iFrames')
    ..aInt64(7, _omitFieldNames ? '' : 'pFrames')
    ..aInt64(8, _omitFieldNames ? '' : 'bFrames')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'fps', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'sync')
    ..pc<$1.MALPSItem>(11, _omitFieldNames ? '' : 'displayItems', $pb.PbFieldType.PM, subBuilder: $1.MALPSItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALVideoStream clone() => MALVideoStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALVideoStream copyWith(void Function(MALVideoStream) updates) => super.copyWith((message) => updates(message as MALVideoStream)) as MALVideoStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALVideoStream create() => MALVideoStream._();
  MALVideoStream createEmptyInstance() => create();
  static $pb.PbList<MALVideoStream> createRepeated() => $pb.PbList<MALVideoStream>();
  @$core.pragma('dart2js:noInline')
  static MALVideoStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALVideoStream>(create);
  static MALVideoStream? _defaultInstance;

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
  $core.List<MALVideoConfig> get videoConfigs => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$1.MALPSItem> get psItems => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get profile => $_getSZ(4);
  @$pb.TagNumber(5)
  set profile($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProfile() => $_has(4);
  @$pb.TagNumber(5)
  void clearProfile() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get iFrames => $_getI64(5);
  @$pb.TagNumber(6)
  set iFrames($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIFrames() => $_has(5);
  @$pb.TagNumber(6)
  void clearIFrames() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get pFrames => $_getI64(6);
  @$pb.TagNumber(7)
  set pFrames($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPFrames() => $_has(6);
  @$pb.TagNumber(7)
  void clearPFrames() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get bFrames => $_getI64(7);
  @$pb.TagNumber(8)
  set bFrames($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBFrames() => $_has(7);
  @$pb.TagNumber(8)
  void clearBFrames() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get fps => $_getIZ(8);
  @$pb.TagNumber(9)
  set fps($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFps() => $_has(8);
  @$pb.TagNumber(9)
  void clearFps() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sync => $_getSZ(9);
  @$pb.TagNumber(10)
  set sync($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSync() => $_has(9);
  @$pb.TagNumber(10)
  void clearSync() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$1.MALPSItem> get displayItems => $_getList(10);
}

class MALAudioStream extends $pb.GeneratedMessage {
  factory MALAudioStream({
    $core.int? channels,
  }) {
    final $result = create();
    if (channels != null) {
      $result.channels = channels;
    }
    return $result;
  }
  MALAudioStream._() : super();
  factory MALAudioStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MALAudioStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MALAudioStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MALAudioStream clone() => MALAudioStream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MALAudioStream copyWith(void Function(MALAudioStream) updates) => super.copyWith((message) => updates(message as MALAudioStream)) as MALAudioStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MALAudioStream create() => MALAudioStream._();
  MALAudioStream createEmptyInstance() => create();
  static $pb.PbList<MALAudioStream> createRepeated() => $pb.PbList<MALAudioStream>();
  @$core.pragma('dart2js:noInline')
  static MALAudioStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MALAudioStream>(create);
  static MALAudioStream? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channels => $_getIZ(0);
  @$pb.TagNumber(1)
  set channels($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannels() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannels() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
