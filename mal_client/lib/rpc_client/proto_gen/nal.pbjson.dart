//
//  Generated code. Do not modify.
//  source: nal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mALNalDescriptor instead')
const MALNal$json = {
  '1': 'MALNal',
  '2': [
    {'1': 'nal_unit_type', '3': 1, '4': 1, '5': 5, '10': 'nalUnitType'},
    {'1': 'nal_name', '3': 2, '4': 1, '5': 9, '10': 'nalName'},
  ],
};

/// Descriptor for `MALNal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALNalDescriptor = $convert.base64Decode(
    'CgZNQUxOYWwSIgoNbmFsX3VuaXRfdHlwZRgBIAEoBVILbmFsVW5pdFR5cGUSGQoIbmFsX25hbW'
    'UYAiABKAlSB25hbE5hbWU=');

@$core.Deprecated('Use mALHEVCNalDescriptor instead')
const MALHEVCNal$json = {
  '1': 'MALHEVCNal',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALNal', '10': 'base'},
    {'1': 'forbidden_zero_bit', '3': 2, '4': 1, '5': 5, '10': 'forbiddenZeroBit'},
    {'1': 'nuh_layer_id', '3': 3, '4': 1, '5': 5, '10': 'nuhLayerId'},
    {'1': 'nuh_temporal_id_plus1', '3': 4, '4': 1, '5': 5, '10': 'nuhTemporalIdPlus1'},
  ],
};

/// Descriptor for `MALHEVCNal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCNalDescriptor = $convert.base64Decode(
    'CgpNQUxIRVZDTmFsEiUKBGJhc2UYASABKAsyES5tYWwucHJvdG8uTUFMTmFsUgRiYXNlEiwKEm'
    'ZvcmJpZGRlbl96ZXJvX2JpdBgCIAEoBVIQZm9yYmlkZGVuWmVyb0JpdBIgCgxudWhfbGF5ZXJf'
    'aWQYAyABKAVSCm51aExheWVySWQSMQoVbnVoX3RlbXBvcmFsX2lkX3BsdXMxGAQgASgFUhJudW'
    'hUZW1wb3JhbElkUGx1czE=');

@$core.Deprecated('Use mALHEVCVPSDescriptor instead')
const MALHEVCVPS$json = {
  '1': 'MALHEVCVPS',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '10': 'base'},
    {'1': 'video_parameter_set_id', '3': 2, '4': 1, '5': 5, '10': 'videoParameterSetId'},
    {'1': 'LayerIdxInVps', '3': 3, '4': 3, '5': 5, '10': 'LayerIdxInVps'},
    {'1': 'poc_lsb_not_present_flag', '3': 4, '4': 3, '5': 5, '10': 'pocLsbNotPresentFlag'},
  ],
};

/// Descriptor for `MALHEVCVPS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCVPSDescriptor = $convert.base64Decode(
    'CgpNQUxIRVZDVlBTEikKBGJhc2UYASABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ05hbFIEYmFzZR'
    'IzChZ2aWRlb19wYXJhbWV0ZXJfc2V0X2lkGAIgASgFUhN2aWRlb1BhcmFtZXRlclNldElkEiQK'
    'DUxheWVySWR4SW5WcHMYAyADKAVSDUxheWVySWR4SW5WcHMSNgoYcG9jX2xzYl9ub3RfcHJlc2'
    'VudF9mbGFnGAQgAygFUhRwb2NMc2JOb3RQcmVzZW50RmxhZw==');

@$core.Deprecated('Use mALHEVCSPSDescriptor instead')
const MALHEVCSPS$json = {
  '1': 'MALHEVCSPS',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '10': 'base'},
    {'1': 'sps_video_parameter_set_id', '3': 2, '4': 1, '5': 5, '10': 'spsVideoParameterSetId'},
    {'1': 'seq_parameter_set_id', '3': 3, '4': 1, '5': 5, '10': 'seqParameterSetId'},
    {'1': 'pic_width_in_luma_samples', '3': 4, '4': 1, '5': 5, '10': 'picWidthInLumaSamples'},
    {'1': 'pic_height_in_luma_samples', '3': 5, '4': 1, '5': 5, '10': 'picHeightInLumaSamples'},
    {'1': 'log2_max_pic_order_cnt_lsb_minus4', '3': 6, '4': 1, '5': 5, '10': 'log2MaxPicOrderCntLsbMinus4'},
    {'1': 'log2_min_luma_coding_block_size_minus3', '3': 7, '4': 1, '5': 5, '10': 'log2MinLumaCodingBlockSizeMinus3'},
    {'1': 'log2_diff_max_min_luma_coding_block_size', '3': 8, '4': 1, '5': 5, '10': 'log2DiffMaxMinLumaCodingBlockSize'},
    {'1': 'separate_colour_plane_flag', '3': 9, '4': 1, '5': 5, '10': 'separateColourPlaneFlag'},
    {'1': 'num_short_term_ref_pic_sets', '3': 10, '4': 1, '5': 5, '10': 'numShortTermRefPicSets'},
  ],
};

/// Descriptor for `MALHEVCSPS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCSPSDescriptor = $convert.base64Decode(
    'CgpNQUxIRVZDU1BTEikKBGJhc2UYASABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ05hbFIEYmFzZR'
    'I6ChpzcHNfdmlkZW9fcGFyYW1ldGVyX3NldF9pZBgCIAEoBVIWc3BzVmlkZW9QYXJhbWV0ZXJT'
    'ZXRJZBIvChRzZXFfcGFyYW1ldGVyX3NldF9pZBgDIAEoBVIRc2VxUGFyYW1ldGVyU2V0SWQSOA'
    'oZcGljX3dpZHRoX2luX2x1bWFfc2FtcGxlcxgEIAEoBVIVcGljV2lkdGhJbkx1bWFTYW1wbGVz'
    'EjoKGnBpY19oZWlnaHRfaW5fbHVtYV9zYW1wbGVzGAUgASgFUhZwaWNIZWlnaHRJbkx1bWFTYW'
    '1wbGVzEkYKIWxvZzJfbWF4X3BpY19vcmRlcl9jbnRfbHNiX21pbnVzNBgGIAEoBVIbbG9nMk1h'
    'eFBpY09yZGVyQ250THNiTWludXM0ElAKJmxvZzJfbWluX2x1bWFfY29kaW5nX2Jsb2NrX3Npem'
    'VfbWludXMzGAcgASgFUiBsb2cyTWluTHVtYUNvZGluZ0Jsb2NrU2l6ZU1pbnVzMxJTCihsb2cy'
    'X2RpZmZfbWF4X21pbl9sdW1hX2NvZGluZ19ibG9ja19zaXplGAggASgFUiFsb2cyRGlmZk1heE'
    '1pbkx1bWFDb2RpbmdCbG9ja1NpemUSOwoac2VwYXJhdGVfY29sb3VyX3BsYW5lX2ZsYWcYCSAB'
    'KAVSF3NlcGFyYXRlQ29sb3VyUGxhbmVGbGFnEjsKG251bV9zaG9ydF90ZXJtX3JlZl9waWNfc2'
    'V0cxgKIAEoBVIWbnVtU2hvcnRUZXJtUmVmUGljU2V0cw==');

@$core.Deprecated('Use mALHEVCPPSDescriptor instead')
const MALHEVCPPS$json = {
  '1': 'MALHEVCPPS',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '10': 'base'},
    {'1': 'pic_parameter_set_id', '3': 2, '4': 1, '5': 5, '10': 'picParameterSetId'},
    {'1': 'seq_parameter_set_id', '3': 3, '4': 1, '5': 5, '10': 'seqParameterSetId'},
    {'1': 'dependent_slice_segments_enabled_flag', '3': 4, '4': 1, '5': 5, '10': 'dependentSliceSegmentsEnabledFlag'},
    {'1': 'num_extra_slice_header_bits', '3': 5, '4': 1, '5': 5, '10': 'numExtraSliceHeaderBits'},
    {'1': 'output_flag_present_flag', '3': 6, '4': 1, '5': 5, '10': 'outputFlagPresentFlag'},
  ],
};

/// Descriptor for `MALHEVCPPS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCPPSDescriptor = $convert.base64Decode(
    'CgpNQUxIRVZDUFBTEikKBGJhc2UYASABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ05hbFIEYmFzZR'
    'IvChRwaWNfcGFyYW1ldGVyX3NldF9pZBgCIAEoBVIRcGljUGFyYW1ldGVyU2V0SWQSLwoUc2Vx'
    'X3BhcmFtZXRlcl9zZXRfaWQYAyABKAVSEXNlcVBhcmFtZXRlclNldElkElAKJWRlcGVuZGVudF'
    '9zbGljZV9zZWdtZW50c19lbmFibGVkX2ZsYWcYBCABKAVSIWRlcGVuZGVudFNsaWNlU2VnbWVu'
    'dHNFbmFibGVkRmxhZxI8ChtudW1fZXh0cmFfc2xpY2VfaGVhZGVyX2JpdHMYBSABKAVSF251bU'
    'V4dHJhU2xpY2VIZWFkZXJCaXRzEjcKGG91dHB1dF9mbGFnX3ByZXNlbnRfZmxhZxgGIAEoBVIV'
    'b3V0cHV0RmxhZ1ByZXNlbnRGbGFn');

