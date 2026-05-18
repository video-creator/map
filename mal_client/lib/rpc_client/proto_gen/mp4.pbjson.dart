//
//  Generated code. Do not modify.
//  source: mp4.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mALMP4MvhdDescriptor instead')
const MALMP4Mvhd$json = {
  '1': 'MALMP4Mvhd',
  '2': [
    {'1': 'timescale', '3': 1, '4': 1, '5': 3, '10': 'timescale'},
    {'1': 'duration', '3': 2, '4': 1, '5': 3, '10': 'duration'},
    {'1': 'matrix', '3': 3, '4': 1, '5': 3, '10': 'matrix'},
  ],
};

/// Descriptor for `MALMP4Mvhd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALMP4MvhdDescriptor = $convert.base64Decode(
    'CgpNQUxNUDRNdmhkEhwKCXRpbWVzY2FsZRgBIAEoA1IJdGltZXNjYWxlEhoKCGR1cmF0aW9uGA'
    'IgASgDUghkdXJhdGlvbhIWCgZtYXRyaXgYAyABKANSBm1hdHJpeA==');

@$core.Deprecated('Use mALMp4PrivDescriptor instead')
const MALMp4Priv$json = {
  '1': 'MALMp4Priv',
  '2': [
    {'1': 'mvhd', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALMP4Mvhd', '10': 'mvhd'},
  ],
};

/// Descriptor for `MALMp4Priv`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALMp4PrivDescriptor = $convert.base64Decode(
    'CgpNQUxNcDRQcml2EikKBG12aGQYASABKAsyFS5tYWwucHJvdG8uTUFMTVA0TXZoZFIEbXZoZA'
    '==');

@$core.Deprecated('Use mALMP4MdhdDescriptor instead')
const MALMP4Mdhd$json = {
  '1': 'MALMP4Mdhd',
  '2': [
    {'1': 'timescale', '3': 1, '4': 1, '5': 3, '10': 'timescale'},
    {'1': 'duration', '3': 2, '4': 1, '5': 3, '10': 'duration'},
  ],
};

/// Descriptor for `MALMP4Mdhd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALMP4MdhdDescriptor = $convert.base64Decode(
    'CgpNQUxNUDRNZGhkEhwKCXRpbWVzY2FsZRgBIAEoA1IJdGltZXNjYWxlEhoKCGR1cmF0aW9uGA'
    'IgASgDUghkdXJhdGlvbg==');

@$core.Deprecated('Use mALMP4StreamDescriptor instead')
const MALMP4Stream$json = {
  '1': 'MALMP4Stream',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALStream', '10': 'base'},
    {'1': 'stss', '3': 2, '4': 3, '5': 3, '10': 'stss'},
    {'1': 'stsc', '3': 3, '4': 3, '5': 11, '6': '.mal.proto.StscEntry', '10': 'stsc'},
    {'1': 'stsz', '3': 4, '4': 3, '5': 3, '10': 'stsz'},
    {'1': 'stco', '3': 5, '4': 3, '5': 3, '10': 'stco'},
    {'1': 'stts', '3': 6, '4': 3, '5': 11, '6': '.mal.proto.SttsEntry', '10': 'stts'},
    {'1': 'ctts', '3': 7, '4': 3, '5': 11, '6': '.mal.proto.CttsEntry', '10': 'ctts'},
    {'1': 'elst', '3': 8, '4': 3, '5': 11, '6': '.mal.proto.ElstEntry', '10': 'elst'},
    {'1': 'mdhd', '3': 9, '4': 1, '5': 11, '6': '.mal.proto.MALMP4Mdhd', '10': 'mdhd'},
    {'1': 'tkhd', '3': 10, '4': 1, '5': 11, '6': '.mal.proto.MALMP4Tkhd', '10': 'tkhd'},
  ],
};

/// Descriptor for `MALMP4Stream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALMP4StreamDescriptor = $convert.base64Decode(
    'CgxNQUxNUDRTdHJlYW0SKAoEYmFzZRgBIAEoCzIULm1hbC5wcm90by5NQUxTdHJlYW1SBGJhc2'
    'USEgoEc3RzcxgCIAMoA1IEc3RzcxIoCgRzdHNjGAMgAygLMhQubWFsLnByb3RvLlN0c2NFbnRy'
    'eVIEc3RzYxISCgRzdHN6GAQgAygDUgRzdHN6EhIKBHN0Y28YBSADKANSBHN0Y28SKAoEc3R0cx'
    'gGIAMoCzIULm1hbC5wcm90by5TdHRzRW50cnlSBHN0dHMSKAoEY3R0cxgHIAMoCzIULm1hbC5w'
    'cm90by5DdHRzRW50cnlSBGN0dHMSKAoEZWxzdBgIIAMoCzIULm1hbC5wcm90by5FbHN0RW50cn'
    'lSBGVsc3QSKQoEbWRoZBgJIAEoCzIVLm1hbC5wcm90by5NQUxNUDRNZGhkUgRtZGhkEikKBHRr'
    'aGQYCiABKAsyFS5tYWwucHJvdG8uTUFMTVA0VGtoZFIEdGtoZA==');

