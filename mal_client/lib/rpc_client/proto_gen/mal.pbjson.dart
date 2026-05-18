//
//  Generated code. Do not modify.
//  source: mal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mALPacketFlagDescriptor instead')
const MALPacketFlag$json = {
  '1': 'MALPacketFlag',
  '2': [
    {'1': 'MAL_PACKET_FLAG_NONE', '2': 0},
    {'1': 'MAL_PACKET_FLAG_IDR', '2': 1},
    {'1': 'MAL_PACKET_FLAG_I', '2': 2},
    {'1': 'MAL_PACKET_FLAG_P', '2': 3},
    {'1': 'MAL_PACKET_FLAG_B', '2': 4},
  ],
};

/// Descriptor for `MALPacketFlag`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALPacketFlagDescriptor = $convert.base64Decode(
    'Cg1NQUxQYWNrZXRGbGFnEhgKFE1BTF9QQUNLRVRfRkxBR19OT05FEAASFwoTTUFMX1BBQ0tFVF'
    '9GTEFHX0lEUhABEhUKEU1BTF9QQUNLRVRfRkxBR19JEAISFQoRTUFMX1BBQ0tFVF9GTEFHX1AQ'
    'AxIVChFNQUxfUEFDS0VUX0ZMQUdfQhAE');

@$core.Deprecated('Use mALVideoPixelFormatDescriptor instead')
const MALVideoPixelFormat$json = {
  '1': 'MALVideoPixelFormat',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'YUV420P', '2': 1},
    {'1': 'YUV420P10LE', '2': 2},
    {'1': 'ARGB', '2': 3},
    {'1': 'RGBA', '2': 4},
    {'1': 'YUVJ420P', '2': 5},
  ],
};

/// Descriptor for `MALVideoPixelFormat`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mALVideoPixelFormatDescriptor = $convert.base64Decode(
    'ChNNQUxWaWRlb1BpeGVsRm9ybWF0EggKBE5PTkUQABILCgdZVVY0MjBQEAESDwoLWVVWNDIwUD'
    'EwTEUQAhIICgRBUkdCEAMSCAoEUkdCQRAEEgwKCFlVVko0MjBQEAU=');

@$core.Deprecated('Use mALFormatContextDescriptor instead')
const MALFormatContext$json = {
  '1': 'MALFormatContext',
  '2': [
    {'1': 'streams', '3': 1, '4': 3, '5': 11, '6': '.mal.proto.MALStream', '10': 'streams'},
    {'1': 'shallowCheck', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALCheck', '10': 'shallowCheck'},
    {'1': 'deepCheck', '3': 3, '4': 1, '5': 11, '6': '.mal.proto.MALDeepCheck', '10': 'deepCheck'},
    {'1': 'rootAtom', '3': 4, '4': 1, '5': 11, '6': '.mal.proto.MALAtom', '10': 'rootAtom'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'duration', '3': 6, '4': 1, '5': 1, '10': 'duration'},
  ],
};

/// Descriptor for `MALFormatContext`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALFormatContextDescriptor = $convert.base64Decode(
    'ChBNQUxGb3JtYXRDb250ZXh0Ei4KB3N0cmVhbXMYASADKAsyFC5tYWwucHJvdG8uTUFMU3RyZW'
    'FtUgdzdHJlYW1zEjcKDHNoYWxsb3dDaGVjaxgCIAEoCzITLm1hbC5wcm90by5NQUxDaGVja1IM'
    'c2hhbGxvd0NoZWNrEjUKCWRlZXBDaGVjaxgDIAEoCzIXLm1hbC5wcm90by5NQUxEZWVwQ2hlY2'
    'tSCWRlZXBDaGVjaxIuCghyb290QXRvbRgEIAEoCzISLm1hbC5wcm90by5NQUxBdG9tUghyb290'
    'QXRvbRISCgRuYW1lGAUgASgJUgRuYW1lEhoKCGR1cmF0aW9uGAYgASgBUghkdXJhdGlvbg==');