@$core.Deprecated('Use mALSEIMasterDisplayColourDescriptor instead')
const MALSEIMasterDisplayColour$json = {
  '1': 'MALSEIMasterDisplayColour',
  '2': [
    {'1': 'display_primaries_x_0', '3': 1, '4': 1, '5': 5, '10': 'displayPrimariesX0'},
    {'1': 'display_primaries_x_1', '3': 2, '4': 1, '5': 5, '10': 'displayPrimariesX1'},
    {'1': 'display_primaries_x_2', '3': 3, '4': 1, '5': 5, '10': 'displayPrimariesX2'},
    {'1': 'display_primaries_y_0', '3': 4, '4': 1, '5': 5, '10': 'displayPrimariesY0'},
    {'1': 'display_primaries_y_1', '3': 5, '4': 1, '5': 5, '10': 'displayPrimariesY1'},
    {'1': 'display_primaries_y_2', '3': 6, '4': 1, '5': 5, '10': 'displayPrimariesY2'},
    {'1': 'white_point_x', '3': 7, '4': 1, '5': 5, '10': 'whitePointX'},
    {'1': 'white_point_y', '3': 8, '4': 1, '5': 5, '10': 'whitePointY'},
    {'1': 'max_display_mastering_luminance', '3': 9, '4': 1, '5': 5, '10': 'maxDisplayMasteringLuminance'},
    {'1': 'min_display_mastering_luminance', '3': 10, '4': 1, '5': 5, '10': 'minDisplayMasteringLuminance'},
  ],
};

/// Descriptor for `MALSEIMasterDisplayColour`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALSEIMasterDisplayColourDescriptor = $convert.base64Decode(
    'ChlNQUxTRUlNYXN0ZXJEaXNwbGF5Q29sb3VyEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3hfMBgBIA'
    'EoBVISZGlzcGxheVByaW1hcmllc1gwEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3hfMRgCIAEoBVIS'
    'ZGlzcGxheVByaW1hcmllc1gxEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3hfMhgDIAEoBVISZGlzcG'
    'xheVByaW1hcmllc1gyEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3lfMBgEIAEoBVISZGlzcGxheVBy'
    'aW1hcmllc1kwEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3lfMRgFIAEoBVISZGlzcGxheVByaW1hcm'
    'llc1kxEjEKFWRpc3BsYXlfcHJpbWFyaWVzX3lfMhgGIAEoBVISZGlzcGxheVByaW1hcmllc1ky'
    'EiIKDXdoaXRlX3BvaW50X3gYByABKAVSC3doaXRlUG9pbnRYEiIKDXdoaXRlX3BvaW50X3kYCC'
    'ABKAVSC3doaXRlUG9pbnRZEkUKH21heF9kaXNwbGF5X21hc3RlcmluZ19sdW1pbmFuY2UYCSAB'
    'KAVSHG1heERpc3BsYXlNYXN0ZXJpbmdMdW1pbmFuY2USRQofbWluX2Rpc3BsYXlfbWFzdGVyaW'
    '5nX2x1bWluYW5jZRgKIAEoBVIcbWluRGlzcGxheU1hc3RlcmluZ0x1bWluYW5jZQ==');

@$core.Deprecated('Use mALSEIContentLightLevelInfoDescriptor instead')
const MALSEIContentLightLevelInfo$json = {
  '1': 'MALSEIContentLightLevelInfo',
  '2': [
    {'1': 'max_content_light_level', '3': 1, '4': 1, '5': 5, '10': 'maxContentLightLevel'},
    {'1': 'max_pic_average_light_level', '3': 2, '4': 1, '5': 5, '10': 'maxPicAverageLightLevel'},
  ],
};

/// Descriptor for `MALSEIContentLightLevelInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALSEIContentLightLevelInfoDescriptor = $convert.base64Decode(
    'ChtNQUxTRUlDb250ZW50TGlnaHRMZXZlbEluZm8SNQoXbWF4X2NvbnRlbnRfbGlnaHRfbGV2ZW'
    'wYASABKAVSFG1heENvbnRlbnRMaWdodExldmVsEjwKG21heF9waWNfYXZlcmFnZV9saWdodF9s'
    'ZXZlbBgCIAEoBVIXbWF4UGljQXZlcmFnZUxpZ2h0TGV2ZWw=');

@$core.Deprecated('Use mALSEIUserDataRegisteredItuTT35Descriptor instead')
const MALSEIUserDataRegisteredItuTT35$json = {
  '1': 'MALSEIUserDataRegisteredItuTT35',
  '2': [
    {'1': 'itu_t_t35_country_code', '3': 1, '4': 1, '5': 5, '10': 'ituTT35CountryCode'},
    {'1': 'itu_t_t35_country_code_extension_byte', '3': 2, '4': 1, '5': 5, '10': 'ituTT35CountryCodeExtensionByte'},
    {'1': 'itu_t_t35_payload_byte', '3': 3, '4': 1, '5': 9, '10': 'ituTT35PayloadByte'},
  ],
};

/// Descriptor for `MALSEIUserDataRegisteredItuTT35`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALSEIUserDataRegisteredItuTT35Descriptor = $convert.base64Decode(
    'Ch9NQUxTRUlVc2VyRGF0YVJlZ2lzdGVyZWRJdHVUVDM1EjIKFml0dV90X3QzNV9jb3VudHJ5X2'
    'NvZGUYASABKAVSEml0dVRUMzVDb3VudHJ5Q29kZRJOCiVpdHVfdF90MzVfY291bnRyeV9jb2Rl'
    'X2V4dGVuc2lvbl9ieXRlGAIgASgFUh9pdHVUVDM1Q291bnRyeUNvZGVFeHRlbnNpb25CeXRlEj'
    'IKFml0dV90X3QzNV9wYXlsb2FkX2J5dGUYAyABKAlSEml0dVRUMzVQYXlsb2FkQnl0ZQ==');

@$core.Deprecated('Use mALSEIMessageDescriptor instead')
const MALSEIMessage$json = {
  '1': 'MALSEIMessage',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'payloadType', '3': 2, '4': 1, '5': 5, '10': 'payloadType'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    {'1': 'payloadSize', '3': 4, '4': 1, '5': 5, '10': 'payloadSize'},
    {'1': 'key_hex', '3': 5, '4': 1, '5': 9, '10': 'keyHex'},
    {'1': 'value_hex', '3': 6, '4': 1, '5': 9, '10': 'valueHex'},
    {'1': 'hevc_sei_type', '3': 7, '4': 1, '5': 14, '6': '.mal.proto.MALHEVCSEI.MALHEVCSEIType', '9': 0, '10': 'hevcSeiType'},
    {'1': 'avc_sei_type', '3': 8, '4': 1, '5': 14, '6': '.mal.proto.MALAVCSEI.MALAVCSEIType', '9': 0, '10': 'avcSeiType'},
    {'1': 'displayColour', '3': 9, '4': 1, '5': 11, '6': '.mal.proto.MALSEIMasterDisplayColour', '9': 1, '10': 'displayColour'},
    {'1': 'contentLightLevelInfo', '3': 10, '4': 1, '5': 11, '6': '.mal.proto.MALSEIContentLightLevelInfo', '9': 1, '10': 'contentLightLevelInfo'},
    {'1': 'userDataRegisteredItuTT35', '3': 11, '4': 1, '5': 11, '6': '.mal.proto.MALSEIUserDataRegisteredItuTT35', '9': 1, '10': 'userDataRegisteredItuTT35'},
  ],
  '8': [
    {'1': 'sei_type'},
    {'1': 'payload'},
  ],
};