@$core.Deprecated('Use stscEntryDescriptor instead')
const StscEntry$json = {
  '1': 'StscEntry',
  '2': [
    {'1': 'first_chunk', '3': 1, '4': 1, '5': 3, '10': 'firstChunk'},
    {'1': 'samples_per_chunk', '3': 2, '4': 1, '5': 3, '10': 'samplesPerChunk'},
    {'1': 'sample_description_index', '3': 3, '4': 1, '5': 3, '10': 'sampleDescriptionIndex'},
  ],
};

/// Descriptor for `StscEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stscEntryDescriptor = $convert.base64Decode(
    'CglTdHNjRW50cnkSHwoLZmlyc3RfY2h1bmsYASABKANSCmZpcnN0Q2h1bmsSKgoRc2FtcGxlc1'
    '9wZXJfY2h1bmsYAiABKANSD3NhbXBsZXNQZXJDaHVuaxI4ChhzYW1wbGVfZGVzY3JpcHRpb25f'
    'aW5kZXgYAyABKANSFnNhbXBsZURlc2NyaXB0aW9uSW5kZXg=');

@$core.Deprecated('Use sttsEntryDescriptor instead')
const SttsEntry$json = {
  '1': 'SttsEntry',
  '2': [
    {'1': 'sample_count', '3': 1, '4': 1, '5': 4, '10': 'sampleCount'},
    {'1': 'sample_delta', '3': 2, '4': 1, '5': 4, '10': 'sampleDelta'},
  ],
};

/// Descriptor for `SttsEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sttsEntryDescriptor = $convert.base64Decode(
    'CglTdHRzRW50cnkSIQoMc2FtcGxlX2NvdW50GAEgASgEUgtzYW1wbGVDb3VudBIhCgxzYW1wbG'
    'VfZGVsdGEYAiABKARSC3NhbXBsZURlbHRh');

@$core.Deprecated('Use cttsEntryDescriptor instead')
const CttsEntry$json = {
  '1': 'CttsEntry',
  '2': [
    {'1': 'sample_count', '3': 1, '4': 1, '5': 4, '10': 'sampleCount'},
    {'1': 'sample_offset', '3': 2, '4': 1, '5': 4, '10': 'sampleOffset'},
  ],
};

/// Descriptor for `CttsEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cttsEntryDescriptor = $convert.base64Decode(
    'CglDdHRzRW50cnkSIQoMc2FtcGxlX2NvdW50GAEgASgEUgtzYW1wbGVDb3VudBIjCg1zYW1wbG'
    'Vfb2Zmc2V0GAIgASgEUgxzYW1wbGVPZmZzZXQ=');

@$core.Deprecated('Use elstEntryDescriptor instead')
const ElstEntry$json = {
  '1': 'ElstEntry',
  '2': [
    {'1': 'segment_duration', '3': 1, '4': 1, '5': 4, '10': 'segmentDuration'},
    {'1': 'media_time', '3': 2, '4': 1, '5': 4, '10': 'mediaTime'},
    {'1': 'media_rate_integer', '3': 3, '4': 1, '5': 4, '10': 'mediaRateInteger'},
    {'1': 'media_rate_fraction', '3': 4, '4': 1, '5': 4, '10': 'mediaRateFraction'},
  ],
};

/// Descriptor for `ElstEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List elstEntryDescriptor = $convert.base64Decode(
    'CglFbHN0RW50cnkSKQoQc2VnbWVudF9kdXJhdGlvbhgBIAEoBFIPc2VnbWVudER1cmF0aW9uEh'
    '0KCm1lZGlhX3RpbWUYAiABKARSCW1lZGlhVGltZRIsChJtZWRpYV9yYXRlX2ludGVnZXIYAyAB'
    'KARSEG1lZGlhUmF0ZUludGVnZXISLgoTbWVkaWFfcmF0ZV9mcmFjdGlvbhgEIAEoBFIRbWVkaW'
    'FSYXRlRnJhY3Rpb24=');

