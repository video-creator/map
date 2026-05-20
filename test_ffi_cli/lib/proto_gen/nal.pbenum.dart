//
//  Generated code. Do not modify.
//  source: nal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MALHEVCSEI_MALHEVCSEIType extends $pb.ProtobufEnum {
  static const MALHEVCSEI_MALHEVCSEIType buffering_period_ = MALHEVCSEI_MALHEVCSEIType._(0, _omitEnumNames ? '' : 'buffering_period_');
  static const MALHEVCSEI_MALHEVCSEIType pic_timing = MALHEVCSEI_MALHEVCSEIType._(1, _omitEnumNames ? '' : 'pic_timing');
  static const MALHEVCSEI_MALHEVCSEIType pan_scan_rect = MALHEVCSEI_MALHEVCSEIType._(2, _omitEnumNames ? '' : 'pan_scan_rect');
  static const MALHEVCSEI_MALHEVCSEIType filler_payload = MALHEVCSEI_MALHEVCSEIType._(3, _omitEnumNames ? '' : 'filler_payload');
  static const MALHEVCSEI_MALHEVCSEIType user_data_registered_itu_t_t35 = MALHEVCSEI_MALHEVCSEIType._(4, _omitEnumNames ? '' : 'user_data_registered_itu_t_t35');
  static const MALHEVCSEI_MALHEVCSEIType user_data_unregistered = MALHEVCSEI_MALHEVCSEIType._(5, _omitEnumNames ? '' : 'user_data_unregistered');
  static const MALHEVCSEI_MALHEVCSEIType recovery_point = MALHEVCSEI_MALHEVCSEIType._(6, _omitEnumNames ? '' : 'recovery_point');
  static const MALHEVCSEI_MALHEVCSEIType scene_info = MALHEVCSEI_MALHEVCSEIType._(9, _omitEnumNames ? '' : 'scene_info');
  static const MALHEVCSEI_MALHEVCSEIType picture_snapshot = MALHEVCSEI_MALHEVCSEIType._(15, _omitEnumNames ? '' : 'picture_snapshot');
  static const MALHEVCSEI_MALHEVCSEIType progressive_refinement_segment_start = MALHEVCSEI_MALHEVCSEIType._(16, _omitEnumNames ? '' : 'progressive_refinement_segment_start');
  static const MALHEVCSEI_MALHEVCSEIType progressive_refinement_segment_end = MALHEVCSEI_MALHEVCSEIType._(17, _omitEnumNames ? '' : 'progressive_refinement_segment_end');
  static const MALHEVCSEI_MALHEVCSEIType film_grain_characteristics = MALHEVCSEI_MALHEVCSEIType._(19, _omitEnumNames ? '' : 'film_grain_characteristics');
  static const MALHEVCSEI_MALHEVCSEIType post_filter_hint = MALHEVCSEI_MALHEVCSEIType._(22, _omitEnumNames ? '' : 'post_filter_hint');
  static const MALHEVCSEI_MALHEVCSEIType tone_mapping_info = MALHEVCSEI_MALHEVCSEIType._(23, _omitEnumNames ? '' : 'tone_mapping_info');
  static const MALHEVCSEI_MALHEVCSEIType frame_packing_arrangement = MALHEVCSEI_MALHEVCSEIType._(45, _omitEnumNames ? '' : 'frame_packing_arrangement');
  static const MALHEVCSEI_MALHEVCSEIType display_orientation = MALHEVCSEI_MALHEVCSEIType._(47, _omitEnumNames ? '' : 'display_orientation');
  static const MALHEVCSEI_MALHEVCSEIType green_metadata = MALHEVCSEI_MALHEVCSEIType._(56, _omitEnumNames ? '' : 'green_metadata');
  static const MALHEVCSEI_MALHEVCSEIType structure_of_pictures_info = MALHEVCSEI_MALHEVCSEIType._(128, _omitEnumNames ? '' : 'structure_of_pictures_info');
  static const MALHEVCSEI_MALHEVCSEIType active_parameter_sets = MALHEVCSEI_MALHEVCSEIType._(129, _omitEnumNames ? '' : 'active_parameter_sets');
  static const MALHEVCSEI_MALHEVCSEIType decoding_unit_info = MALHEVCSEI_MALHEVCSEIType._(130, _omitEnumNames ? '' : 'decoding_unit_info');
  static const MALHEVCSEI_MALHEVCSEIType temporal_sub_layer_zero_index = MALHEVCSEI_MALHEVCSEIType._(131, _omitEnumNames ? '' : 'temporal_sub_layer_zero_index');
  static const MALHEVCSEI_MALHEVCSEIType decoded_picture_hash = MALHEVCSEI_MALHEVCSEIType._(132, _omitEnumNames ? '' : 'decoded_picture_hash');
  static const MALHEVCSEI_MALHEVCSEIType scalable_nesting = MALHEVCSEI_MALHEVCSEIType._(133, _omitEnumNames ? '' : 'scalable_nesting');
  static const MALHEVCSEI_MALHEVCSEIType region_refresh_info = MALHEVCSEI_MALHEVCSEIType._(134, _omitEnumNames ? '' : 'region_refresh_info');
  static const MALHEVCSEI_MALHEVCSEIType no_display = MALHEVCSEI_MALHEVCSEIType._(135, _omitEnumNames ? '' : 'no_display');
  static const MALHEVCSEI_MALHEVCSEIType time_code = MALHEVCSEI_MALHEVCSEIType._(136, _omitEnumNames ? '' : 'time_code');
  static const MALHEVCSEI_MALHEVCSEIType mastering_display_colour_volume = MALHEVCSEI_MALHEVCSEIType._(137, _omitEnumNames ? '' : 'mastering_display_colour_volume');
  static const MALHEVCSEI_MALHEVCSEIType segmented_rect_frame_packing_arrangement = MALHEVCSEI_MALHEVCSEIType._(138, _omitEnumNames ? '' : 'segmented_rect_frame_packing_arrangement');
  static const MALHEVCSEI_MALHEVCSEIType temporal_motion_constrained_tile_sets = MALHEVCSEI_MALHEVCSEIType._(139, _omitEnumNames ? '' : 'temporal_motion_constrained_tile_sets');
  static const MALHEVCSEI_MALHEVCSEIType chroma_resampling_filter_hint = MALHEVCSEI_MALHEVCSEIType._(140, _omitEnumNames ? '' : 'chroma_resampling_filter_hint');
  static const MALHEVCSEI_MALHEVCSEIType knee_function_info = MALHEVCSEI_MALHEVCSEIType._(141, _omitEnumNames ? '' : 'knee_function_info');
  static const MALHEVCSEI_MALHEVCSEIType colour_remapping_info = MALHEVCSEI_MALHEVCSEIType._(142, _omitEnumNames ? '' : 'colour_remapping_info');
  static const MALHEVCSEI_MALHEVCSEIType deinterlaced_field_identification = MALHEVCSEI_MALHEVCSEIType._(143, _omitEnumNames ? '' : 'deinterlaced_field_identification');
  static const MALHEVCSEI_MALHEVCSEIType content_light_level_info = MALHEVCSEI_MALHEVCSEIType._(144, _omitEnumNames ? '' : 'content_light_level_info');
  static const MALHEVCSEI_MALHEVCSEIType dependent_rap_indication = MALHEVCSEI_MALHEVCSEIType._(145, _omitEnumNames ? '' : 'dependent_rap_indication');
  static const MALHEVCSEI_MALHEVCSEIType coded_region_completion = MALHEVCSEI_MALHEVCSEIType._(146, _omitEnumNames ? '' : 'coded_region_completion');
  static const MALHEVCSEI_MALHEVCSEIType alternative_transfer_characteristics = MALHEVCSEI_MALHEVCSEIType._(147, _omitEnumNames ? '' : 'alternative_transfer_characteristics');
  static const MALHEVCSEI_MALHEVCSEIType ambient_viewing_environment = MALHEVCSEI_MALHEVCSEIType._(148, _omitEnumNames ? '' : 'ambient_viewing_environment');
  static const MALHEVCSEI_MALHEVCSEIType content_colour_volume = MALHEVCSEI_MALHEVCSEIType._(149, _omitEnumNames ? '' : 'content_colour_volume');
  static const MALHEVCSEI_MALHEVCSEIType equirectangular_projection = MALHEVCSEI_MALHEVCSEIType._(150, _omitEnumNames ? '' : 'equirectangular_projection');
  static const MALHEVCSEI_MALHEVCSEIType cubemap_projection = MALHEVCSEI_MALHEVCSEIType._(151, _omitEnumNames ? '' : 'cubemap_projection');
  static const MALHEVCSEI_MALHEVCSEIType fisheye_video_info = MALHEVCSEI_MALHEVCSEIType._(152, _omitEnumNames ? '' : 'fisheye_video_info');
  static const MALHEVCSEI_MALHEVCSEIType sphere_rotation = MALHEVCSEI_MALHEVCSEIType._(154, _omitEnumNames ? '' : 'sphere_rotation');
  static const MALHEVCSEI_MALHEVCSEIType regionwise_packing = MALHEVCSEI_MALHEVCSEIType._(155, _omitEnumNames ? '' : 'regionwise_packing');
  static const MALHEVCSEI_MALHEVCSEIType omni_viewport = MALHEVCSEI_MALHEVCSEIType._(156, _omitEnumNames ? '' : 'omni_viewport');
  static const MALHEVCSEI_MALHEVCSEIType regional_nesting = MALHEVCSEI_MALHEVCSEIType._(157, _omitEnumNames ? '' : 'regional_nesting');
  static const MALHEVCSEI_MALHEVCSEIType mcts_extraction_info_sets = MALHEVCSEI_MALHEVCSEIType._(158, _omitEnumNames ? '' : 'mcts_extraction_info_sets');
  static const MALHEVCSEI_MALHEVCSEIType mcts_extraction_info_nesting = MALHEVCSEI_MALHEVCSEIType._(159, _omitEnumNames ? '' : 'mcts_extraction_info_nesting');
  static const MALHEVCSEI_MALHEVCSEIType layers_not_present = MALHEVCSEI_MALHEVCSEIType._(160, _omitEnumNames ? '' : 'layers_not_present');
  static const MALHEVCSEI_MALHEVCSEIType inter_layer_constrained_tile_sets = MALHEVCSEI_MALHEVCSEIType._(161, _omitEnumNames ? '' : 'inter_layer_constrained_tile_sets');
  static const MALHEVCSEI_MALHEVCSEIType bsp_nesting = MALHEVCSEI_MALHEVCSEIType._(162, _omitEnumNames ? '' : 'bsp_nesting');
  static const MALHEVCSEI_MALHEVCSEIType bsp_initial_arrival_time = MALHEVCSEI_MALHEVCSEIType._(163, _omitEnumNames ? '' : 'bsp_initial_arrival_time');
  static const MALHEVCSEI_MALHEVCSEIType sub_bitstream_property = MALHEVCSEI_MALHEVCSEIType._(164, _omitEnumNames ? '' : 'sub_bitstream_property');
  static const MALHEVCSEI_MALHEVCSEIType alpha_channel_info = MALHEVCSEI_MALHEVCSEIType._(165, _omitEnumNames ? '' : 'alpha_channel_info');
  static const MALHEVCSEI_MALHEVCSEIType overlay_info = MALHEVCSEI_MALHEVCSEIType._(166, _omitEnumNames ? '' : 'overlay_info');
  static const MALHEVCSEI_MALHEVCSEIType temporal_mv_prediction_constraints = MALHEVCSEI_MALHEVCSEIType._(167, _omitEnumNames ? '' : 'temporal_mv_prediction_constraints');
  static const MALHEVCSEI_MALHEVCSEIType frame_field_info = MALHEVCSEI_MALHEVCSEIType._(168, _omitEnumNames ? '' : 'frame_field_info');
  static const MALHEVCSEI_MALHEVCSEIType three_dimensional_reference_displays_info = MALHEVCSEI_MALHEVCSEIType._(176, _omitEnumNames ? '' : 'three_dimensional_reference_displays_info');
  static const MALHEVCSEI_MALHEVCSEIType depth_representation_info = MALHEVCSEI_MALHEVCSEIType._(177, _omitEnumNames ? '' : 'depth_representation_info');
  static const MALHEVCSEI_MALHEVCSEIType multiview_scene_info = MALHEVCSEI_MALHEVCSEIType._(178, _omitEnumNames ? '' : 'multiview_scene_info');
  static const MALHEVCSEI_MALHEVCSEIType multiview_acquisition_info = MALHEVCSEI_MALHEVCSEIType._(179, _omitEnumNames ? '' : 'multiview_acquisition_info');
  static const MALHEVCSEI_MALHEVCSEIType multiview_view_position = MALHEVCSEI_MALHEVCSEIType._(180, _omitEnumNames ? '' : 'multiview_view_position');
  static const MALHEVCSEI_MALHEVCSEIType alternative_depth_info = MALHEVCSEI_MALHEVCSEIType._(181, _omitEnumNames ? '' : 'alternative_depth_info');
  static const MALHEVCSEI_MALHEVCSEIType sei_manifest = MALHEVCSEI_MALHEVCSEIType._(200, _omitEnumNames ? '' : 'sei_manifest');
  static const MALHEVCSEI_MALHEVCSEIType sei_prefix_indication = MALHEVCSEI_MALHEVCSEIType._(201, _omitEnumNames ? '' : 'sei_prefix_indication');
  static const MALHEVCSEI_MALHEVCSEIType annotated_regions = MALHEVCSEI_MALHEVCSEIType._(202, _omitEnumNames ? '' : 'annotated_regions');
  static const MALHEVCSEI_MALHEVCSEIType shutter_interval_info = MALHEVCSEI_MALHEVCSEIType._(205, _omitEnumNames ? '' : 'shutter_interval_info');
  static const MALHEVCSEI_MALHEVCSEIType reserved_sei_message = MALHEVCSEI_MALHEVCSEIType._(9999, _omitEnumNames ? '' : 'reserved_sei_message');

  static const $core.List<MALHEVCSEI_MALHEVCSEIType> values = <MALHEVCSEI_MALHEVCSEIType> [
    buffering_period_,
    pic_timing,
    pan_scan_rect,
    filler_payload,
    user_data_registered_itu_t_t35,
    user_data_unregistered,
    recovery_point,
    scene_info,
    picture_snapshot,
    progressive_refinement_segment_start,
    progressive_refinement_segment_end,
    film_grain_characteristics,
    post_filter_hint,
    tone_mapping_info,
    frame_packing_arrangement,
    display_orientation,
    green_metadata,
    structure_of_pictures_info,
    active_parameter_sets,
    decoding_unit_info,
    temporal_sub_layer_zero_index,
    decoded_picture_hash,
    scalable_nesting,
    region_refresh_info,
    no_display,
    time_code,
    mastering_display_colour_volume,
    segmented_rect_frame_packing_arrangement,
    temporal_motion_constrained_tile_sets,
    chroma_resampling_filter_hint,
    knee_function_info,
    colour_remapping_info,
    deinterlaced_field_identification,
    content_light_level_info,
    dependent_rap_indication,
    coded_region_completion,
    alternative_transfer_characteristics,
    ambient_viewing_environment,
    content_colour_volume,
    equirectangular_projection,
    cubemap_projection,
    fisheye_video_info,
    sphere_rotation,
    regionwise_packing,
    omni_viewport,
    regional_nesting,
    mcts_extraction_info_sets,
    mcts_extraction_info_nesting,
    layers_not_present,
    inter_layer_constrained_tile_sets,
    bsp_nesting,
    bsp_initial_arrival_time,
    sub_bitstream_property,
    alpha_channel_info,
    overlay_info,
    temporal_mv_prediction_constraints,
    frame_field_info,
    three_dimensional_reference_displays_info,
    depth_representation_info,
    multiview_scene_info,
    multiview_acquisition_info,
    multiview_view_position,
    alternative_depth_info,
    sei_manifest,
    sei_prefix_indication,
    annotated_regions,
    shutter_interval_info,
    reserved_sei_message,
  ];

  static final $core.Map<$core.int, MALHEVCSEI_MALHEVCSEIType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALHEVCSEI_MALHEVCSEIType? valueOf($core.int value) => _byValue[value];

  const MALHEVCSEI_MALHEVCSEIType._($core.int v, $core.String n) : super(v, n);
}