/// Descriptor for `MALSEIMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALSEIMessageDescriptor = $convert.base64Decode(
    'Cg1NQUxTRUlNZXNzYWdlEhAKA2tleRgBIAEoCVIDa2V5EiAKC3BheWxvYWRUeXBlGAIgASgFUg'
    'twYXlsb2FkVHlwZRIUCgV2YWx1ZRgDIAEoCVIFdmFsdWUSIAoLcGF5bG9hZFNpemUYBCABKAVS'
    'C3BheWxvYWRTaXplEhcKB2tleV9oZXgYBSABKAlSBmtleUhleBIbCgl2YWx1ZV9oZXgYBiABKA'
    'lSCHZhbHVlSGV4EkoKDWhldmNfc2VpX3R5cGUYByABKA4yJC5tYWwucHJvdG8uTUFMSEVWQ1NF'
    'SS5NQUxIRVZDU0VJVHlwZUgAUgtoZXZjU2VpVHlwZRJGCgxhdmNfc2VpX3R5cGUYCCABKA4yIi'
    '5tYWwucHJvdG8uTUFMQVZDU0VJLk1BTEFWQ1NFSVR5cGVIAFIKYXZjU2VpVHlwZRJMCg1kaXNw'
    'bGF5Q29sb3VyGAkgASgLMiQubWFsLnByb3RvLk1BTFNFSU1hc3RlckRpc3BsYXlDb2xvdXJIAV'
    'INZGlzcGxheUNvbG91chJeChVjb250ZW50TGlnaHRMZXZlbEluZm8YCiABKAsyJi5tYWwucHJv'
    'dG8uTUFMU0VJQ29udGVudExpZ2h0TGV2ZWxJbmZvSAFSFWNvbnRlbnRMaWdodExldmVsSW5mbx'
    'JqChl1c2VyRGF0YVJlZ2lzdGVyZWRJdHVUVDM1GAsgASgLMioubWFsLnByb3RvLk1BTFNFSVVz'
    'ZXJEYXRhUmVnaXN0ZXJlZEl0dVRUMzVIAVIZdXNlckRhdGFSZWdpc3RlcmVkSXR1VFQzNUIKCg'
    'hzZWlfdHlwZUIJCgdwYXlsb2Fk');

@$core.Deprecated('Use mALHEVCSEIDescriptor instead')
const MALHEVCSEI$json = {
  '1': 'MALHEVCSEI',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '10': 'base'},
    {'1': 'messageList', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALSEIMessage', '10': 'messageList'},
  ],
  '4': [MALHEVCSEI_MALHEVCSEIType$json],
};

@$core.Deprecated('Use mALHEVCSEIDescriptor instead')
const MALHEVCSEI_MALHEVCSEIType$json = {
  '1': 'MALHEVCSEIType',
  '2': [
    {'1': 'buffering_period_', '2': 0},
    {'1': 'pic_timing', '2': 1},
    {'1': 'pan_scan_rect', '2': 2},
    {'1': 'filler_payload', '2': 3},
    {'1': 'user_data_registered_itu_t_t35', '2': 4},
    {'1': 'user_data_unregistered', '2': 5},
    {'1': 'recovery_point', '2': 6},
    {'1': 'scene_info', '2': 9},
    {'1': 'picture_snapshot', '2': 15},
    {'1': 'progressive_refinement_segment_start', '2': 16},
    {'1': 'progressive_refinement_segment_end', '2': 17},
    {'1': 'film_grain_characteristics', '2': 19},
    {'1': 'post_filter_hint', '2': 22},
    {'1': 'tone_mapping_info', '2': 23},
    {'1': 'frame_packing_arrangement', '2': 45},
    {'1': 'display_orientation', '2': 47},
    {'1': 'green_metadata', '2': 56},
    {'1': 'structure_of_pictures_info', '2': 128},
    {'1': 'active_parameter_sets', '2': 129},
    {'1': 'decoding_unit_info', '2': 130},
    {'1': 'temporal_sub_layer_zero_index', '2': 131},
    {'1': 'decoded_picture_hash', '2': 132},
    {'1': 'scalable_nesting', '2': 133},
    {'1': 'region_refresh_info', '2': 134},
    {'1': 'no_display', '2': 135},
    {'1': 'time_code', '2': 136},
    {'1': 'mastering_display_colour_volume', '2': 137},
    {'1': 'segmented_rect_frame_packing_arrangement', '2': 138},
    {'1': 'temporal_motion_constrained_tile_sets', '2': 139},
    {'1': 'chroma_resampling_filter_hint', '2': 140},
    {'1': 'knee_function_info', '2': 141},
    {'1': 'colour_remapping_info', '2': 142},
    {'1': 'deinterlaced_field_identification', '2': 143},
    {'1': 'content_light_level_info', '2': 144},
    {'1': 'dependent_rap_indication', '2': 145},
    {'1': 'coded_region_completion', '2': 146},
    {'1': 'alternative_transfer_characteristics', '2': 147},
    {'1': 'ambient_viewing_environment', '2': 148},
    {'1': 'content_colour_volume', '2': 149},
    {'1': 'equirectangular_projection', '2': 150},
    {'1': 'cubemap_projection', '2': 151},
    {'1': 'fisheye_video_info', '2': 152},
    {'1': 'sphere_rotation', '2': 154},
    {'1': 'regionwise_packing', '2': 155},
    {'1': 'omni_viewport', '2': 156},
    {'1': 'regional_nesting', '2': 157},
    {'1': 'mcts_extraction_info_sets', '2': 158},
    {'1': 'mcts_extraction_info_nesting', '2': 159},
    {'1': 'layers_not_present', '2': 160},
    {'1': 'inter_layer_constrained_tile_sets', '2': 161},
    {'1': 'bsp_nesting', '2': 162},
    {'1': 'bsp_initial_arrival_time', '2': 163},
    {'1': 'sub_bitstream_property', '2': 164},
    {'1': 'alpha_channel_info', '2': 165},
    {'1': 'overlay_info', '2': 166},
    {'1': 'temporal_mv_prediction_constraints', '2': 167},
    {'1': 'frame_field_info', '2': 168},
    {'1': 'three_dimensional_reference_displays_info', '2': 176},
    {'1': 'depth_representation_info', '2': 177},
    {'1': 'multiview_scene_info', '2': 178},
    {'1': 'multiview_acquisition_info', '2': 179},
    {'1': 'multiview_view_position', '2': 180},
    {'1': 'alternative_depth_info', '2': 181},
    {'1': 'sei_manifest', '2': 200},
    {'1': 'sei_prefix_indication', '2': 201},
    {'1': 'annotated_regions', '2': 202},
    {'1': 'shutter_interval_info', '2': 205},
    {'1': 'reserved_sei_message', '2': 9999},
  ],
};