@$core.Deprecated('Use mALCheckDescriptor instead')
const MALCheck$json = {
  '1': 'MALCheck',
  '2': [
    {'1': 'warnings', '3': 1, '4': 3, '5': 9, '10': 'warnings'},
    {'1': 'errors', '3': 2, '4': 3, '5': 9, '10': 'errors'},
  ],
};

/// Descriptor for `MALCheck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALCheckDescriptor = $convert.base64Decode(
    'CghNQUxDaGVjaxIaCgh3YXJuaW5ncxgBIAMoCVIId2FybmluZ3MSFgoGZXJyb3JzGAIgAygJUg'
    'ZlcnJvcnM=');

@$core.Deprecated('Use mALShallowCheckDescriptor instead')
const MALShallowCheck$json = {
  '1': 'MALShallowCheck',
  '2': [
    {'1': 'check', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALCheck', '10': 'check'},
  ],
};

/// Descriptor for `MALShallowCheck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALShallowCheckDescriptor = $convert.base64Decode(
    'Cg9NQUxTaGFsbG93Q2hlY2sSKQoFY2hlY2sYASABKAsyEy5tYWwucHJvdG8uTUFMQ2hlY2tSBW'
    'NoZWNr');

@$core.Deprecated('Use mALDeepCheckDescriptor instead')
const MALDeepCheck$json = {
  '1': 'MALDeepCheck',
  '2': [
    {'1': 'check', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALCheck', '10': 'check'},
  ],
};

/// Descriptor for `MALDeepCheck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALDeepCheckDescriptor = $convert.base64Decode(
    'CgxNQUxEZWVwQ2hlY2sSKQoFY2hlY2sYASABKAsyEy5tYWwucHJvdG8uTUFMQ2hlY2tSBWNoZW'
    'Nr');

@$core.Deprecated('Use mALPacketDescriptor instead')
const MALPacket$json = {
  '1': 'MALPacket',
  '2': [
    {'1': 'pos', '3': 1, '4': 1, '5': 3, '10': 'pos'},
    {'1': 'pts', '3': 2, '4': 1, '5': 3, '10': 'pts'},
    {'1': 'pts_time', '3': 3, '4': 1, '5': 1, '10': 'ptsTime'},
    {'1': 'dts', '3': 4, '4': 1, '5': 3, '10': 'dts'},
    {'1': 'number', '3': 5, '4': 1, '5': 3, '10': 'number'},
    {'1': 'sample_description_index', '3': 6, '4': 1, '5': 5, '10': 'sampleDescriptionIndex'},
    {'1': 'index', '3': 7, '4': 1, '5': 5, '10': 'index'},
    {'1': 'nal_ref_idc', '3': 14, '4': 1, '5': 5, '10': 'nalRefIdc'},
    {'1': 'poc', '3': 15, '4': 1, '5': 5, '10': 'poc'},
    {'1': 'flag', '3': 16, '4': 1, '5': 14, '6': '.mal.proto.MALPacketFlag', '10': 'flag'},
    {'1': 'nals', '3': 17, '4': 3, '5': 11, '6': '.mal.proto.MALPacketNal', '10': 'nals'},
    {'1': 'size', '3': 18, '4': 1, '5': 3, '10': 'size'},
    {'1': 'data', '3': 19, '4': 1, '5': 12, '10': 'data'},
    {'1': 'dts_time', '3': 20, '4': 1, '5': 1, '10': 'dtsTime'},
  ],
};

