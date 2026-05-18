//
//  Generated code. Do not modify.
//  source: mal_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use baseRequestDescriptor instead')
const BaseRequest$json = {
  '1': 'BaseRequest',
  '2': [
    {'1': 'session_id', '3': 3, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `BaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseRequestDescriptor = $convert.base64Decode(
    'CgtCYXNlUmVxdWVzdBIdCgpzZXNzaW9uX2lkGAMgASgJUglzZXNzaW9uSWQ=');

@$core.Deprecated('Use baseResponseDescriptor instead')
const BaseResponse$json = {
  '1': 'BaseResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `BaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseResponseDescriptor = $convert.base64Decode(
    'CgxCYXNlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIjCg1lcnJvcl9tZXNzYW'
    'dlGAIgASgJUgxlcnJvck1lc3NhZ2USFAoFdmFsdWUYAyABKAlSBXZhbHVl');

@$core.Deprecated('Use parseFileRequestDescriptor instead')
const ParseFileRequest$json = {
  '1': 'ParseFileRequest',
  '2': [
    {'1': 'file_path', '3': 1, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.mal.service.ParseOptions', '10': 'options'},
    {'1': 'base', '3': 4, '4': 1, '5': 11, '6': '.mal.service.BaseRequest', '10': 'base'},
  ],
};

/// Descriptor for `ParseFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseFileRequestDescriptor = $convert.base64Decode(
    'ChBQYXJzZUZpbGVSZXF1ZXN0EhsKCWZpbGVfcGF0aBgBIAEoCVIIZmlsZVBhdGgSMwoHb3B0aW'
    '9ucxgCIAEoCzIZLm1hbC5zZXJ2aWNlLlBhcnNlT3B0aW9uc1IHb3B0aW9ucxIsCgRiYXNlGAQg'
    'ASgLMhgubWFsLnNlcnZpY2UuQmFzZVJlcXVlc3RSBGJhc2U=');

@$core.Deprecated('Use loadPacketsRequestDescriptor instead')
const LoadPacketsRequest$json = {
  '1': 'LoadPacketsRequest',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseRequest', '10': 'base'},
    {'1': 'size', '3': 2, '4': 1, '5': 5, '10': 'size'},
    {'1': 'stream_index', '3': 3, '4': 1, '5': 5, '10': 'streamIndex'},
  ],
};

/// Descriptor for `LoadPacketsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadPacketsRequestDescriptor = $convert.base64Decode(
    'ChJMb2FkUGFja2V0c1JlcXVlc3QSLAoEYmFzZRgBIAEoCzIYLm1hbC5zZXJ2aWNlLkJhc2VSZX'
    'F1ZXN0UgRiYXNlEhIKBHNpemUYAiABKAVSBHNpemUSIQoMc3RyZWFtX2luZGV4GAMgASgFUgtz'
    'dHJlYW1JbmRleA==');

@$core.Deprecated('Use loadPacketsResponseDescriptor instead')
const LoadPacketsResponse$json = {
  '1': 'LoadPacketsResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'packets', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALPacket', '10': 'packets'},
  ],
};

/// Descriptor for `LoadPacketsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadPacketsResponseDescriptor = $convert.base64Decode(
    'ChNMb2FkUGFja2V0c1Jlc3BvbnNlEi0KBGJhc2UYASABKAsyGS5tYWwuc2VydmljZS5CYXNlUm'
    'VzcG9uc2VSBGJhc2USLgoHcGFja2V0cxgCIAMoCzIULm1hbC5wcm90by5NQUxQYWNrZXRSB3Bh'
    'Y2tldHM=');

@$core.Deprecated('Use loadFramesRequestDescriptor instead')
const LoadFramesRequest$json = {
  '1': 'LoadFramesRequest',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseRequest', '10': 'base'},
    {'1': 'size', '3': 2, '4': 1, '5': 5, '10': 'size'},
    {'1': 'start', '3': 3, '4': 1, '5': 5, '10': 'start'},
    {'1': 'stream_index', '3': 4, '4': 1, '5': 5, '10': 'streamIndex'},
  ],
};