/// Descriptor for `MALHEVCSEI`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCSEIDescriptor = $convert.base64Decode(
    'CgpNQUxIRVZDU0VJEikKBGJhc2UYASABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ05hbFIEYmFzZR'
    'I6CgttZXNzYWdlTGlzdBgCIAMoCzIYLm1hbC5wcm90by5NQUxTRUlNZXNzYWdlUgttZXNzYWdl'
    'TGlzdCKhDwoOTUFMSEVWQ1NFSVR5cGUSFQoRYnVmZmVyaW5nX3BlcmlvZF8QABIOCgpwaWNfdG'
    'ltaW5nEAESEQoNcGFuX3NjYW5fcmVjdBACEhIKDmZpbGxlcl9wYXlsb2FkEAMSIgoedXNlcl9k'
    'YXRhX3JlZ2lzdGVyZWRfaXR1X3RfdDM1EAQSGgoWdXNlcl9kYXRhX3VucmVnaXN0ZXJlZBAFEh'
    'IKDnJlY292ZXJ5X3BvaW50EAYSDgoKc2NlbmVfaW5mbxAJEhQKEHBpY3R1cmVfc25hcHNob3QQ'
    'DxIoCiRwcm9ncmVzc2l2ZV9yZWZpbmVtZW50X3NlZ21lbnRfc3RhcnQQEBImCiJwcm9ncmVzc2'
    'l2ZV9yZWZpbmVtZW50X3NlZ21lbnRfZW5kEBESHgoaZmlsbV9ncmFpbl9jaGFyYWN0ZXJpc3Rp'
    'Y3MQExIUChBwb3N0X2ZpbHRlcl9oaW50EBYSFQoRdG9uZV9tYXBwaW5nX2luZm8QFxIdChlmcm'
    'FtZV9wYWNraW5nX2FycmFuZ2VtZW50EC0SFwoTZGlzcGxheV9vcmllbnRhdGlvbhAvEhIKDmdy'
    'ZWVuX21ldGFkYXRhEDgSHwoac3RydWN0dXJlX29mX3BpY3R1cmVzX2luZm8QgAESGgoVYWN0aX'
    'ZlX3BhcmFtZXRlcl9zZXRzEIEBEhcKEmRlY29kaW5nX3VuaXRfaW5mbxCCARIiCh10ZW1wb3Jh'
    'bF9zdWJfbGF5ZXJfemVyb19pbmRleBCDARIZChRkZWNvZGVkX3BpY3R1cmVfaGFzaBCEARIVCh'
    'BzY2FsYWJsZV9uZXN0aW5nEIUBEhgKE3JlZ2lvbl9yZWZyZXNoX2luZm8QhgESDwoKbm9fZGlz'
    'cGxheRCHARIOCgl0aW1lX2NvZGUQiAESJAofbWFzdGVyaW5nX2Rpc3BsYXlfY29sb3VyX3ZvbH'
    'VtZRCJARItCihzZWdtZW50ZWRfcmVjdF9mcmFtZV9wYWNraW5nX2FycmFuZ2VtZW50EIoBEioK'
    'JXRlbXBvcmFsX21vdGlvbl9jb25zdHJhaW5lZF90aWxlX3NldHMQiwESIgodY2hyb21hX3Jlc2'
    'FtcGxpbmdfZmlsdGVyX2hpbnQQjAESFwoSa25lZV9mdW5jdGlvbl9pbmZvEI0BEhoKFWNvbG91'
    'cl9yZW1hcHBpbmdfaW5mbxCOARImCiFkZWludGVybGFjZWRfZmllbGRfaWRlbnRpZmljYXRpb2'
    '4QjwESHQoYY29udGVudF9saWdodF9sZXZlbF9pbmZvEJABEh0KGGRlcGVuZGVudF9yYXBfaW5k'
    'aWNhdGlvbhCRARIcChdjb2RlZF9yZWdpb25fY29tcGxldGlvbhCSARIpCiRhbHRlcm5hdGl2ZV'
    '90cmFuc2Zlcl9jaGFyYWN0ZXJpc3RpY3MQkwESIAobYW1iaWVudF92aWV3aW5nX2Vudmlyb25t'
    'ZW50EJQBEhoKFWNvbnRlbnRfY29sb3VyX3ZvbHVtZRCVARIfChplcXVpcmVjdGFuZ3VsYXJfcH'
    'JvamVjdGlvbhCWARIXChJjdWJlbWFwX3Byb2plY3Rpb24QlwESFwoSZmlzaGV5ZV92aWRlb19p'
    'bmZvEJgBEhQKD3NwaGVyZV9yb3RhdGlvbhCaARIXChJyZWdpb253aXNlX3BhY2tpbmcQmwESEg'
    'oNb21uaV92aWV3cG9ydBCcARIVChByZWdpb25hbF9uZXN0aW5nEJ0BEh4KGW1jdHNfZXh0cmFj'
    'dGlvbl9pbmZvX3NldHMQngESIQocbWN0c19leHRyYWN0aW9uX2luZm9fbmVzdGluZxCfARIXCh'
    'JsYXllcnNfbm90X3ByZXNlbnQQoAESJgohaW50ZXJfbGF5ZXJfY29uc3RyYWluZWRfdGlsZV9z'
    'ZXRzEKEBEhAKC2JzcF9uZXN0aW5nEKIBEh0KGGJzcF9pbml0aWFsX2Fycml2YWxfdGltZRCjAR'
    'IbChZzdWJfYml0c3RyZWFtX3Byb3BlcnR5EKQBEhcKEmFscGhhX2NoYW5uZWxfaW5mbxClARIR'
    'CgxvdmVybGF5X2luZm8QpgESJwoidGVtcG9yYWxfbXZfcHJlZGljdGlvbl9jb25zdHJhaW50cx'
    'CnARIVChBmcmFtZV9maWVsZF9pbmZvEKgBEi4KKXRocmVlX2RpbWVuc2lvbmFsX3JlZmVyZW5j'
    'ZV9kaXNwbGF5c19pbmZvELABEh4KGWRlcHRoX3JlcHJlc2VudGF0aW9uX2luZm8QsQESGQoUbX'
    'VsdGl2aWV3X3NjZW5lX2luZm8QsgESHwoabXVsdGl2aWV3X2FjcXVpc2l0aW9uX2luZm8QswES'
    'HAoXbXVsdGl2aWV3X3ZpZXdfcG9zaXRpb24QtAESGwoWYWx0ZXJuYXRpdmVfZGVwdGhfaW5mbx'
    'C1ARIRCgxzZWlfbWFuaWZlc3QQyAESGgoVc2VpX3ByZWZpeF9pbmRpY2F0aW9uEMkBEhYKEWFu'
    'bm90YXRlZF9yZWdpb25zEMoBEhoKFXNodXR0ZXJfaW50ZXJ2YWxfaW5mbxDNARIZChRyZXNlcn'
    'ZlZF9zZWlfbWVzc2FnZRCPTg==');

@$core.Deprecated('Use mALHEVCSliceSegmentHeaderDescriptor instead')
const MALHEVCSliceSegmentHeader$json = {
  '1': 'MALHEVCSliceSegmentHeader',
  '2': [
    {'1': 'first_slice_segment_in_pic_flag', '3': 1, '4': 1, '5': 5, '10': 'firstSliceSegmentInPicFlag'},
    {'1': 'no_output_of_prior_pics_flag', '3': 2, '4': 1, '5': 5, '10': 'noOutputOfPriorPicsFlag'},
    {'1': 'slice_pic_parameter_set_id', '3': 3, '4': 1, '5': 5, '10': 'slicePicParameterSetId'},
    {'1': 'slice_segment_address', '3': 4, '4': 1, '5': 5, '10': 'sliceSegmentAddress'},
    {'1': 'slice_type', '3': 5, '4': 1, '5': 5, '10': 'sliceType'},
    {'1': 'slice_pic_order_cnt_lsb', '3': 6, '4': 1, '5': 5, '10': 'slicePicOrderCntLsb'},
  ],
};

/// Descriptor for `MALHEVCSliceSegmentHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCSliceSegmentHeaderDescriptor = $convert.base64Decode(
    'ChlNQUxIRVZDU2xpY2VTZWdtZW50SGVhZGVyEkMKH2ZpcnN0X3NsaWNlX3NlZ21lbnRfaW5fcG'
    'ljX2ZsYWcYASABKAVSGmZpcnN0U2xpY2VTZWdtZW50SW5QaWNGbGFnEj0KHG5vX291dHB1dF9v'
    'Zl9wcmlvcl9waWNzX2ZsYWcYAiABKAVSF25vT3V0cHV0T2ZQcmlvclBpY3NGbGFnEjoKGnNsaW'
    'NlX3BpY19wYXJhbWV0ZXJfc2V0X2lkGAMgASgFUhZzbGljZVBpY1BhcmFtZXRlclNldElkEjIK'
    'FXNsaWNlX3NlZ21lbnRfYWRkcmVzcxgEIAEoBVITc2xpY2VTZWdtZW50QWRkcmVzcxIdCgpzbG'
    'ljZV90eXBlGAUgASgFUglzbGljZVR5cGUSNAoXc2xpY2VfcGljX29yZGVyX2NudF9sc2IYBiAB'
    'KAVSE3NsaWNlUGljT3JkZXJDbnRMc2I=');

@$core.Deprecated('Use mALHEVCSliceSegmentLayerRbspDescriptor instead')
const MALHEVCSliceSegmentLayerRbsp$json = {
  '1': 'MALHEVCSliceSegmentLayerRbsp',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '10': 'base'},
    {'1': 'header', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCSliceSegmentHeader', '10': 'header'},
  ],
};

/// Descriptor for `MALHEVCSliceSegmentLayerRbsp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALHEVCSliceSegmentLayerRbspDescriptor = $convert.base64Decode(
    'ChxNQUxIRVZDU2xpY2VTZWdtZW50TGF5ZXJSYnNwEikKBGJhc2UYASABKAsyFS5tYWwucHJvdG'
    '8uTUFMSEVWQ05hbFIEYmFzZRI8CgZoZWFkZXIYAiABKAsyJC5tYWwucHJvdG8uTUFMSEVWQ1Ns'
    'aWNlU2VnbWVudEhlYWRlclIGaGVhZGVy');

@$core.Deprecated('Use mALAVCNalDescriptor instead')
const MALAVCNal$json = {
  '1': 'MALAVCNal',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALNal', '10': 'base'},
    {'1': 'nal_ref_idc', '3': 2, '4': 1, '5': 5, '10': 'nalRefIdc'},
  ],
};

/// Descriptor for `MALAVCNal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCNalDescriptor = $convert.base64Decode(
    'CglNQUxBVkNOYWwSJQoEYmFzZRgBIAEoCzIRLm1hbC5wcm90by5NQUxOYWxSBGJhc2USHgoLbm'
    'FsX3JlZl9pZGMYAiABKAVSCW5hbFJlZklkYw==');