class MALAVCSEI_MALAVCSEIType extends $pb.ProtobufEnum {
  static const MALAVCSEI_MALAVCSEIType buffering_period_ = MALAVCSEI_MALAVCSEIType._(0, _omitEnumNames ? '' : 'buffering_period_');
  static const MALAVCSEI_MALAVCSEIType pic_timing = MALAVCSEI_MALAVCSEIType._(1, _omitEnumNames ? '' : 'pic_timing');
  static const MALAVCSEI_MALAVCSEIType pan_scan_rect = MALAVCSEI_MALAVCSEIType._(2, _omitEnumNames ? '' : 'pan_scan_rect');
  static const MALAVCSEI_MALAVCSEIType filler_payload = MALAVCSEI_MALAVCSEIType._(3, _omitEnumNames ? '' : 'filler_payload');
  static const MALAVCSEI_MALAVCSEIType user_data_registered_itu_t_t35 = MALAVCSEI_MALAVCSEIType._(4, _omitEnumNames ? '' : 'user_data_registered_itu_t_t35');
  static const MALAVCSEI_MALAVCSEIType user_data_unregistered = MALAVCSEI_MALAVCSEIType._(5, _omitEnumNames ? '' : 'user_data_unregistered');
  static const MALAVCSEI_MALAVCSEIType recovery_point = MALAVCSEI_MALAVCSEIType._(6, _omitEnumNames ? '' : 'recovery_point');
  static const MALAVCSEI_MALAVCSEIType dec_ref_pic_marking_repetition = MALAVCSEI_MALAVCSEIType._(7, _omitEnumNames ? '' : 'dec_ref_pic_marking_repetition');
  static const MALAVCSEI_MALAVCSEIType spare_pic = MALAVCSEI_MALAVCSEIType._(8, _omitEnumNames ? '' : 'spare_pic');
  static const MALAVCSEI_MALAVCSEIType scene_info = MALAVCSEI_MALAVCSEIType._(9, _omitEnumNames ? '' : 'scene_info');
  static const MALAVCSEI_MALAVCSEIType sub_seq_info = MALAVCSEI_MALAVCSEIType._(10, _omitEnumNames ? '' : 'sub_seq_info');
  static const MALAVCSEI_MALAVCSEIType sub_seq_layer_characteristic = MALAVCSEI_MALAVCSEIType._(11, _omitEnumNames ? '' : 'sub_seq_layer_characteristic');
  static const MALAVCSEI_MALAVCSEIType sub_seq_characteristics = MALAVCSEI_MALAVCSEIType._(12, _omitEnumNames ? '' : 'sub_seq_characteristics');
  static const MALAVCSEI_MALAVCSEIType full_frame_freeze = MALAVCSEI_MALAVCSEIType._(13, _omitEnumNames ? '' : 'full_frame_freeze');
  static const MALAVCSEI_MALAVCSEIType full_frame_freeze_release = MALAVCSEI_MALAVCSEIType._(14, _omitEnumNames ? '' : 'full_frame_freeze_release');
  static const MALAVCSEI_MALAVCSEIType full_frame_snapshot = MALAVCSEI_MALAVCSEIType._(15, _omitEnumNames ? '' : 'full_frame_snapshot');
  static const MALAVCSEI_MALAVCSEIType progressive_refinement_segment_start = MALAVCSEI_MALAVCSEIType._(16, _omitEnumNames ? '' : 'progressive_refinement_segment_start');
  static const MALAVCSEI_MALAVCSEIType progressive_refinement_segment_end = MALAVCSEI_MALAVCSEIType._(17, _omitEnumNames ? '' : 'progressive_refinement_segment_end');
  static const MALAVCSEI_MALAVCSEIType motion_constrained_slice_group_set = MALAVCSEI_MALAVCSEIType._(18, _omitEnumNames ? '' : 'motion_constrained_slice_group_set');
  static const MALAVCSEI_MALAVCSEIType film_grain_characteristics = MALAVCSEI_MALAVCSEIType._(19, _omitEnumNames ? '' : 'film_grain_characteristics');
  static const MALAVCSEI_MALAVCSEIType deblocking_filter_display_preference = MALAVCSEI_MALAVCSEIType._(20, _omitEnumNames ? '' : 'deblocking_filter_display_preference');
  static const MALAVCSEI_MALAVCSEIType stereo_video_info = MALAVCSEI_MALAVCSEIType._(21, _omitEnumNames ? '' : 'stereo_video_info');
  static const MALAVCSEI_MALAVCSEIType post_filter_hint = MALAVCSEI_MALAVCSEIType._(22, _omitEnumNames ? '' : 'post_filter_hint');
  static const MALAVCSEI_MALAVCSEIType tone_mapping_info = MALAVCSEI_MALAVCSEIType._(23, _omitEnumNames ? '' : 'tone_mapping_info');
  static const MALAVCSEI_MALAVCSEIType scalability_info = MALAVCSEI_MALAVCSEIType._(24, _omitEnumNames ? '' : 'scalability_info');
  static const MALAVCSEI_MALAVCSEIType sub_pic_scalable_layer = MALAVCSEI_MALAVCSEIType._(25, _omitEnumNames ? '' : 'sub_pic_scalable_layer');
  static const MALAVCSEI_MALAVCSEIType non_required_layer_rep = MALAVCSEI_MALAVCSEIType._(26, _omitEnumNames ? '' : 'non_required_layer_rep');
  static const MALAVCSEI_MALAVCSEIType priority_layer_info = MALAVCSEI_MALAVCSEIType._(27, _omitEnumNames ? '' : 'priority_layer_info');
  static const MALAVCSEI_MALAVCSEIType layers_not_present = MALAVCSEI_MALAVCSEIType._(28, _omitEnumNames ? '' : 'layers_not_present');
  static const MALAVCSEI_MALAVCSEIType layer_dependency_change = MALAVCSEI_MALAVCSEIType._(29, _omitEnumNames ? '' : 'layer_dependency_change');
  static const MALAVCSEI_MALAVCSEIType scalable_nesting = MALAVCSEI_MALAVCSEIType._(30, _omitEnumNames ? '' : 'scalable_nesting');
  static const MALAVCSEI_MALAVCSEIType base_layer_temporal_hrd = MALAVCSEI_MALAVCSEIType._(31, _omitEnumNames ? '' : 'base_layer_temporal_hrd');
  static const MALAVCSEI_MALAVCSEIType quality_layer_integrity_check = MALAVCSEI_MALAVCSEIType._(32, _omitEnumNames ? '' : 'quality_layer_integrity_check');
  static const MALAVCSEI_MALAVCSEIType redundant_pic_property = MALAVCSEI_MALAVCSEIType._(33, _omitEnumNames ? '' : 'redundant_pic_property');
  static const MALAVCSEI_MALAVCSEIType tl0_dep_rep_index = MALAVCSEI_MALAVCSEIType._(34, _omitEnumNames ? '' : 'tl0_dep_rep_index');
  static const MALAVCSEI_MALAVCSEIType tl_switching_point = MALAVCSEI_MALAVCSEIType._(35, _omitEnumNames ? '' : 'tl_switching_point');
  static const MALAVCSEI_MALAVCSEIType parallel_decoding_info = MALAVCSEI_MALAVCSEIType._(36, _omitEnumNames ? '' : 'parallel_decoding_info');
  static const MALAVCSEI_MALAVCSEIType mvc_scalable_nesting = MALAVCSEI_MALAVCSEIType._(37, _omitEnumNames ? '' : 'mvc_scalable_nesting');
  static const MALAVCSEI_MALAVCSEIType view_scalability_info = MALAVCSEI_MALAVCSEIType._(38, _omitEnumNames ? '' : 'view_scalability_info');
  static const MALAVCSEI_MALAVCSEIType multiview_scene_info = MALAVCSEI_MALAVCSEIType._(39, _omitEnumNames ? '' : 'multiview_scene_info');
  static const MALAVCSEI_MALAVCSEIType multiview_acquisition_info = MALAVCSEI_MALAVCSEIType._(40, _omitEnumNames ? '' : 'multiview_acquisition_info');
  static const MALAVCSEI_MALAVCSEIType non_required_view_component = MALAVCSEI_MALAVCSEIType._(41, _omitEnumNames ? '' : 'non_required_view_component');
  static const MALAVCSEI_MALAVCSEIType view_dependency_change = MALAVCSEI_MALAVCSEIType._(42, _omitEnumNames ? '' : 'view_dependency_change');
  static const MALAVCSEI_MALAVCSEIType operation_points_not_present = MALAVCSEI_MALAVCSEIType._(43, _omitEnumNames ? '' : 'operation_points_not_present');
  static const MALAVCSEI_MALAVCSEIType base_view_temporal_hrd = MALAVCSEI_MALAVCSEIType._(44, _omitEnumNames ? '' : 'base_view_temporal_hrd');
  static const MALAVCSEI_MALAVCSEIType frame_packing_arrangement = MALAVCSEI_MALAVCSEIType._(45, _omitEnumNames ? '' : 'frame_packing_arrangement');
  static const MALAVCSEI_MALAVCSEIType multiview_view_position = MALAVCSEI_MALAVCSEIType._(46, _omitEnumNames ? '' : 'multiview_view_position');
  static const MALAVCSEI_MALAVCSEIType display_orientation = MALAVCSEI_MALAVCSEIType._(47, _omitEnumNames ? '' : 'display_orientation');
  static const MALAVCSEI_MALAVCSEIType mvcd_scalable_nesting = MALAVCSEI_MALAVCSEIType._(48, _omitEnumNames ? '' : 'mvcd_scalable_nesting');
  static const MALAVCSEI_MALAVCSEIType mvcd_view_scalability_info = MALAVCSEI_MALAVCSEIType._(49, _omitEnumNames ? '' : 'mvcd_view_scalability_info');
  static const MALAVCSEI_MALAVCSEIType depth_representation_info = MALAVCSEI_MALAVCSEIType._(50, _omitEnumNames ? '' : 'depth_representation_info');
  static const MALAVCSEI_MALAVCSEIType three_dimensional_reference_displays_info = MALAVCSEI_MALAVCSEIType._(51, _omitEnumNames ? '' : 'three_dimensional_reference_displays_info');
  static const MALAVCSEI_MALAVCSEIType depth_timing = MALAVCSEI_MALAVCSEIType._(52, _omitEnumNames ? '' : 'depth_timing');
  static const MALAVCSEI_MALAVCSEIType depth_sampling_info = MALAVCSEI_MALAVCSEIType._(53, _omitEnumNames ? '' : 'depth_sampling_info');
  static const MALAVCSEI_MALAVCSEIType constrained_depth_parameter_set_identifier = MALAVCSEI_MALAVCSEIType._(54, _omitEnumNames ? '' : 'constrained_depth_parameter_set_identifier');
  static const MALAVCSEI_MALAVCSEIType green_metadata = MALAVCSEI_MALAVCSEIType._(56, _omitEnumNames ? '' : 'green_metadata');
  static const MALAVCSEI_MALAVCSEIType mastering_display_colour_volume = MALAVCSEI_MALAVCSEIType._(137, _omitEnumNames ? '' : 'mastering_display_colour_volume');
  static const MALAVCSEI_MALAVCSEIType colour_remapping_info = MALAVCSEI_MALAVCSEIType._(142, _omitEnumNames ? '' : 'colour_remapping_info');
  static const MALAVCSEI_MALAVCSEIType content_light_level_info = MALAVCSEI_MALAVCSEIType._(144, _omitEnumNames ? '' : 'content_light_level_info');
  static const MALAVCSEI_MALAVCSEIType alternative_transfer_characteristics = MALAVCSEI_MALAVCSEIType._(147, _omitEnumNames ? '' : 'alternative_transfer_characteristics');
  static const MALAVCSEI_MALAVCSEIType ambient_viewing_environment = MALAVCSEI_MALAVCSEIType._(148, _omitEnumNames ? '' : 'ambient_viewing_environment');
  static const MALAVCSEI_MALAVCSEIType content_colour_volume = MALAVCSEI_MALAVCSEIType._(149, _omitEnumNames ? '' : 'content_colour_volume');
  static const MALAVCSEI_MALAVCSEIType equirectangular_projection = MALAVCSEI_MALAVCSEIType._(150, _omitEnumNames ? '' : 'equirectangular_projection');
  static const MALAVCSEI_MALAVCSEIType cubemap_projection = MALAVCSEI_MALAVCSEIType._(151, _omitEnumNames ? '' : 'cubemap_projection');
  static const MALAVCSEI_MALAVCSEIType sphere_rotation = MALAVCSEI_MALAVCSEIType._(154, _omitEnumNames ? '' : 'sphere_rotation');
  static const MALAVCSEI_MALAVCSEIType regionwise_packing = MALAVCSEI_MALAVCSEIType._(155, _omitEnumNames ? '' : 'regionwise_packing');
  static const MALAVCSEI_MALAVCSEIType omni_viewport = MALAVCSEI_MALAVCSEIType._(156, _omitEnumNames ? '' : 'omni_viewport');
  static const MALAVCSEI_MALAVCSEIType alternative_depth_info = MALAVCSEI_MALAVCSEIType._(181, _omitEnumNames ? '' : 'alternative_depth_info');
  static const MALAVCSEI_MALAVCSEIType sei_manifest = MALAVCSEI_MALAVCSEIType._(200, _omitEnumNames ? '' : 'sei_manifest');
  static const MALAVCSEI_MALAVCSEIType sei_prefix_indication = MALAVCSEI_MALAVCSEIType._(201, _omitEnumNames ? '' : 'sei_prefix_indication');
  static const MALAVCSEI_MALAVCSEIType reserved_sei_message = MALAVCSEI_MALAVCSEIType._(9999, _omitEnumNames ? '' : 'reserved_sei_message');