/// Descriptor for `MALPacket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALPacketDescriptor = $convert.base64Decode(
    'CglNQUxQYWNrZXQSEAoDcG9zGAEgASgDUgNwb3MSEAoDcHRzGAIgASgDUgNwdHMSGQoIcHRzX3'
    'RpbWUYAyABKAFSB3B0c1RpbWUSEAoDZHRzGAQgASgDUgNkdHMSFgoGbnVtYmVyGAUgASgDUgZu'
    'dW1iZXISOAoYc2FtcGxlX2Rlc2NyaXB0aW9uX2luZGV4GAYgASgFUhZzYW1wbGVEZXNjcmlwdG'
    'lvbkluZGV4EhQKBWluZGV4GAcgASgFUgVpbmRleBIeCgtuYWxfcmVmX2lkYxgOIAEoBVIJbmFs'
    'UmVmSWRjEhAKA3BvYxgPIAEoBVIDcG9jEiwKBGZsYWcYECABKA4yGC5tYWwucHJvdG8uTUFMUG'
    'Fja2V0RmxhZ1IEZmxhZxIrCgRuYWxzGBEgAygLMhcubWFsLnByb3RvLk1BTFBhY2tldE5hbFIE'
    'bmFscxISCgRzaXplGBIgASgDUgRzaXplEhIKBGRhdGEYEyABKAxSBGRhdGESGQoIZHRzX3RpbW'
    'UYFCABKAFSB2R0c1RpbWU=');

@$core.Deprecated('Use mALFrameDescriptor instead')
const MALFrame$json = {
  '1': 'MALFrame',
  '2': [
    {'1': 'video_frame', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALVideoFrame', '9': 0, '10': 'videoFrame'},
    {'1': 'audio_frame', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALAudioFrame', '9': 0, '10': 'audioFrame'},
    {'1': 'pkt_pos', '3': 3, '4': 1, '5': 3, '10': 'pktPos'},
  ],
  '8': [
    {'1': 'frame'},
  ],
};

/// Descriptor for `MALFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALFrameDescriptor = $convert.base64Decode(
    'CghNQUxGcmFtZRI7Cgt2aWRlb19mcmFtZRgBIAEoCzIYLm1hbC5wcm90by5NQUxWaWRlb0ZyYW'
    '1lSABSCnZpZGVvRnJhbWUSOwoLYXVkaW9fZnJhbWUYAiABKAsyGC5tYWwucHJvdG8uTUFMQXVk'
    'aW9GcmFtZUgAUgphdWRpb0ZyYW1lEhcKB3BrdF9wb3MYAyABKANSBnBrdFBvc0IHCgVmcmFtZQ'
    '==');

@$core.Deprecated('Use mALVideoFrameDescriptor instead')
const MALVideoFrame$json = {
  '1': 'MALVideoFrame',
  '2': [
    {'1': 'width', '3': 1, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 2, '4': 1, '5': 5, '10': 'height'},
    {'1': 'rgb_data', '3': 3, '4': 1, '5': 12, '10': 'rgbData'},
    {'1': 'frame_data', '3': 4, '4': 1, '5': 12, '10': 'frameData'},
    {'1': 'pixel_format', '3': 8, '4': 1, '5': 14, '6': '.mal.proto.MALVideoPixelFormat', '10': 'pixelFormat'},
  ],
};

/// Descriptor for `MALVideoFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALVideoFrameDescriptor = $convert.base64Decode(
    'Cg1NQUxWaWRlb0ZyYW1lEhQKBXdpZHRoGAEgASgFUgV3aWR0aBIWCgZoZWlnaHQYAiABKAVSBm'
    'hlaWdodBIZCghyZ2JfZGF0YRgDIAEoDFIHcmdiRGF0YRIdCgpmcmFtZV9kYXRhGAQgASgMUglm'
    'cmFtZURhdGESQQoMcGl4ZWxfZm9ybWF0GAggASgOMh4ubWFsLnByb3RvLk1BTFZpZGVvUGl4ZW'
    'xGb3JtYXRSC3BpeGVsRm9ybWF0');

@$core.Deprecated('Use mALAudioFrameDescriptor instead')
const MALAudioFrame$json = {
  '1': 'MALAudioFrame',
};

/// Descriptor for `MALAudioFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAudioFrameDescriptor = $convert.base64Decode(
    'Cg1NQUxBdWRpb0ZyYW1l');