@$core.Deprecated('Use mALAVCSPSDescriptor instead')
const MALAVCSPS$json = {
  '1': 'MALAVCSPS',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '10': 'base'},
    {'1': 'profile_idc', '3': 2, '4': 1, '5': 5, '10': 'profileIdc'},
    {'1': 'level_idc', '3': 3, '4': 1, '5': 5, '10': 'levelIdc'},
    {'1': 'seq_parameter_set_id', '3': 4, '4': 1, '5': 5, '10': 'seqParameterSetId'},
    {'1': 'chroma_format_idc', '3': 5, '4': 1, '5': 5, '10': 'chromaFormatIdc'},
    {'1': 'bit_depth_luma_minus8', '3': 6, '4': 1, '5': 5, '10': 'bitDepthLumaMinus8'},
    {'1': 'bit_depth_chroma_minus8', '3': 7, '4': 1, '5': 5, '10': 'bitDepthChromaMinus8'},
    {'1': 'log2_max_frame_num_minus4', '3': 8, '4': 1, '5': 5, '10': 'log2MaxFrameNumMinus4'},
    {'1': 'pic_order_cnt_type', '3': 9, '4': 1, '5': 5, '10': 'picOrderCntType'},
    {'1': 'delta_pic_order_always_zero_flag', '3': 10, '4': 1, '5': 5, '10': 'deltaPicOrderAlwaysZeroFlag'},
    {'1': 'num_ref_frames_in_pic_order_cnt_cycle', '3': 11, '4': 1, '5': 5, '10': 'numRefFramesInPicOrderCntCycle'},
    {'1': 'offset_for_ref_frame', '3': 12, '4': 3, '5': 5, '10': 'offsetForRefFrame'},
    {'1': 'log2_max_pic_order_cnt_lsb_minus4', '3': 13, '4': 1, '5': 5, '10': 'log2MaxPicOrderCntLsbMinus4'},
    {'1': 'max_num_ref_frames', '3': 14, '4': 1, '5': 5, '10': 'maxNumRefFrames'},
    {'1': 'pic_width_in_mbs_minus1', '3': 15, '4': 1, '5': 5, '10': 'picWidthInMbsMinus1'},
    {'1': 'pic_height_in_map_units_minus1', '3': 16, '4': 1, '5': 5, '10': 'picHeightInMapUnitsMinus1'},
    {'1': 'frame_mbs_only_flag', '3': 17, '4': 1, '5': 5, '10': 'frameMbsOnlyFlag'},
    {'1': 'mb_adaptive_frame_field_flag', '3': 18, '4': 1, '5': 5, '10': 'mbAdaptiveFrameFieldFlag'},
    {'1': 'frame_cropping_flag', '3': 19, '4': 1, '5': 5, '10': 'frameCroppingFlag'},
    {'1': 'separate_colour_plane_flag', '3': 20, '4': 1, '5': 5, '10': 'separateColourPlaneFlag'},
    {'1': 'offset_for_non_ref_pic', '3': 21, '4': 1, '5': 5, '10': 'offsetForNonRefPic'},
    {'1': 'offset_for_top_to_bottom_field', '3': 22, '4': 1, '5': 5, '10': 'offsetForTopToBottomField'},
  ],
};

/// Descriptor for `MALAVCSPS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCSPSDescriptor = $convert.base64Decode(
    'CglNQUxBVkNTUFMSKAoEYmFzZRgBIAEoCzIULm1hbC5wcm90by5NQUxBVkNOYWxSBGJhc2USHw'
    'oLcHJvZmlsZV9pZGMYAiABKAVSCnByb2ZpbGVJZGMSGwoJbGV2ZWxfaWRjGAMgASgFUghsZXZl'
    'bElkYxIvChRzZXFfcGFyYW1ldGVyX3NldF9pZBgEIAEoBVIRc2VxUGFyYW1ldGVyU2V0SWQSKg'
    'oRY2hyb21hX2Zvcm1hdF9pZGMYBSABKAVSD2Nocm9tYUZvcm1hdElkYxIxChViaXRfZGVwdGhf'
    'bHVtYV9taW51czgYBiABKAVSEmJpdERlcHRoTHVtYU1pbnVzOBI1ChdiaXRfZGVwdGhfY2hyb2'
    '1hX21pbnVzOBgHIAEoBVIUYml0RGVwdGhDaHJvbWFNaW51czgSOAoZbG9nMl9tYXhfZnJhbWVf'
    'bnVtX21pbnVzNBgIIAEoBVIVbG9nMk1heEZyYW1lTnVtTWludXM0EisKEnBpY19vcmRlcl9jbn'
    'RfdHlwZRgJIAEoBVIPcGljT3JkZXJDbnRUeXBlEkUKIGRlbHRhX3BpY19vcmRlcl9hbHdheXNf'
    'emVyb19mbGFnGAogASgFUhtkZWx0YVBpY09yZGVyQWx3YXlzWmVyb0ZsYWcSTQolbnVtX3JlZl'
    '9mcmFtZXNfaW5fcGljX29yZGVyX2NudF9jeWNsZRgLIAEoBVIebnVtUmVmRnJhbWVzSW5QaWNP'
    'cmRlckNudEN5Y2xlEi8KFG9mZnNldF9mb3JfcmVmX2ZyYW1lGAwgAygFUhFvZmZzZXRGb3JSZW'
    'ZGcmFtZRJGCiFsb2cyX21heF9waWNfb3JkZXJfY250X2xzYl9taW51czQYDSABKAVSG2xvZzJN'
    'YXhQaWNPcmRlckNudExzYk1pbnVzNBIrChJtYXhfbnVtX3JlZl9mcmFtZXMYDiABKAVSD21heE'
    '51bVJlZkZyYW1lcxI0ChdwaWNfd2lkdGhfaW5fbWJzX21pbnVzMRgPIAEoBVITcGljV2lkdGhJ'
    'bk1ic01pbnVzMRJBCh5waWNfaGVpZ2h0X2luX21hcF91bml0c19taW51czEYECABKAVSGXBpY0'
    'hlaWdodEluTWFwVW5pdHNNaW51czESLQoTZnJhbWVfbWJzX29ubHlfZmxhZxgRIAEoBVIQZnJh'
    'bWVNYnNPbmx5RmxhZxI+ChxtYl9hZGFwdGl2ZV9mcmFtZV9maWVsZF9mbGFnGBIgASgFUhhtYk'
    'FkYXB0aXZlRnJhbWVGaWVsZEZsYWcSLgoTZnJhbWVfY3JvcHBpbmdfZmxhZxgTIAEoBVIRZnJh'
    'bWVDcm9wcGluZ0ZsYWcSOwoac2VwYXJhdGVfY29sb3VyX3BsYW5lX2ZsYWcYFCABKAVSF3NlcG'
    'FyYXRlQ29sb3VyUGxhbmVGbGFnEjIKFm9mZnNldF9mb3Jfbm9uX3JlZl9waWMYFSABKAVSEm9m'
    'ZnNldEZvck5vblJlZlBpYxJBCh5vZmZzZXRfZm9yX3RvcF90b19ib3R0b21fZmllbGQYFiABKA'
    'VSGW9mZnNldEZvclRvcFRvQm90dG9tRmllbGQ=');

@$core.Deprecated('Use mALAVCPPSDescriptor instead')
const MALAVCPPS$json = {
  '1': 'MALAVCPPS',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '10': 'base'},
    {'1': 'pic_parameter_set_id', '3': 2, '4': 1, '5': 5, '10': 'picParameterSetId'},
    {'1': 'seq_parameter_set_id', '3': 3, '4': 1, '5': 5, '10': 'seqParameterSetId'},
    {'1': 'entropy_coding_mode_flag', '3': 4, '4': 1, '5': 5, '10': 'entropyCodingModeFlag'},
    {'1': 'bottom_field_pic_order_in_frame_present_flag', '3': 5, '4': 1, '5': 5, '10': 'bottomFieldPicOrderInFramePresentFlag'},
    {'1': 'redundant_pic_cnt_present_flag', '3': 6, '4': 1, '5': 5, '10': 'redundantPicCntPresentFlag'},
    {'1': 'weighted_pred_flag', '3': 7, '4': 1, '5': 5, '10': 'weightedPredFlag'},
    {'1': 'weighted_bipred_idc', '3': 8, '4': 1, '5': 5, '10': 'weightedBipredIdc'},
    {'1': 'deblocking_filter_control_present_flag', '3': 9, '4': 1, '5': 5, '10': 'deblockingFilterControlPresentFlag'},
    {'1': 'num_slice_groups_minus1', '3': 10, '4': 1, '5': 5, '10': 'numSliceGroupsMinus1'},
    {'1': 'slice_group_map_type', '3': 11, '4': 1, '5': 5, '10': 'sliceGroupMapType'},
    {'1': 'slice_group_change_rate_minus1', '3': 12, '4': 1, '5': 5, '10': 'sliceGroupChangeRateMinus1'},
    {'1': 'pic_size_in_map_units_minus1', '3': 13, '4': 1, '5': 5, '10': 'picSizeInMapUnitsMinus1'},
  ],
};