  static const $core.List<MALAVCSEI_MALAVCSEIType> values = <MALAVCSEI_MALAVCSEIType> [
    buffering_period_,
    pic_timing,
    pan_scan_rect,
    filler_payload,
    user_data_registered_itu_t_t35,
    user_data_unregistered,
    recovery_point,
    dec_ref_pic_marking_repetition,
    spare_pic,
    scene_info,
    sub_seq_info,
    sub_seq_layer_characteristic,
    sub_seq_characteristics,
    full_frame_freeze,
    full_frame_freeze_release,
    full_frame_snapshot,
    progressive_refinement_segment_start,
    progressive_refinement_segment_end,
    motion_constrained_slice_group_set,
    film_grain_characteristics,
    deblocking_filter_display_preference,
    stereo_video_info,
    post_filter_hint,
    tone_mapping_info,
    scalability_info,
    sub_pic_scalable_layer,
    non_required_layer_rep,
    priority_layer_info,
    layers_not_present,
    layer_dependency_change,
    scalable_nesting,
    base_layer_temporal_hrd,
    quality_layer_integrity_check,
    redundant_pic_property,
    tl0_dep_rep_index,
    tl_switching_point,
    parallel_decoding_info,
    mvc_scalable_nesting,
    view_scalability_info,
    multiview_scene_info,
    multiview_acquisition_info,
    non_required_view_component,
    view_dependency_change,
    operation_points_not_present,
    base_view_temporal_hrd,
    frame_packing_arrangement,
    multiview_view_position,
    display_orientation,
    mvcd_scalable_nesting,
    mvcd_view_scalability_info,
    depth_representation_info,
    three_dimensional_reference_displays_info,
    depth_timing,
    depth_sampling_info,
    constrained_depth_parameter_set_identifier,
    green_metadata,
    mastering_display_colour_volume,
    colour_remapping_info,
    content_light_level_info,
    alternative_transfer_characteristics,
    ambient_viewing_environment,
    content_colour_volume,
    equirectangular_projection,
    cubemap_projection,
    sphere_rotation,
    regionwise_packing,
    omni_viewport,
    alternative_depth_info,
    sei_manifest,
    sei_prefix_indication,
    reserved_sei_message,
  ];

  static final $core.Map<$core.int, MALAVCSEI_MALAVCSEIType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MALAVCSEI_MALAVCSEIType? valueOf($core.int value) => _byValue[value];

  const MALAVCSEI_MALAVCSEIType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
