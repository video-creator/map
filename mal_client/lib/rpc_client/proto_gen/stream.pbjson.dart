//
//  Generated code. Do not modify.
//  source: stream.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mALMediaTypeDescriptor instead')
const MALMediaType$json = {
  '1': 'MALMediaType',
  '2': [
    {'1': 'MAL_MEDIA_TYPE_NONE', '2': 0},
    {'1': 'MAL_MEDIA_TYPE_VIDEO', '2': 1},
    {'1': 'MAL_MEDIA_TYPE_AUDIO', '2': 2},
    {'1': 'MAL_MEDIA_TYPE_STATIC_Image', '2': 3},
    {'1': 'MAL_MEDIA_TYPE_ANIMATED_Image', '2': 4},
    {'1': 'MAL_MEDIA_TYPE_Subtitle', '2': 5},
  ],
};

/// Descriptor for `MALMediaType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALMediaTypeDescriptor = $convert.base64Decode(
    'CgxNQUxNZWRpYVR5cGUSFwoTTUFMX01FRElBX1RZUEVfTk9ORRAAEhgKFE1BTF9NRURJQV9UWV'
    'BFX1ZJREVPEAESGAoUTUFMX01FRElBX1RZUEVfQVVESU8QAhIfChtNQUxfTUVESUFfVFlQRV9T'
    'VEFUSUNfSW1hZ2UQAxIhCh1NQUxfTUVESUFfVFlQRV9BTklNQVRFRF9JbWFnZRAEEhsKF01BTF'
    '9NRURJQV9UWVBFX1N1YnRpdGxlEAU=');

@$core.Deprecated('Use mALVideoCodecTypeDescriptor instead')
const MALVideoCodecType$json = {
  '1': 'MALVideoCodecType',
  '2': [
    {'1': 'MAL_VIDEO_CODEC_NONE', '2': 0},
    {'1': 'MAL_VIDEO_CODEC_H264', '2': 1},
    {'1': 'MAL_VIDEO_CODEC_H265', '2': 2},
    {'1': 'MAL_VIDEO_CODEC_AVS2', '2': 3},
    {'1': 'MAL_VIDEO_CODEC_AVS3', '2': 4},
    {'1': 'MAL_VIDEO_CODEC_QUICKTIME', '2': 5},
    {'1': 'MAL_VIDEO_CODEC_PRORES', '2': 6},
    {'1': 'MAL_VIDEO_CODEC_VP8', '2': 7},
    {'1': 'MAL_VIDEO_CODEC_VP9', '2': 8},
    {'1': 'MAL_VIDEO_CODEC_FFV1', '2': 9},
    {'1': 'MAL_VIDEO_CODEC_PNG', '2': 10},
    {'1': 'MAL_VIDEO_CODEC_JPG', '2': 11},
  ],
};

/// Descriptor for `MALVideoCodecType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALVideoCodecTypeDescriptor = $convert.base64Decode(
    'ChFNQUxWaWRlb0NvZGVjVHlwZRIYChRNQUxfVklERU9fQ09ERUNfTk9ORRAAEhgKFE1BTF9WSU'
    'RFT19DT0RFQ19IMjY0EAESGAoUTUFMX1ZJREVPX0NPREVDX0gyNjUQAhIYChRNQUxfVklERU9f'
    'Q09ERUNfQVZTMhADEhgKFE1BTF9WSURFT19DT0RFQ19BVlMzEAQSHQoZTUFMX1ZJREVPX0NPRE'
    'VDX1FVSUNLVElNRRAFEhoKFk1BTF9WSURFT19DT0RFQ19QUk9SRVMQBhIXChNNQUxfVklERU9f'
    'Q09ERUNfVlA4EAcSFwoTTUFMX1ZJREVPX0NPREVDX1ZQORAIEhgKFE1BTF9WSURFT19DT0RFQ1'
    '9GRlYxEAkSFwoTTUFMX1ZJREVPX0NPREVDX1BORxAKEhcKE01BTF9WSURFT19DT0RFQ19KUEcQ'
    'Cw==');