/// Descriptor for `MALAVCPPS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCPPSDescriptor = $convert.base64Decode(
    'CglNQUxBVkNQUFMSKAoEYmFzZRgBIAEoCzIULm1hbC5wcm90by5NQUxBVkNOYWxSBGJhc2USLw'
    'oUcGljX3BhcmFtZXRlcl9zZXRfaWQYAiABKAVSEXBpY1BhcmFtZXRlclNldElkEi8KFHNlcV9w'
    'YXJhbWV0ZXJfc2V0X2lkGAMgASgFUhFzZXFQYXJhbWV0ZXJTZXRJZBI3ChhlbnRyb3B5X2NvZG'
    'luZ19tb2RlX2ZsYWcYBCABKAVSFWVudHJvcHlDb2RpbmdNb2RlRmxhZxJbCixib3R0b21fZmll'
    'bGRfcGljX29yZGVyX2luX2ZyYW1lX3ByZXNlbnRfZmxhZxgFIAEoBVIlYm90dG9tRmllbGRQaW'
    'NPcmRlckluRnJhbWVQcmVzZW50RmxhZxJCCh5yZWR1bmRhbnRfcGljX2NudF9wcmVzZW50X2Zs'
    'YWcYBiABKAVSGnJlZHVuZGFudFBpY0NudFByZXNlbnRGbGFnEiwKEndlaWdodGVkX3ByZWRfZm'
    'xhZxgHIAEoBVIQd2VpZ2h0ZWRQcmVkRmxhZxIuChN3ZWlnaHRlZF9iaXByZWRfaWRjGAggASgF'
    'UhF3ZWlnaHRlZEJpcHJlZElkYxJSCiZkZWJsb2NraW5nX2ZpbHRlcl9jb250cm9sX3ByZXNlbn'
    'RfZmxhZxgJIAEoBVIiZGVibG9ja2luZ0ZpbHRlckNvbnRyb2xQcmVzZW50RmxhZxI1ChdudW1f'
    'c2xpY2VfZ3JvdXBzX21pbnVzMRgKIAEoBVIUbnVtU2xpY2VHcm91cHNNaW51czESLwoUc2xpY2'
    'VfZ3JvdXBfbWFwX3R5cGUYCyABKAVSEXNsaWNlR3JvdXBNYXBUeXBlEkIKHnNsaWNlX2dyb3Vw'
    'X2NoYW5nZV9yYXRlX21pbnVzMRgMIAEoBVIac2xpY2VHcm91cENoYW5nZVJhdGVNaW51czESPQ'
    'occGljX3NpemVfaW5fbWFwX3VuaXRzX21pbnVzMRgNIAEoBVIXcGljU2l6ZUluTWFwVW5pdHNN'
    'aW51czE=');

@$core.Deprecated('Use mALAVCSliceHeaderDescriptor instead')
const MALAVCSliceHeader$json = {
  '1': 'MALAVCSliceHeader',
  '2': [
    {'1': 'first_mb_in_slice', '3': 1, '4': 1, '5': 5, '10': 'firstMbInSlice'},
    {'1': 'slice_type', '3': 2, '4': 1, '5': 5, '10': 'sliceType'},
    {'1': 'colour_plane_id', '3': 3, '4': 1, '5': 5, '10': 'colourPlaneId'},
    {'1': 'pic_parameter_set_id', '3': 4, '4': 1, '5': 5, '10': 'picParameterSetId'},
    {'1': 'frame_num', '3': 5, '4': 1, '5': 5, '10': 'frameNum'},
    {'1': 'field_pic_flag', '3': 6, '4': 1, '5': 5, '10': 'fieldPicFlag'},
    {'1': 'bottom_field_flag', '3': 7, '4': 1, '5': 5, '10': 'bottomFieldFlag'},
    {'1': 'idr_pic_id', '3': 8, '4': 1, '5': 5, '10': 'idrPicId'},
    {'1': 'pic_order_cnt_lsb', '3': 9, '4': 1, '5': 5, '10': 'picOrderCntLsb'},
    {'1': 'delta_pic_order_cnt_bottom', '3': 10, '4': 1, '5': 5, '10': 'deltaPicOrderCntBottom'},
    {'1': 'delta_pic_order_cnt', '3': 11, '4': 3, '5': 5, '10': 'deltaPicOrderCnt'},
    {'1': 'slice_qp_delta', '3': 12, '4': 1, '5': 5, '10': 'sliceQpDelta'},
    {'1': 'num_ref_idx_active_override_flag', '3': 13, '4': 1, '5': 5, '10': 'numRefIdxActiveOverrideFlag'},
    {'1': 'num_ref_idx_l0_active_minus1', '3': 14, '4': 1, '5': 5, '10': 'numRefIdxL0ActiveMinus1'},
    {'1': 'num_ref_idx_l1_active_minus1', '3': 15, '4': 1, '5': 5, '10': 'numRefIdxL1ActiveMinus1'},
    {'1': 'memory_management_control_operation', '3': 16, '4': 1, '5': 5, '10': 'memoryManagementControlOperation'},
  ],
};

/// Descriptor for `MALAVCSliceHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCSliceHeaderDescriptor = $convert.base64Decode(
    'ChFNQUxBVkNTbGljZUhlYWRlchIpChFmaXJzdF9tYl9pbl9zbGljZRgBIAEoBVIOZmlyc3RNYk'
    'luU2xpY2USHQoKc2xpY2VfdHlwZRgCIAEoBVIJc2xpY2VUeXBlEiYKD2NvbG91cl9wbGFuZV9p'
    'ZBgDIAEoBVINY29sb3VyUGxhbmVJZBIvChRwaWNfcGFyYW1ldGVyX3NldF9pZBgEIAEoBVIRcG'
    'ljUGFyYW1ldGVyU2V0SWQSGwoJZnJhbWVfbnVtGAUgASgFUghmcmFtZU51bRIkCg5maWVsZF9w'
    'aWNfZmxhZxgGIAEoBVIMZmllbGRQaWNGbGFnEioKEWJvdHRvbV9maWVsZF9mbGFnGAcgASgFUg'
    '9ib3R0b21GaWVsZEZsYWcSHAoKaWRyX3BpY19pZBgIIAEoBVIIaWRyUGljSWQSKQoRcGljX29y'
    'ZGVyX2NudF9sc2IYCSABKAVSDnBpY09yZGVyQ250THNiEjoKGmRlbHRhX3BpY19vcmRlcl9jbn'
    'RfYm90dG9tGAogASgFUhZkZWx0YVBpY09yZGVyQ250Qm90dG9tEi0KE2RlbHRhX3BpY19vcmRl'
    'cl9jbnQYCyADKAVSEGRlbHRhUGljT3JkZXJDbnQSJAoOc2xpY2VfcXBfZGVsdGEYDCABKAVSDH'
    'NsaWNlUXBEZWx0YRJFCiBudW1fcmVmX2lkeF9hY3RpdmVfb3ZlcnJpZGVfZmxhZxgNIAEoBVIb'
    'bnVtUmVmSWR4QWN0aXZlT3ZlcnJpZGVGbGFnEj0KHG51bV9yZWZfaWR4X2wwX2FjdGl2ZV9taW'
    '51czEYDiABKAVSF251bVJlZklkeEwwQWN0aXZlTWludXMxEj0KHG51bV9yZWZfaWR4X2wxX2Fj'
    'dGl2ZV9taW51czEYDyABKAVSF251bVJlZklkeEwxQWN0aXZlTWludXMxEk0KI21lbW9yeV9tYW'
    '5hZ2VtZW50X2NvbnRyb2xfb3BlcmF0aW9uGBAgASgFUiBtZW1vcnlNYW5hZ2VtZW50Q29udHJv'
    'bE9wZXJhdGlvbg==');

@$core.Deprecated('Use mALAVCSliceWithOutPartitioningDescriptor instead')
const MALAVCSliceWithOutPartitioning$json = {
  '1': 'MALAVCSliceWithOutPartitioning',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '10': 'base'},
    {'1': 'header', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSliceHeader', '10': 'header'},
  ],
};

/// Descriptor for `MALAVCSliceWithOutPartitioning`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCSliceWithOutPartitioningDescriptor = $convert.base64Decode(
    'Ch5NQUxBVkNTbGljZVdpdGhPdXRQYXJ0aXRpb25pbmcSKAoEYmFzZRgBIAEoCzIULm1hbC5wcm'
    '90by5NQUxBVkNOYWxSBGJhc2USNAoGaGVhZGVyGAIgASgLMhwubWFsLnByb3RvLk1BTEFWQ1Ns'
    'aWNlSGVhZGVyUgZoZWFkZXI=');

@$core.Deprecated('Use mALAVCSlicePartitionADescriptor instead')
const MALAVCSlicePartitionA$json = {
  '1': 'MALAVCSlicePartitionA',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '10': 'base'},
    {'1': 'header', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSliceHeader', '10': 'header'},
  ],
};

/// Descriptor for `MALAVCSlicePartitionA`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCSlicePartitionADescriptor = $convert.base64Decode(
    'ChVNQUxBVkNTbGljZVBhcnRpdGlvbkESKAoEYmFzZRgBIAEoCzIULm1hbC5wcm90by5NQUxBVk'
    'NOYWxSBGJhc2USNAoGaGVhZGVyGAIgASgLMhwubWFsLnByb3RvLk1BTEFWQ1NsaWNlSGVhZGVy'
    'UgZoZWFkZXI=');

@$core.Deprecated('Use mALAVCSEIDescriptor instead')
const MALAVCSEI$json = {
  '1': 'MALAVCSEI',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '10': 'base'},
    {'1': 'messageList', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALSEIMessage', '10': 'messageList'},
  ],
  '4': [MALAVCSEI_MALAVCSEIType$json],
};