@$core.Deprecated('Use mALMP4TkhdDescriptor instead')
const MALMP4Tkhd$json = {
  '1': 'MALMP4Tkhd',
  '2': [
    {'1': 'track_ID', '3': 1, '4': 1, '5': 3, '10': 'trackID'},
    {'1': 'duration', '3': 2, '4': 1, '5': 3, '10': 'duration'},
    {'1': 'matrix', '3': 3, '4': 1, '5': 3, '10': 'matrix'},
    {'1': 'width', '3': 4, '4': 1, '5': 1, '10': 'width'},
    {'1': 'height', '3': 5, '4': 1, '5': 1, '10': 'height'},
  ],
};

/// Descriptor for `MALMP4Tkhd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALMP4TkhdDescriptor = $convert.base64Decode(
    'CgpNQUxNUDRUa2hkEhkKCHRyYWNrX0lEGAEgASgDUgd0cmFja0lEEhoKCGR1cmF0aW9uGAIgAS'
    'gDUghkdXJhdGlvbhIWCgZtYXRyaXgYAyABKANSBm1hdHJpeBIUCgV3aWR0aBgEIAEoAVIFd2lk'
    'dGgSFgoGaGVpZ2h0GAUgASgBUgZoZWlnaHQ=');

@$core.Deprecated('Use mALHVCCDescriptor instead')
const MALHVCC$json = {
  '1': 'MALHVCC',
  '2': [
    {'1': 'vps_list', '3': 4, '4': 3, '5': 11, '6': '.mal.proto.MALHEVCVPS', '10': 'vpsList'},
    {'1': 'sps_list', '3': 5, '4': 3, '5': 11, '6': '.mal.proto.MALHEVCSPS', '10': 'spsList'},
    {'1': 'pps_list', '3': 6, '4': 3, '5': 11, '6': '.mal.proto.MALHEVCPPS', '10': 'ppsList'},
    {'1': 'sei_list', '3': 7, '4': 3, '5': 11, '6': '.mal.proto.MALHEVCSEI', '10': 'seiList'},
  ],
};

/// Descriptor for `MALHVCC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHVCCDescriptor = $convert.base64Decode(
    'CgdNQUxIVkNDEjAKCHZwc19saXN0GAQgAygLMhUubWFsLnByb3RvLk1BTEhFVkNWUFNSB3Zwc0'
    'xpc3QSMAoIc3BzX2xpc3QYBSADKAsyFS5tYWwucHJvdG8uTUFMSEVWQ1NQU1IHc3BzTGlzdBIw'
    'CghwcHNfbGlzdBgGIAMoCzIVLm1hbC5wcm90by5NQUxIRVZDUFBTUgdwcHNMaXN0EjAKCHNlaV'
    '9saXN0GAcgAygLMhUubWFsLnByb3RvLk1BTEhFVkNTRUlSB3NlaUxpc3Q=');

@$core.Deprecated('Use mALAVCCDescriptor instead')
const MALAVCC$json = {
  '1': 'MALAVCC',
  '2': [
    {'1': 'length_size_minus_one', '3': 1, '4': 1, '5': 3, '10': 'lengthSizeMinusOne'},
    {'1': 'width', '3': 2, '4': 1, '5': 3, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 3, '10': 'height'},
    {'1': 'sps_list', '3': 4, '4': 3, '5': 11, '6': '.mal.proto.MALAVCSPS', '10': 'spsList'},
    {'1': 'pps_list', '3': 5, '4': 3, '5': 11, '6': '.mal.proto.MALAVCPPS', '10': 'ppsList'},
  ],
};

/// Descriptor for `MALAVCC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCCDescriptor = $convert.base64Decode(
    'CgdNQUxBVkNDEjEKFWxlbmd0aF9zaXplX21pbnVzX29uZRgBIAEoA1ISbGVuZ3RoU2l6ZU1pbn'
    'VzT25lEhQKBXdpZHRoGAIgASgDUgV3aWR0aBIWCgZoZWlnaHQYAyABKANSBmhlaWdodBIvCghz'
    'cHNfbGlzdBgEIAMoCzIULm1hbC5wcm90by5NQUxBVkNTUFNSB3Nwc0xpc3QSLwoIcHBzX2xpc3'
    'QYBSADKAsyFC5tYWwucHJvdG8uTUFMQVZDUFBTUgdwcHNMaXN0');

