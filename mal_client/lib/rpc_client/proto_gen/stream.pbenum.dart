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

import 'package:protobuf/protobuf.dart' as $pb;

/// Enums
class MALMediaType extends $pb.ProtobufEnum {
  static const MALMediaType MAL_MEDIA_TYPE_NONE = MALMediaType._(0, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_NONE');
  static const MALMediaType MAL_MEDIA_TYPE_VIDEO = MALMediaType._(1, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_VIDEO');
  static const MALMediaType MAL_MEDIA_TYPE_AUDIO = MALMediaType._(2, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_AUDIO');
  static const MALMediaType MAL_MEDIA_TYPE_STATIC_Image = MALMediaType._(3, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_STATIC_Image');
  static const MALMediaType MAL_MEDIA_TYPE_ANIMATED_Image = MALMediaType._(4, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_ANIMATED_Image');
  static const MALMediaType MAL_MEDIA_TYPE_Subtitle = MALMediaType._(5, _omitEnumNames ? '' : 'MAL_MEDIA_TYPE_Subtitle');

  static const $core.List<MALMediaType> values = <MALMediaType> [
    MAL_MEDIA_TYPE_NONE,
    MAL_MEDIA_TYPE_VIDEO,
    MAL_MEDIA_TYPE_AUDIO,
    MAL_MEDIA_TYPE_STATIC_Image,
    MAL_MEDIA_TYPE_ANIMATED_Image,
    MAL_MEDIA_TYPE_Subtitle,
  ];

  static final $core.Map<$core.int, MALMediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALMediaType? valueOf($core.int value) => _byValue[value];

  const MALMediaType._($core.int v, $core.String n) : super(v, n);
}

class MALVideoCodecType extends $pb.ProtobufEnum {
  static const MALVideoCodecType MAL_VIDEO_CODEC_NONE = MALVideoCodecType._(0, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_NONE');
  static const MALVideoCodecType MAL_VIDEO_CODEC_H264 = MALVideoCodecType._(1, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_H264');
  static const MALVideoCodecType MAL_VIDEO_CODEC_H265 = MALVideoCodecType._(2, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_H265');
  static const MALVideoCodecType MAL_VIDEO_CODEC_AVS2 = MALVideoCodecType._(3, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_AVS2');
  static const MALVideoCodecType MAL_VIDEO_CODEC_AVS3 = MALVideoCodecType._(4, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_AVS3');
  static const MALVideoCodecType MAL_VIDEO_CODEC_QUICKTIME = MALVideoCodecType._(5, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_QUICKTIME');
  static const MALVideoCodecType MAL_VIDEO_CODEC_PRORES = MALVideoCodecType._(6, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_PRORES');
  static const MALVideoCodecType MAL_VIDEO_CODEC_VP8 = MALVideoCodecType._(7, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_VP8');
  static const MALVideoCodecType MAL_VIDEO_CODEC_VP9 = MALVideoCodecType._(8, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_VP9');
  static const MALVideoCodecType MAL_VIDEO_CODEC_FFV1 = MALVideoCodecType._(9, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_FFV1');
  static const MALVideoCodecType MAL_VIDEO_CODEC_PNG = MALVideoCodecType._(10, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_PNG');
  static const MALVideoCodecType MAL_VIDEO_CODEC_JPG = MALVideoCodecType._(11, _omitEnumNames ? '' : 'MAL_VIDEO_CODEC_JPG');

  static const $core.List<MALVideoCodecType> values = <MALVideoCodecType> [
    MAL_VIDEO_CODEC_NONE,
    MAL_VIDEO_CODEC_H264,
    MAL_VIDEO_CODEC_H265,
    MAL_VIDEO_CODEC_AVS2,
    MAL_VIDEO_CODEC_AVS3,
    MAL_VIDEO_CODEC_QUICKTIME,
    MAL_VIDEO_CODEC_PRORES,
    MAL_VIDEO_CODEC_VP8,
    MAL_VIDEO_CODEC_VP9,
    MAL_VIDEO_CODEC_FFV1,
    MAL_VIDEO_CODEC_PNG,
    MAL_VIDEO_CODEC_JPG,
  ];

  static final $core.Map<$core.int, MALVideoCodecType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALVideoCodecType? valueOf($core.int value) => _byValue[value];

  const MALVideoCodecType._($core.int v, $core.String n) : super(v, n);
}

class MALAudioCodecType extends $pb.ProtobufEnum {
  static const MALAudioCodecType MAL_AUDIO_CODEC_NONE = MALAudioCodecType._(0, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_NONE');
  static const MALAudioCodecType MAL_AUDIO_CODEC_L3 = MALAudioCodecType._(1, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_L3');
  static const MALAudioCodecType MAL_AUDIO_CODEC_L2 = MALAudioCodecType._(2, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_L2');
  static const MALAudioCodecType MAL_AUDIO_CODEC_L1 = MALAudioCodecType._(3, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_L1');
  static const MALAudioCodecType MAL_AUDIO_CODEC_AC3 = MALAudioCodecType._(4, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_AC3');
  static const MALAudioCodecType MAL_AUDIO_CODEC_ALAC = MALAudioCodecType._(5, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_ALAC');
  static const MALAudioCodecType MAL_AUDIO_CODEC_VORBIS = MALAudioCodecType._(6, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_VORBIS');
  static const MALAudioCodecType MAL_AUDIO_CODEC_FLAC = MALAudioCodecType._(7, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_FLAC');
  static const MALAudioCodecType MAL_AUDIO_CODEC_AAC = MALAudioCodecType._(8, _omitEnumNames ? '' : 'MAL_AUDIO_CODEC_AAC');

  static const $core.List<MALAudioCodecType> values = <MALAudioCodecType> [
    MAL_AUDIO_CODEC_NONE,
    MAL_AUDIO_CODEC_L3,
    MAL_AUDIO_CODEC_L2,
    MAL_AUDIO_CODEC_L1,
    MAL_AUDIO_CODEC_AC3,
    MAL_AUDIO_CODEC_ALAC,
    MAL_AUDIO_CODEC_VORBIS,
    MAL_AUDIO_CODEC_FLAC,
    MAL_AUDIO_CODEC_AAC,
  ];

  static final $core.Map<$core.int, MALAudioCodecType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALAudioCodecType? valueOf($core.int value) => _byValue[value];

  const MALAudioCodecType._($core.int v, $core.String n) : super(v, n);
}

class MALSubtitleCodecType extends $pb.ProtobufEnum {
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_NONE = MALSubtitleCodecType._(0, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_NONE');
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_TEXT_UTF8 = MALSubtitleCodecType._(1, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_TEXT_UTF8');
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_TEXT_SSA = MALSubtitleCodecType._(2, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_TEXT_SSA');
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_TEXT_ASS = MALSubtitleCodecType._(3, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_TEXT_ASS');
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_TEXT_WEBVTT = MALSubtitleCodecType._(4, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_TEXT_WEBVTT');
  static const MALSubtitleCodecType MAL_SUBTITLE_CODEC_IMAGE_BMP = MALSubtitleCodecType._(5, _omitEnumNames ? '' : 'MAL_SUBTITLE_CODEC_IMAGE_BMP');

  static const $core.List<MALSubtitleCodecType> values = <MALSubtitleCodecType> [
    MAL_SUBTITLE_CODEC_NONE,
    MAL_SUBTITLE_CODEC_TEXT_UTF8,
    MAL_SUBTITLE_CODEC_TEXT_SSA,
    MAL_SUBTITLE_CODEC_TEXT_ASS,
    MAL_SUBTITLE_CODEC_TEXT_WEBVTT,
    MAL_SUBTITLE_CODEC_IMAGE_BMP,
  ];

  static final $core.Map<$core.int, MALSubtitleCodecType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALSubtitleCodecType? valueOf($core.int value) => _byValue[value];

  const MALSubtitleCodecType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