@$core.Deprecated('Use mALAVCSEIDescriptor instead')
const MALAVCSEI_MALAVCSEIType$json = {
  '1': 'MALAVCSEIType',
  '2': [
    {'1': 'buffering_period_', '2': 0},
    {'1': 'pic_timing', '2': 1},
    {'1': 'pan_scan_rect', '2': 2},
    {'1': 'filler_payload', '2': 3},
    {'1': 'user_data_registered_itu_t_t35', '2': 4},
    {'1': 'user_data_unregistered', '2': 5},
    {'1': 'recovery_point', '2': 6},
    {'1': 'dec_ref_pic_marking_repetition', '2': 7},
    {'1': 'spare_pic', '2': 8},
    {'1': 'scene_info', '2': 9},
    {'1': 'sub_seq_info', '2': 10},
    {'1': 'sub_seq_layer_characteristic', '2': 11},
    {'1': 'sub_seq_characteristics', '2': 12},
    {'1': 'full_frame_freeze', '2': 13},
    {'1': 'full_frame_freeze_release', '2': 14},
    {'1': 'full_frame_snapshot', '2': 15},
    {'1': 'progressive_refinement_segment_start', '2': 16},
    {'1': 'progressive_refinement_segment_end', '2': 17},
    {'1': 'motion_constrained_slice_group_set', '2': 18},
    {'1': 'film_grain_characteristics', '2': 19},
    {'1': 'deblocking_filter_display_preference', '2': 20},
    {'1': 'stereo_video_info', '2': 21},
    {'1': 'post_filter_hint', '2': 22},
    {'1': 'tone_mapping_info', '2': 23},
    {'1': 'scalability_info', '2': 24},
    {'1': 'sub_pic_scalable_layer', '2': 25},
    {'1': 'non_required_layer_rep', '2': 26},
    {'1': 'priority_layer_info', '2': 27},
    {'1': 'layers_not_present', '2': 28},
    {'1': 'layer_dependency_change', '2': 29},
    {'1': 'scalable_nesting', '2': 30},
    {'1': 'base_layer_temporal_hrd', '2': 31},
    {'1': 'quality_layer_integrity_check', '2': 32},
    {'1': 'redundant_pic_property', '2': 33},
    {'1': 'tl0_dep_rep_index', '2': 34},
    {'1': 'tl_switching_point', '2': 35},
    {'1': 'parallel_decoding_info', '2': 36},
    {'1': 'mvc_scalable_nesting', '2': 37},
    {'1': 'view_scalability_info', '2': 38},
    {'1': 'multiview_scene_info', '2': 39},
    {'1': 'multiview_acquisition_info', '2': 40},
    {'1': 'non_required_view_component', '2': 41},
    {'1': 'view_dependency_change', '2': 42},
    {'1': 'operation_points_not_present', '2': 43},
    {'1': 'base_view_temporal_hrd', '2': 44},
    {'1': 'frame_packing_arrangement', '2': 45},
    {'1': 'multiview_view_position', '2': 46},
    {'1': 'display_orientation', '2': 47},
    {'1': 'mvcd_scalable_nesting', '2': 48},
    {'1': 'mvcd_view_scalability_info', '2': 49},
    {'1': 'depth_representation_info', '2': 50},
    {'1': 'three_dimensional_reference_displays_info', '2': 51},
    {'1': 'depth_timing', '2': 52},
    {'1': 'depth_sampling_info', '2': 53},
    {'1': 'constrained_depth_parameter_set_identifier', '2': 54},
    {'1': 'green_metadata', '2': 56},
    {'1': 'mastering_display_colour_volume', '2': 137},
    {'1': 'colour_remapping_info', '2': 142},
    {'1': 'content_light_level_info', '2': 144},
    {'1': 'alternative_transfer_characteristics', '2': 147},
    {'1': 'ambient_viewing_environment', '2': 148},
    {'1': 'content_colour_volume', '2': 149},
    {'1': 'equirectangular_projection', '2': 150},
    {'1': 'cubemap_projection', '2': 151},
    {'1': 'sphere_rotation', '2': 154},
    {'1': 'regionwise_packing', '2': 155},
    {'1': 'omni_viewport', '2': 156},
    {'1': 'alternative_depth_info', '2': 181},
    {'1': 'sei_manifest', '2': 200},
    {'1': 'sei_prefix_indication', '2': 201},
    {'1': 'reserved_sei_message', '2': 9999},
  ],
};

/// Descriptor for `MALAVCSEI`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALAVCSEIDescriptor = $convert.base64Decode(
    'CglNQUxBVkNTRUkSKAoEYmFzZRgBIAEoCzIULm1hbC5wcm90by5NQUxBVkNOYWxSBGJhc2USOg'
    'oLbWVzc2FnZUxpc3QYAiADKAsyGC5tYWwucHJvdG8uTUFMU0VJTWVzc2FnZVILbWVzc2FnZUxp'
    'c3Qi2g8KDU1BTEFWQ1NFSVR5cGUSFQoRYnVmZmVyaW5nX3BlcmlvZF8QABIOCgpwaWNfdGltaW'
    '5nEAESEQoNcGFuX3NjYW5fcmVjdBACEhIKDmZpbGxlcl9wYXlsb2FkEAMSIgoedXNlcl9kYXRh'
    'X3JlZ2lzdGVyZWRfaXR1X3RfdDM1EAQSGgoWdXNlcl9kYXRhX3VucmVnaXN0ZXJlZBAFEhIKDn'
    'JlY292ZXJ5X3BvaW50EAYSIgoeZGVjX3JlZl9waWNfbWFya2luZ19yZXBldGl0aW9uEAcSDQoJ'
    'c3BhcmVfcGljEAgSDgoKc2NlbmVfaW5mbxAJEhAKDHN1Yl9zZXFfaW5mbxAKEiAKHHN1Yl9zZX'
    'FfbGF5ZXJfY2hhcmFjdGVyaXN0aWMQCxIbChdzdWJfc2VxX2NoYXJhY3RlcmlzdGljcxAMEhUK'
    'EWZ1bGxfZnJhbWVfZnJlZXplEA0SHQoZZnVsbF9mcmFtZV9mcmVlemVfcmVsZWFzZRAOEhcKE2'
    'Z1bGxfZnJhbWVfc25hcHNob3QQDxIoCiRwcm9ncmVzc2l2ZV9yZWZpbmVtZW50X3NlZ21lbnRf'
    'c3RhcnQQEBImCiJwcm9ncmVzc2l2ZV9yZWZpbmVtZW50X3NlZ21lbnRfZW5kEBESJgoibW90aW'
    '9uX2NvbnN0cmFpbmVkX3NsaWNlX2dyb3VwX3NldBASEh4KGmZpbG1fZ3JhaW5fY2hhcmFjdGVy'
    'aXN0aWNzEBMSKAokZGVibG9ja2luZ19maWx0ZXJfZGlzcGxheV9wcmVmZXJlbmNlEBQSFQoRc3'
    'RlcmVvX3ZpZGVvX2luZm8QFRIUChBwb3N0X2ZpbHRlcl9oaW50EBYSFQoRdG9uZV9tYXBwaW5n'
    'X2luZm8QFxIUChBzY2FsYWJpbGl0eV9pbmZvEBgSGgoWc3ViX3BpY19zY2FsYWJsZV9sYXllch'
    'AZEhoKFm5vbl9yZXF1aXJlZF9sYXllcl9yZXAQGhIXChNwcmlvcml0eV9sYXllcl9pbmZvEBsS'
    'FgoSbGF5ZXJzX25vdF9wcmVzZW50EBwSGwoXbGF5ZXJfZGVwZW5kZW5jeV9jaGFuZ2UQHRIUCh'
    'BzY2FsYWJsZV9uZXN0aW5nEB4SGwoXYmFzZV9sYXllcl90ZW1wb3JhbF9ocmQQHxIhCh1xdWFs'
    'aXR5X2xheWVyX2ludGVncml0eV9jaGVjaxAgEhoKFnJlZHVuZGFudF9waWNfcHJvcGVydHkQIR'
    'IVChF0bDBfZGVwX3JlcF9pbmRleBAiEhYKEnRsX3N3aXRjaGluZ19wb2ludBAjEhoKFnBhcmFs'
    'bGVsX2RlY29kaW5nX2luZm8QJBIYChRtdmNfc2NhbGFibGVfbmVzdGluZxAlEhkKFXZpZXdfc2'
    'NhbGFiaWxpdHlfaW5mbxAmEhgKFG11bHRpdmlld19zY2VuZV9pbmZvECcSHgoabXVsdGl2aWV3'
    'X2FjcXVpc2l0aW9uX2luZm8QKBIfChtub25fcmVxdWlyZWRfdmlld19jb21wb25lbnQQKRIaCh'
    'Z2aWV3X2RlcGVuZGVuY3lfY2hhbmdlECoSIAocb3BlcmF0aW9uX3BvaW50c19ub3RfcHJlc2Vu'
    'dBArEhoKFmJhc2Vfdmlld190ZW1wb3JhbF9ocmQQLBIdChlmcmFtZV9wYWNraW5nX2FycmFuZ2'
    'VtZW50EC0SGwoXbXVsdGl2aWV3X3ZpZXdfcG9zaXRpb24QLhIXChNkaXNwbGF5X29yaWVudGF0'
    'aW9uEC8SGQoVbXZjZF9zY2FsYWJsZV9uZXN0aW5nEDASHgoabXZjZF92aWV3X3NjYWxhYmlsaX'
    'R5X2luZm8QMRIdChlkZXB0aF9yZXByZXNlbnRhdGlvbl9pbmZvEDISLQopdGhyZWVfZGltZW5z'
    'aW9uYWxfcmVmZXJlbmNlX2Rpc3BsYXlzX2luZm8QMxIQCgxkZXB0aF90aW1pbmcQNBIXChNkZX'
    'B0aF9zYW1wbGluZ19pbmZvEDUSLgoqY29uc3RyYWluZWRfZGVwdGhfcGFyYW1ldGVyX3NldF9p'
    'ZGVudGlmaWVyEDYSEgoOZ3JlZW5fbWV0YWRhdGEQOBIkCh9tYXN0ZXJpbmdfZGlzcGxheV9jb2'
    'xvdXJfdm9sdW1lEIkBEhoKFWNvbG91cl9yZW1hcHBpbmdfaW5mbxCOARIdChhjb250ZW50X2xp'
    'Z2h0X2xldmVsX2luZm8QkAESKQokYWx0ZXJuYXRpdmVfdHJhbnNmZXJfY2hhcmFjdGVyaXN0aW'
    'NzEJMBEiAKG2FtYmllbnRfdmlld2luZ19lbnZpcm9ubWVudBCUARIaChVjb250ZW50X2NvbG91'
    'cl92b2x1bWUQlQESHwoaZXF1aXJlY3Rhbmd1bGFyX3Byb2plY3Rpb24QlgESFwoSY3ViZW1hcF'
    '9wcm9qZWN0aW9uEJcBEhQKD3NwaGVyZV9yb3RhdGlvbhCaARIXChJyZWdpb253aXNlX3BhY2tp'
    'bmcQmwESEgoNb21uaV92aWV3cG9ydBCcARIbChZhbHRlcm5hdGl2ZV9kZXB0aF9pbmZvELUBEh'
    'EKDHNlaV9tYW5pZmVzdBDIARIaChVzZWlfcHJlZml4X2luZGljYXRpb24QyQESGQoUcmVzZXJ2'
    'ZWRfc2VpX21lc3NhZ2UQj04=');