/// Descriptor for `LoadFramesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadFramesRequestDescriptor = $convert.base64Decode(
    'ChFMb2FkRnJhbWVzUmVxdWVzdBIsCgRiYXNlGAEgASgLMhgubWFsLnNlcnZpY2UuQmFzZVJlcX'
    'Vlc3RSBGJhc2USEgoEc2l6ZRgCIAEoBVIEc2l6ZRIUCgVzdGFydBgDIAEoBVIFc3RhcnQSIQoM'
    'c3RyZWFtX2luZGV4GAQgASgFUgtzdHJlYW1JbmRleA==');

@$core.Deprecated('Use loadOneFrameRequestDescriptor instead')
const LoadOneFrameRequest$json = {
  '1': 'LoadOneFrameRequest',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseRequest', '10': 'base'},
    {'1': 'pos', '3': 2, '4': 1, '5': 3, '10': 'pos'},
    {'1': 'stream_index', '3': 3, '4': 1, '5': 5, '10': 'streamIndex'},
  ],
};

/// Descriptor for `LoadOneFrameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadOneFrameRequestDescriptor = $convert.base64Decode(
    'ChNMb2FkT25lRnJhbWVSZXF1ZXN0EiwKBGJhc2UYASABKAsyGC5tYWwuc2VydmljZS5CYXNlUm'
    'VxdWVzdFIEYmFzZRIQCgNwb3MYAiABKANSA3BvcxIhCgxzdHJlYW1faW5kZXgYAyABKAVSC3N0'
    'cmVhbUluZGV4');

@$core.Deprecated('Use loadOneFrameResponseDescriptor instead')
const LoadOneFrameResponse$json = {
  '1': 'LoadOneFrameResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'frame', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALFrame', '10': 'frame'},
  ],
};

/// Descriptor for `LoadOneFrameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadOneFrameResponseDescriptor = $convert.base64Decode(
    'ChRMb2FkT25lRnJhbWVSZXNwb25zZRItCgRiYXNlGAEgASgLMhkubWFsLnNlcnZpY2UuQmFzZV'
    'Jlc3BvbnNlUgRiYXNlEikKBWZyYW1lGAIgASgLMhMubWFsLnByb3RvLk1BTEZyYW1lUgVmcmFt'
    'ZQ==');

@$core.Deprecated('Use loadFramesResponseDescriptor instead')
const LoadFramesResponse$json = {
  '1': 'LoadFramesResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'frames', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALFrame', '10': 'frames'},
  ],
};

/// Descriptor for `LoadFramesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loadFramesResponseDescriptor = $convert.base64Decode(
    'ChJMb2FkRnJhbWVzUmVzcG9uc2USLQoEYmFzZRgBIAEoCzIZLm1hbC5zZXJ2aWNlLkJhc2VSZX'
    'Nwb25zZVIEYmFzZRIrCgZmcmFtZXMYAiADKAsyEy5tYWwucHJvdG8uTUFMRnJhbWVSBmZyYW1l'
    'cw==');

@$core.Deprecated('Use parseOptionsDescriptor instead')
const ParseOptions$json = {
  '1': 'ParseOptions',
  '2': [
    {'1': 'parse_headers', '3': 1, '4': 1, '5': 8, '10': 'parseHeaders'},
    {'1': 'parse_payload', '3': 2, '4': 1, '5': 8, '10': 'parsePayload'},
    {'1': 'extract_metadata', '3': 3, '4': 1, '5': 8, '10': 'extractMetadata'},
    {'1': 'validate_structure', '3': 4, '4': 1, '5': 8, '10': 'validateStructure'},
    {'1': 'max_depth', '3': 5, '4': 1, '5': 5, '10': 'maxDepth'},
  ],
};

