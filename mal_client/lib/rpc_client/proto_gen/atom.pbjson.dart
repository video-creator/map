//
//  Generated code. Do not modify.
//  source: atom.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mDPFieldDisplayTypeDescriptor instead')
const MDPFieldDisplayType$json = {
  '1': 'MDPFieldDisplayType',
  '2': [
    {'1': 'int64', '2': 0},
    {'1': 'string', '2': 1},
    {'1': 'separator', '2': 2},
    {'1': 'hex', '2': 3},
    {'1': 'double', '2': 4},
    {'1': 'fixed_16X16_float', '2': 5},
    {'1': 'int32', '2': 6},
    {'1': 'uint32', '2': 7},
    {'1': 'uint64', '2': 8},
  ],
};

/// Descriptor for `MDPFieldDisplayType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mDPFieldDisplayTypeDescriptor = $convert.base64Decode(
    'ChNNRFBGaWVsZERpc3BsYXlUeXBlEgkKBWludDY0EAASCgoGc3RyaW5nEAESDQoJc2VwYXJhdG'
    '9yEAISBwoDaGV4EAMSCgoGZG91YmxlEAQSFQoRZml4ZWRfMTZYMTZfZmxvYXQQBRIJCgVpbnQz'
    'MhAGEgoKBnVpbnQzMhAHEgoKBnVpbnQ2NBAI');

@$core.Deprecated('Use mALAtomFieldDescriptor instead')
const MALAtomField$json = {
  '1': 'MALAtomField',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'pos', '3': 2, '4': 1, '5': 3, '10': 'pos'},
    {'1': 'bits', '3': 3, '4': 1, '5': 5, '10': 'bits'},
    {'1': 'extra_val', '3': 4, '4': 1, '5': 9, '10': 'extraVal'},
    {'1': 'big', '3': 5, '4': 1, '5': 5, '10': 'big'},
    {'1': 'value', '3': 7, '4': 1, '5': 9, '10': 'value'},
    {'1': 'i32', '3': 8, '4': 1, '5': 5, '9': 0, '10': 'i32'},
    {'1': 'i64', '3': 9, '4': 1, '5': 3, '9': 0, '10': 'i64'},
    {'1': 'ui32', '3': 10, '4': 1, '5': 13, '9': 0, '10': 'ui32'},
    {'1': 'ui64', '3': 11, '4': 1, '5': 4, '9': 0, '10': 'ui64'},
    {'1': 'db', '3': 12, '4': 1, '5': 1, '9': 0, '10': 'db'},
    {'1': 'strv', '3': 13, '4': 1, '5': 9, '9': 0, '10': 'strv'},
    {'1': 'type', '3': 14, '4': 1, '5': 14, '6': '.mal.proto.MDPFieldDisplayType', '10': 'type'},
  ],
  '8': [
    {'1': 'typevalue'},
  ],
};

/// Descriptor for `MALAtomField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAtomFieldDescriptor = $convert.base64Decode(
    'CgxNQUxBdG9tRmllbGQSEgoEbmFtZRgBIAEoCVIEbmFtZRIQCgNwb3MYAiABKANSA3BvcxISCg'
    'RiaXRzGAMgASgFUgRiaXRzEhsKCWV4dHJhX3ZhbBgEIAEoCVIIZXh0cmFWYWwSEAoDYmlnGAUg'
    'ASgFUgNiaWcSFAoFdmFsdWUYByABKAlSBXZhbHVlEhIKA2kzMhgIIAEoBUgAUgNpMzISEgoDaT'
    'Y0GAkgASgDSABSA2k2NBIUCgR1aTMyGAogASgNSABSBHVpMzISFAoEdWk2NBgLIAEoBEgAUgR1'
    'aTY0EhAKAmRiGAwgASgBSABSAmRiEhQKBHN0cnYYDSABKAlIAFIEc3RydhIyCgR0eXBlGA4gAS'
    'gOMh4ubWFsLnByb3RvLk1EUEZpZWxkRGlzcGxheVR5cGVSBHR5cGVCCwoJdHlwZXZhbHVl');

@$core.Deprecated('Use mALAtomDescriptor instead')
const MALAtom$json = {
  '1': 'MALAtom',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'pos', '3': 2, '4': 1, '5': 3, '10': 'pos'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    {'1': 'fields', '3': 4, '4': 3, '5': 11, '6': '.mal.proto.MALAtomField', '10': 'fields'},
    {'1': 'child_boxes', '3': 5, '4': 3, '5': 11, '6': '.mal.proto.MALAtom', '10': 'childBoxes'},
    {'1': 'header_size', '3': 6, '4': 1, '5': 5, '10': 'headerSize'},
  ],
};

/// Descriptor for `MALAtom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAtomDescriptor = $convert.base64Decode(
    'CgdNQUxBdG9tEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDcG9zGAIgASgDUgNwb3MSEgoEc2l6ZR'
    'gDIAEoA1IEc2l6ZRIvCgZmaWVsZHMYBCADKAsyFy5tYWwucHJvdG8uTUFMQXRvbUZpZWxkUgZm'
    'aWVsZHMSMwoLY2hpbGRfYm94ZXMYBSADKAsyEi5tYWwucHJvdG8uTUFMQXRvbVIKY2hpbGRCb3'
    'hlcxIfCgtoZWFkZXJfc2l6ZRgGIAEoBVIKaGVhZGVyU2l6ZQ==');