@$core.Deprecated('Use mALPSCellDescriptor instead')
const MALPSCell$json = {
  '1': 'MALPSCell',
  '2': [
    {'1': 'enable', '3': 1, '4': 1, '5': 8, '10': 'enable'},
    {'1': 'val', '3': 2, '4': 1, '5': 9, '10': 'val'},
  ],
};

/// Descriptor for `MALPSCell`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALPSCellDescriptor = $convert.base64Decode(
    'CglNQUxQU0NlbGwSFgoGZW5hYmxlGAEgASgIUgZlbmFibGUSEAoDdmFsGAIgASgJUgN2YWw=');

@$core.Deprecated('Use mALPSItemDescriptor instead')
const MALPSItem$json = {
  '1': 'MALPSItem',
  '2': [
    {'1': 'childs', '3': 1, '4': 3, '5': 11, '6': '.mal.proto.MALPSItem', '10': 'childs'},
    {'1': 'cells', '3': 2, '4': 3, '5': 11, '6': '.mal.proto.MALPSCell', '10': 'cells'},
  ],
};

/// Descriptor for `MALPSItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALPSItemDescriptor = $convert.base64Decode(
    'CglNQUxQU0l0ZW0SLAoGY2hpbGRzGAEgAygLMhQubWFsLnByb3RvLk1BTFBTSXRlbVIGY2hpbG'
    'RzEioKBWNlbGxzGAIgAygLMhQubWFsLnByb3RvLk1BTFBTQ2VsbFIFY2VsbHM=');

@$core.Deprecated('Use mALPacketNalDescriptor instead')
const MALPacketNal$json = {
  '1': 'MALPacketNal',
  '2': [
    {'1': 'hevc_nal', '3': 1, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCNal', '9': 0, '10': 'hevcNal'},
    {'1': 'hevc_vps', '3': 2, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCVPS', '9': 0, '10': 'hevcVps'},
    {'1': 'hevc_sps', '3': 3, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCSPS', '9': 0, '10': 'hevcSps'},
    {'1': 'hevc_pps', '3': 4, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCPPS', '9': 0, '10': 'hevcPps'},
    {'1': 'hevc_sei', '3': 5, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCSEI', '9': 0, '10': 'hevcSei'},
    {'1': 'hevc_rbsp', '3': 6, '4': 1, '5': 11, '6': '.mal.proto.MALHEVCSliceSegmentLayerRbsp', '9': 0, '10': 'hevcRbsp'},
    {'1': 'avc_nal', '3': 7, '4': 1, '5': 11, '6': '.mal.proto.MALAVCNal', '9': 0, '10': 'avcNal'},
    {'1': 'avc_sps', '3': 8, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSPS', '9': 0, '10': 'avcSps'},
    {'1': 'avc_pps', '3': 9, '4': 1, '5': 11, '6': '.mal.proto.MALAVCPPS', '9': 0, '10': 'avcPps'},
    {'1': 'avc_out_rbsp', '3': 10, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSliceWithOutPartitioning', '9': 0, '10': 'avcOutRbsp'},
    {'1': 'avc_part_a_rbsp', '3': 11, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSlicePartitionA', '9': 0, '10': 'avcPartARbsp'},
    {'1': 'avc_sei', '3': 12, '4': 1, '5': 11, '6': '.mal.proto.MALAVCSEI', '9': 0, '10': 'avcSei'},
    {'1': 'display_fields', '3': 13, '4': 3, '5': 11, '6': '.mal.proto.MALAtomField', '10': 'displayFields'},
  ],
  '8': [
    {'1': 'nal'},
  ],
};

/// Descriptor for `MALPacketNal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mALPacketNalDescriptor = $convert.base64Decode(
    'CgxNQUxQYWNrZXROYWwSMgoIaGV2Y19uYWwYASABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ05hbE'
    'gAUgdoZXZjTmFsEjIKCGhldmNfdnBzGAIgASgLMhUubWFsLnByb3RvLk1BTEhFVkNWUFNIAFIH'
    'aGV2Y1ZwcxIyCghoZXZjX3NwcxgDIAEoCzIVLm1hbC5wcm90by5NQUxIRVZDU1BTSABSB2hldm'
    'NTcHMSMgoIaGV2Y19wcHMYBCABKAsyFS5tYWwucHJvdG8uTUFMSEVWQ1BQU0gAUgdoZXZjUHBz'
    'EjIKCGhldmNfc2VpGAUgASgLMhUubWFsLnByb3RvLk1BTEhFVkNTRUlIAFIHaGV2Y1NlaRJGCg'
    'loZXZjX3Jic3AYBiABKAsyJy5tYWwucHJvdG8uTUFMSEVWQ1NsaWNlU2VnbWVudExheWVyUmJz'
    'cEgAUghoZXZjUmJzcBIvCgdhdmNfbmFsGAcgASgLMhQubWFsLnByb3RvLk1BTEFWQ05hbEgAUg'
    'ZhdmNOYWwSLwoHYXZjX3NwcxgIIAEoCzIULm1hbC5wcm90by5NQUxBVkNTUFNIAFIGYXZjU3Bz'
    'Ei8KB2F2Y19wcHMYCSABKAsyFC5tYWwucHJvdG8uTUFMQVZDUFBTSABSBmF2Y1BwcxJNCgxhdm'
    'Nfb3V0X3Jic3AYCiABKAsyKS5tYWwucHJvdG8uTUFMQVZDU2xpY2VXaXRoT3V0UGFydGl0aW9u'
    'aW5nSABSCmF2Y091dFJic3ASSQoPYXZjX3BhcnRfYV9yYnNwGAsgASgLMiAubWFsLnByb3RvLk'
    '1BTEFWQ1NsaWNlUGFydGl0aW9uQUgAUgxhdmNQYXJ0QVJic3ASLwoHYXZjX3NlaRgMIAEoCzIU'
    'Lm1hbC5wcm90by5NQUxBVkNTRUlIAFIGYXZjU2VpEj4KDmRpc3BsYXlfZmllbGRzGA0gAygLMh'
    'cubWFsLnByb3RvLk1BTEF0b21GaWVsZFINZGlzcGxheUZpZWxkc0IFCgNuYWw=');