@$core.Deprecated('Use mALAudioCodecTypeDescriptor instead')
const MALAudioCodecType$json = {
  '1': 'MALAudioCodecType',
  '2': [
    {'1': 'MAL_AUDIO_CODEC_NONE', '2': 0},
    {'1': 'MAL_AUDIO_CODEC_L3', '2': 1},
    {'1': 'MAL_AUDIO_CODEC_L2', '2': 2},
    {'1': 'MAL_AUDIO_CODEC_L1', '2': 3},
    {'1': 'MAL_AUDIO_CODEC_AC3', '2': 4},
    {'1': 'MAL_AUDIO_CODEC_ALAC', '2': 5},
    {'1': 'MAL_AUDIO_CODEC_VORBIS', '2': 6},
    {'1': 'MAL_AUDIO_CODEC_FLAC', '2': 7},
    {'1': 'MAL_AUDIO_CODEC_AAC', '2': 8},
  ],
};

/// Descriptor for `MALAudioCodecType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALAudioCodecTypeDescriptor = $convert.base64Decode(
    'ChFNQUxBdWRpb0NvZGVjVHlwZRIYChRNQUxfQVVESU9fQ09ERUNfTk9ORRAAEhYKEk1BTF9BVU'
    'RJT19DT0RFQ19MMxABEhYKEk1BTF9BVURJT19DT0RFQ19MMhACEhYKEk1BTF9BVURJT19DT0RF'
    'Q19MMRADEhcKE01BTF9BVURJT19DT0RFQ19BQzMQBBIYChRNQUxfQVVESU9fQ09ERUNfQUxBQx'
    'AFEhoKFk1BTF9BVURJT19DT0RFQ19WT1JCSVMQBhIYChRNQUxfQVVESU9fQ09ERUNfRkxBQxAH'
    'EhcKE01BTF9BVURJT19DT0RFQ19BQUMQCA==');

@$core.Deprecated('Use mALSubtitleCodecTypeDescriptor instead')
const MALSubtitleCodecType$json = {
  '1': 'MALSubtitleCodecType',
  '2': [
    {'1': 'MAL_SUBTITLE_CODEC_NONE', '2': 0},
    {'1': 'MAL_SUBTITLE_CODEC_TEXT_UTF8', '2': 1},
    {'1': 'MAL_SUBTITLE_CODEC_TEXT_SSA', '2': 2},
    {'1': 'MAL_SUBTITLE_CODEC_TEXT_ASS', '2': 3},
    {'1': 'MAL_SUBTITLE_CODEC_TEXT_WEBVTT', '2': 4},
    {'1': 'MAL_SUBTITLE_CODEC_IMAGE_BMP', '2': 5},
  ],
};

/// Descriptor for `MALSubtitleCodecType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALSubtitleCodecTypeDescriptor = $convert.base64Decode(
    'ChRNQUxTdWJ0aXRsZUNvZGVjVHlwZRIbChdNQUxfU1VCVElUTEVfQ09ERUNfTk9ORRAAEiAKHE'
    '1BTF9TVUJUSVRMRV9DT0RFQ19URVhUX1VURjgQARIfChtNQUxfU1VCVElUTEVfQ09ERUNfVEVY'
    'VF9TU0EQAhIfChtNQUxfU1VCVElUTEVfQ09ERUNfVEVYVF9BU1MQAxIiCh5NQUxfU1VCVElUTE'
    'VfQ09ERUNfVEVYVF9XRUJWVFQQBBIgChxNQUxfU1VCVElUTEVfQ09ERUNfSU1BR0VfQk1QEAU=');