/// Descriptor for `ParseOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseOptionsDescriptor = $convert.base64Decode(
    'CgxQYXJzZU9wdGlvbnMSIwoNcGFyc2VfaGVhZGVycxgBIAEoCFIMcGFyc2VIZWFkZXJzEiMKDX'
    'BhcnNlX3BheWxvYWQYAiABKAhSDHBhcnNlUGF5bG9hZBIpChBleHRyYWN0X21ldGFkYXRhGAMg'
    'ASgIUg9leHRyYWN0TWV0YWRhdGESLQoSdmFsaWRhdGVfc3RydWN0dXJlGAQgASgIUhF2YWxpZG'
    'F0ZVN0cnVjdHVyZRIbCgltYXhfZGVwdGgYBSABKAVSCG1heERlcHRo');

@$core.Deprecated('Use parseFileResponseDescriptor instead')
const ParseFileResponse$json = {
  '1': 'ParseFileResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'context', '3': 3, '4': 1, '5': 11, '6': '.mal.proto.MALFormatContext', '10': 'context'},
  ],
};

/// Descriptor for `ParseFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseFileResponseDescriptor = $convert.base64Decode(
    'ChFQYXJzZUZpbGVSZXNwb25zZRItCgRiYXNlGAEgASgLMhkubWFsLnNlcnZpY2UuQmFzZVJlc3'
    'BvbnNlUgRiYXNlEjUKB2NvbnRleHQYAyABKAsyGy5tYWwucHJvdG8uTUFMRm9ybWF0Q29udGV4'
    'dFIHY29udGV4dA==');

@$core.Deprecated('Use getStreamInfoRequestDescriptor instead')
const GetStreamInfoRequest$json = {
  '1': 'GetStreamInfoRequest',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseRequest', '10': 'base'},
    {'1': 'stream_index', '3': 2, '4': 1, '5': 5, '10': 'streamIndex'},
  ],
};

/// Descriptor for `GetStreamInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStreamInfoRequestDescriptor = $convert.base64Decode(
    'ChRHZXRTdHJlYW1JbmZvUmVxdWVzdBIsCgRiYXNlGAEgASgLMhgubWFsLnNlcnZpY2UuQmFzZV'
    'JlcXVlc3RSBGJhc2USIQoMc3RyZWFtX2luZGV4GAIgASgFUgtzdHJlYW1JbmRleA==');

@$core.Deprecated('Use getStreamInfoResponseDescriptor instead')
const GetStreamInfoResponse$json = {
  '1': 'GetStreamInfoResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'stream', '3': 3, '4': 1, '5': 11, '6': '.mal.proto.MALStream', '10': 'stream'},
  ],
};

/// Descriptor for `GetStreamInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStreamInfoResponseDescriptor = $convert.base64Decode(
    'ChVHZXRTdHJlYW1JbmZvUmVzcG9uc2USLQoEYmFzZRgBIAEoCzIZLm1hbC5zZXJ2aWNlLkJhc2'
    'VSZXNwb25zZVIEYmFzZRIsCgZzdHJlYW0YAyABKAsyFC5tYWwucHJvdG8uTUFMU3RyZWFtUgZz'
    'dHJlYW0=');

@$core.Deprecated('Use getAllStreamInfoResponseDescriptor instead')
const GetAllStreamInfoResponse$json = {
  '1': 'GetAllStreamInfoResponse',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.service.BaseResponse', '10': 'base'},
    {'1': 'streams', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALStream', '10': 'streams'},
  ],
};

/// Descriptor for `GetAllStreamInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllStreamInfoResponseDescriptor = $convert.base64Decode(
    'ChhHZXRBbGxTdHJlYW1JbmZvUmVzcG9uc2USLQoEYmFzZRgBIAEoCzIZLm1hbC5zZXJ2aWNlLk'
    'Jhc2VSZXNwb25zZVIEYmFzZRIuCgdzdHJlYW1zGAIgAygLMhQubWFsLnByb3RvLk1BTFN0cmVh'
    'bVIHc3RyZWFtcw==');