@$core.Deprecated('Use mALVideoConfigDescriptor instead')
const MALVideoConfig$json = {
  '1': 'MALVideoConfig',
  '2': [
    {'1': 'length_size_minus_one', '3': 1, '4': 1, '5': 3, '10': 'lengthSizeMinusOne'},
    {'1': 'width', '3': 2, '4': 1, '5': 3, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `MALVideoConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALVideoConfigDescriptor = $convert.base64Decode(
    'Cg5NQUxWaWRlb0NvbmZpZxIxChVsZW5ndGhfc2l6ZV9taW51c19vbmUYASABKANSEmxlbmd0aF'
    'NpemVNaW51c09uZRIUCgV3aWR0aBgCIAEoA1IFd2lkdGgSFgoGaGVpZ2h0GAMgASgDUgZoZWln'
    'aHQ=');

@$core.Deprecated('Use mALStreamDescriptor instead')
const MALStream$json = {
  '1': 'MALStream',
  '2': [
    {'1': 'media_type', '3': 1, '4': 1, '5': 14, '6': '.mal.proto.MALMediaType', '10': 'mediaType'},
    {'1': 'index', '3': 3, '4': 1, '5': 5, '10': 'index'},
    {'1': 'max_sample_size', '3': 6, '4': 1, '5': 3, '10': 'maxSampleSize'},
    {'1': 'video_stream', '3': 7, '4': 1, '5': 11, '6': '.mal.proto.MALVideoStream', '9': 0, '10': 'videoStream'},
    {'1': 'audio_stream', '3': 8, '4': 1, '5': 11, '6': '.mal.proto.MALAudioStream', '9': 0, '10': 'audioStream'},
    {'1': 'duration', '3': 9, '4': 1, '5': 1, '10': 'duration'},
    {'1': 'total_frames', '3': 10, '4': 1, '5': 3, '10': 'totalFrames'},
    {'1': 'bitrate', '3': 11, '4': 1, '5': 1, '10': 'bitrate'},
    {'1': 'video_codec', '3': 12, '4': 1, '5': 14, '6': '.mal.proto.MALVideoCodecType', '9': 1, '10': 'videoCodec'},
    {'1': 'audio_codec', '3': 13, '4': 1, '5': 14, '6': '.mal.proto.MALAudioCodecType', '9': 1, '10': 'audioCodec'},
    {'1': 'subtitle_codec', '3': 14, '4': 1, '5': 14, '6': '.mal.proto.MALSubtitleCodecType', '9': 1, '10': 'subtitleCodec'},
    {'1': 'codec_name', '3': 15, '4': 1, '5': 9, '10': 'codecName'},
  ],
  '8': [
    {'1': 'stream'},
    {'1': 'codec_type'},
  ],
};

/// Descriptor for `MALStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALStreamDescriptor = $convert.base64Decode(
    'CglNQUxTdHJlYW0SNgoKbWVkaWFfdHlwZRgBIAEoDjIXLm1hbC5wcm90by5NQUxNZWRpYVR5cG'
    'VSCW1lZGlhVHlwZRIUCgVpbmRleBgDIAEoBVIFaW5kZXgSJgoPbWF4X3NhbXBsZV9zaXplGAYg'
    'ASgDUg1tYXhTYW1wbGVTaXplEj4KDHZpZGVvX3N0cmVhbRgHIAEoCzIZLm1hbC5wcm90by5NQU'
    'xWaWRlb1N0cmVhbUgAUgt2aWRlb1N0cmVhbRI+CgxhdWRpb19zdHJlYW0YCCABKAsyGS5tYWwu'
    'cHJvdG8uTUFMQXVkaW9TdHJlYW1IAFILYXVkaW9TdHJlYW0SGgoIZHVyYXRpb24YCSABKAFSCG'
    'R1cmF0aW9uEiEKDHRvdGFsX2ZyYW1lcxgKIAEoA1ILdG90YWxGcmFtZXMSGAoHYml0cmF0ZRgL'
    'IAEoAVIHYml0cmF0ZRI/Cgt2aWRlb19jb2RlYxgMIAEoDjIcLm1hbC5wcm90by5NQUxWaWRlb0'
    'NvZGVjVHlwZUgBUgp2aWRlb0NvZGVjEj8KC2F1ZGlvX2NvZGVjGA0gASgOMhwubWFsLnByb3Rv'
    'Lk1BTEF1ZGlvQ29kZWNUeXBlSAFSCmF1ZGlvQ29kZWMSSAoOc3VidGl0bGVfY29kZWMYDiABKA'
    '4yHy5tYWwucHJvdG8uTUFMU3VidGl0bGVDb2RlY1R5cGVIAVINc3VidGl0bGVDb2RlYxIdCgpj'
    'b2RlY19uYW1lGA8gASgJUgljb2RlY05hbWVCCAoGc3RyZWFtQgwKCmNvZGVjX3R5cGU=');

@$core.Deprecated('Use mALVideoStreamDescriptor instead')
const MALVideoStream$json = {
  '1': 'MALVideoStream',
  '2': [
    {'1': 'width', '3': 1, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 2, '4': 1, '5': 5, '10': 'height'},
    {'1': 'video_configs', '3': 3, '4': 3, '5': 11, '6': '.mal.proto.MALVideoConfig', '10': 'videoConfigs'},
    {'1': 'ps_items', '3': 4, '4': 3, '5': 11, '6': '.mal.proto.MALPSItem', '10': 'psItems'},
    {'1': 'profile', '3': 5, '4': 1, '5': 9, '10': 'profile'},
    {'1': 'i_frames', '3': 6, '4': 1, '5': 3, '10': 'iFrames'},
    {'1': 'p_frames', '3': 7, '4': 1, '5': 3, '10': 'pFrames'},
    {'1': 'b_frames', '3': 8, '4': 1, '5': 3, '10': 'bFrames'},
    {'1': 'fps', '3': 9, '4': 1, '5': 5, '10': 'fps'},
    {'1': 'sync', '3': 10, '4': 1, '5': 9, '10': 'sync'},
    {'1': 'display_items', '3': 11, '4': 3, '5': 11, '6': '.mal.proto.MALPSItem', '10': 'displayItems'},
  ],
};

/// Descriptor for `MALVideoStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALVideoStreamDescriptor = $convert.base64Decode(
    'Cg5NQUxWaWRlb1N0cmVhbRIUCgV3aWR0aBgBIAEoBVIFd2lkdGgSFgoGaGVpZ2h0GAIgASgFUg'
    'ZoZWlnaHQSPgoNdmlkZW9fY29uZmlncxgDIAMoCzIZLm1hbC5wcm90by5NQUxWaWRlb0NvbmZp'
    'Z1IMdmlkZW9Db25maWdzEi8KCHBzX2l0ZW1zGAQgAygLMhQubWFsLnByb3RvLk1BTFBTSXRlbV'
    'IHcHNJdGVtcxIYCgdwcm9maWxlGAUgASgJUgdwcm9maWxlEhkKCGlfZnJhbWVzGAYgASgDUgdp'
    'RnJhbWVzEhkKCHBfZnJhbWVzGAcgASgDUgdwRnJhbWVzEhkKCGJfZnJhbWVzGAggASgDUgdiRn'
    'JhbWVzEhAKA2ZwcxgJIAEoBVIDZnBzEhIKBHN5bmMYCiABKAlSBHN5bmMSOQoNZGlzcGxheV9p'
    'dGVtcxgLIAMoCzIULm1hbC5wcm90by5NQUxQU0l0ZW1SDGRpc3BsYXlJdGVtcw==');

@$core.Deprecated('Use mALAudioStreamDescriptor instead')
const MALAudioStream$json = {
  '1': 'MALAudioStream',
  '2': [
    {'1': 'channels', '3': 1, '4': 1, '5': 5, '10': 'channels'},
  ],
};

/// Descriptor for `MALAudioStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAudioStreamDescriptor = $convert.base64Decode(
    'Cg5NQUxBdWRpb1N0cmVhbRIaCghjaGFubmVscxgBIAEoBVIIY2hhbm5lbHM=');

