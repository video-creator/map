//
//  Generated code. Do not modify.
//  source: mal_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'mal.pb.dart' as $1;
import 'stream.pb.dart' as $2;

class BaseRequest extends $pb.GeneratedMessage {
  factory BaseRequest({
    $core.String? sessionId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  BaseRequest._() : super();
  factory BaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BaseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseRequest clone() => BaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseRequest copyWith(void Function(BaseRequest) updates) => super.copyWith((message) => updates(message as BaseRequest)) as BaseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseRequest create() => BaseRequest._();
  BaseRequest createEmptyInstance() => create();
  static $pb.PbList<BaseRequest> createRepeated() => $pb.PbList<BaseRequest>();
  @$core.pragma('dart2js:noInline')
  static BaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseRequest>(create);
  static BaseRequest? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(3)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(3)
  void clearSessionId() => clearField(3);
}

class BaseResponse extends $pb.GeneratedMessage {
  factory BaseResponse({
    $core.bool? success,
    $core.String? errorMessage,
    $core.String? value,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BaseResponse._() : super();
  factory BaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseResponse clone() => BaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseResponse copyWith(void Function(BaseResponse) updates) => super.copyWith((message) => updates(message as BaseResponse)) as BaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseResponse create() => BaseResponse._();
  BaseResponse createEmptyInstance() => create();
  static $pb.PbList<BaseResponse> createRepeated() => $pb.PbList<BaseResponse>();
  @$core.pragma('dart2js:noInline')
  static BaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseResponse>(create);
  static BaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

/// 解析文件请求
class ParseFileRequest extends $pb.GeneratedMessage {
  factory ParseFileRequest({
    $core.String? filePath,
    ParseOptions? options,
    BaseRequest? base,
  }) {
    final $result = create();
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (options != null) {
      $result.options = options;
    }
    if (base != null) {
      $result.base = base;
    }
    return $result;
  }
  ParseFileRequest._() : super();
  factory ParseFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParseFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ParseFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filePath')
    ..aOM<ParseOptions>(2, _omitFieldNames ? '' : 'options', subBuilder: ParseOptions.create)
    ..aOM<BaseRequest>(4, _omitFieldNames ? '' : 'base', subBuilder: BaseRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParseFileRequest clone() => ParseFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParseFileRequest copyWith(void Function(ParseFileRequest) updates) => super.copyWith((message) => updates(message as ParseFileRequest)) as ParseFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseFileRequest create() => ParseFileRequest._();
  ParseFileRequest createEmptyInstance() => create();
  static $pb.PbList<ParseFileRequest> createRepeated() => $pb.PbList<ParseFileRequest>();
  @$core.pragma('dart2js:noInline')
  static ParseFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParseFileRequest>(create);
  static ParseFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilePath() => clearField(1);

  @$pb.TagNumber(2)
  ParseOptions get options => $_getN(1);
  @$pb.TagNumber(2)
  set options(ParseOptions v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptions() => clearField(2);
  @$pb.TagNumber(2)
  ParseOptions ensureOptions() => $_ensure(1);

  @$pb.TagNumber(4)
  BaseRequest get base => $_getN(2);
  @$pb.TagNumber(4)
  set base(BaseRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBase() => $_has(2);
  @$pb.TagNumber(4)
  void clearBase() => clearField(4);
  @$pb.TagNumber(4)
  BaseRequest ensureBase() => $_ensure(2);
}

class LoadPacketsRequest extends $pb.GeneratedMessage {
  factory LoadPacketsRequest({
    BaseRequest? base,
    $core.int? size,
    $core.int? streamIndex,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (size != null) {
      $result.size = size;
    }
    if (streamIndex != null) {
      $result.streamIndex = streamIndex;
    }
    return $result;
  }
  LoadPacketsRequest._() : super();
  factory LoadPacketsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadPacketsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadPacketsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseRequest>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseRequest.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'size', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'streamIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadPacketsRequest clone() => LoadPacketsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadPacketsRequest copyWith(void Function(LoadPacketsRequest) updates) => super.copyWith((message) => updates(message as LoadPacketsRequest)) as LoadPacketsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadPacketsRequest create() => LoadPacketsRequest._();
  LoadPacketsRequest createEmptyInstance() => create();
  static $pb.PbList<LoadPacketsRequest> createRepeated() => $pb.PbList<LoadPacketsRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadPacketsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadPacketsRequest>(create);
  static LoadPacketsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BaseRequest get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseRequest ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get streamIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set streamIndex($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreamIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamIndex() => clearField(3);
}

class LoadPacketsResponse extends $pb.GeneratedMessage {
  factory LoadPacketsResponse({
    BaseResponse? base,
    $core.Iterable<$1.MALPacket>? packets,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (packets != null) {
      $result.packets.addAll(packets);
    }
    return $result;
  }
  LoadPacketsResponse._() : super();
  factory LoadPacketsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadPacketsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadPacketsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..pc<$1.MALPacket>(2, _omitFieldNames ? '' : 'packets', $pb.PbFieldType.PM, subBuilder: $1.MALPacket.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadPacketsResponse clone() => LoadPacketsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadPacketsResponse copyWith(void Function(LoadPacketsResponse) updates) => super.copyWith((message) => updates(message as LoadPacketsResponse)) as LoadPacketsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadPacketsResponse create() => LoadPacketsResponse._();
  LoadPacketsResponse createEmptyInstance() => create();
  static $pb.PbList<LoadPacketsResponse> createRepeated() => $pb.PbList<LoadPacketsResponse>();
  @$core.pragma('dart2js:noInline')
  static LoadPacketsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadPacketsResponse>(create);
  static LoadPacketsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$1.MALPacket> get packets => $_getList(1);
}

class LoadFramesRequest extends $pb.GeneratedMessage {
  factory LoadFramesRequest({
    BaseRequest? base,
    $core.int? size,
    $core.int? start,
    $core.int? streamIndex,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (size != null) {
      $result.size = size;
    }
    if (start != null) {
      $result.start = start;
    }
    if (streamIndex != null) {
      $result.streamIndex = streamIndex;
    }
    return $result;
  }
  LoadFramesRequest._() : super();
  factory LoadFramesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadFramesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadFramesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseRequest>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseRequest.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'size', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'start', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'streamIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadFramesRequest clone() => LoadFramesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadFramesRequest copyWith(void Function(LoadFramesRequest) updates) => super.copyWith((message) => updates(message as LoadFramesRequest)) as LoadFramesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadFramesRequest create() => LoadFramesRequest._();
  LoadFramesRequest createEmptyInstance() => create();
  static $pb.PbList<LoadFramesRequest> createRepeated() => $pb.PbList<LoadFramesRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadFramesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadFramesRequest>(create);
  static LoadFramesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BaseRequest get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseRequest ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get start => $_getIZ(2);
  @$pb.TagNumber(3)
  set start($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get streamIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set streamIndex($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreamIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamIndex() => clearField(4);
}

class LoadOneFrameRequest extends $pb.GeneratedMessage {
  factory LoadOneFrameRequest({
    BaseRequest? base,
    $fixnum.Int64? pos,
    $core.int? streamIndex,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (pos != null) {
      $result.pos = pos;
    }
    if (streamIndex != null) {
      $result.streamIndex = streamIndex;
    }
    return $result;
  }
  LoadOneFrameRequest._() : super();
  factory LoadOneFrameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadOneFrameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadOneFrameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseRequest>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseRequest.create)
    ..aInt64(2, _omitFieldNames ? '' : 'pos')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'streamIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadOneFrameRequest clone() => LoadOneFrameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadOneFrameRequest copyWith(void Function(LoadOneFrameRequest) updates) => super.copyWith((message) => updates(message as LoadOneFrameRequest)) as LoadOneFrameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadOneFrameRequest create() => LoadOneFrameRequest._();
  LoadOneFrameRequest createEmptyInstance() => create();
  static $pb.PbList<LoadOneFrameRequest> createRepeated() => $pb.PbList<LoadOneFrameRequest>();
  @$core.pragma('dart2js:noInline')
  static LoadOneFrameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadOneFrameRequest>(create);
  static LoadOneFrameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BaseRequest get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseRequest ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pos => $_getI64(1);
  @$pb.TagNumber(2)
  set pos($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPos() => $_has(1);
  @$pb.TagNumber(2)
  void clearPos() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get streamIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set streamIndex($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStreamIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamIndex() => clearField(3);
}

class LoadOneFrameResponse extends $pb.GeneratedMessage {
  factory LoadOneFrameResponse({
    BaseResponse? base,
    $1.MALFrame? frame,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (frame != null) {
      $result.frame = frame;
    }
    return $result;
  }
  LoadOneFrameResponse._() : super();
  factory LoadOneFrameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadOneFrameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadOneFrameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..aOM<$1.MALFrame>(2, _omitFieldNames ? '' : 'frame', subBuilder: $1.MALFrame.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadOneFrameResponse clone() => LoadOneFrameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadOneFrameResponse copyWith(void Function(LoadOneFrameResponse) updates) => super.copyWith((message) => updates(message as LoadOneFrameResponse)) as LoadOneFrameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadOneFrameResponse create() => LoadOneFrameResponse._();
  LoadOneFrameResponse createEmptyInstance() => create();
  static $pb.PbList<LoadOneFrameResponse> createRepeated() => $pb.PbList<LoadOneFrameResponse>();
  @$core.pragma('dart2js:noInline')
  static LoadOneFrameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadOneFrameResponse>(create);
  static LoadOneFrameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.MALFrame get frame => $_getN(1);
  @$pb.TagNumber(2)
  set frame($1.MALFrame v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrame() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrame() => clearField(2);
  @$pb.TagNumber(2)
  $1.MALFrame ensureFrame() => $_ensure(1);
}

class LoadFramesResponse extends $pb.GeneratedMessage {
  factory LoadFramesResponse({
    BaseResponse? base,
    $core.Iterable<$1.MALFrame>? frames,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (frames != null) {
      $result.frames.addAll(frames);
    }
    return $result;
  }
  LoadFramesResponse._() : super();
  factory LoadFramesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoadFramesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoadFramesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..pc<$1.MALFrame>(2, _omitFieldNames ? '' : 'frames', $pb.PbFieldType.PM, subBuilder: $1.MALFrame.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoadFramesResponse clone() => LoadFramesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoadFramesResponse copyWith(void Function(LoadFramesResponse) updates) => super.copyWith((message) => updates(message as LoadFramesResponse)) as LoadFramesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoadFramesResponse create() => LoadFramesResponse._();
  LoadFramesResponse createEmptyInstance() => create();
  static $pb.PbList<LoadFramesResponse> createRepeated() => $pb.PbList<LoadFramesResponse>();
  @$core.pragma('dart2js:noInline')
  static LoadFramesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoadFramesResponse>(create);
  static LoadFramesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$1.MALFrame> get frames => $_getList(1);
}

/// 解析选项
class ParseOptions extends $pb.GeneratedMessage {
  factory ParseOptions({
    $core.bool? parseHeaders,
    $core.bool? parsePayload,
    $core.bool? extractMetadata,
    $core.bool? validateStructure,
    $core.int? maxDepth,
  }) {
    final $result = create();
    if (parseHeaders != null) {
      $result.parseHeaders = parseHeaders;
    }
    if (parsePayload != null) {
      $result.parsePayload = parsePayload;
    }
    if (extractMetadata != null) {
      $result.extractMetadata = extractMetadata;
    }
    if (validateStructure != null) {
      $result.validateStructure = validateStructure;
    }
    if (maxDepth != null) {
      $result.maxDepth = maxDepth;
    }
    return $result;
  }
  ParseOptions._() : super();
  factory ParseOptions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParseOptions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ParseOptions', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'parseHeaders')
    ..aOB(2, _omitFieldNames ? '' : 'parsePayload')
    ..aOB(3, _omitFieldNames ? '' : 'extractMetadata')
    ..aOB(4, _omitFieldNames ? '' : 'validateStructure')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxDepth', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParseOptions clone() => ParseOptions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParseOptions copyWith(void Function(ParseOptions) updates) => super.copyWith((message) => updates(message as ParseOptions)) as ParseOptions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseOptions create() => ParseOptions._();
  ParseOptions createEmptyInstance() => create();
  static $pb.PbList<ParseOptions> createRepeated() => $pb.PbList<ParseOptions>();
  @$core.pragma('dart2js:noInline')
  static ParseOptions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParseOptions>(create);
  static ParseOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get parseHeaders => $_getBF(0);
  @$pb.TagNumber(1)
  set parseHeaders($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParseHeaders() => $_has(0);
  @$pb.TagNumber(1)
  void clearParseHeaders() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get parsePayload => $_getBF(1);
  @$pb.TagNumber(2)
  set parsePayload($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParsePayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearParsePayload() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get extractMetadata => $_getBF(2);
  @$pb.TagNumber(3)
  set extractMetadata($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtractMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtractMetadata() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get validateStructure => $_getBF(3);
  @$pb.TagNumber(4)
  set validateStructure($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValidateStructure() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidateStructure() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxDepth => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxDepth($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxDepth() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxDepth() => clearField(5);
}

/// 解析文件响应
class ParseFileResponse extends $pb.GeneratedMessage {
  factory ParseFileResponse({
    BaseResponse? base,
    $1.MALFormatContext? context,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (context != null) {
      $result.context = context;
    }
    return $result;
  }
  ParseFileResponse._() : super();
  factory ParseFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParseFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ParseFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..aOM<$1.MALFormatContext>(3, _omitFieldNames ? '' : 'context', subBuilder: $1.MALFormatContext.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParseFileResponse clone() => ParseFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParseFileResponse copyWith(void Function(ParseFileResponse) updates) => super.copyWith((message) => updates(message as ParseFileResponse)) as ParseFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseFileResponse create() => ParseFileResponse._();
  ParseFileResponse createEmptyInstance() => create();
  static $pb.PbList<ParseFileResponse> createRepeated() => $pb.PbList<ParseFileResponse>();
  @$core.pragma('dart2js:noInline')
  static ParseFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParseFileResponse>(create);
  static ParseFileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(3)
  $1.MALFormatContext get context => $_getN(1);
  @$pb.TagNumber(3)
  set context($1.MALFormatContext v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContext() => $_has(1);
  @$pb.TagNumber(3)
  void clearContext() => clearField(3);
  @$pb.TagNumber(3)
  $1.MALFormatContext ensureContext() => $_ensure(1);
}

/// 获取流信息请求
class GetStreamInfoRequest extends $pb.GeneratedMessage {
  factory GetStreamInfoRequest({
    BaseRequest? base,
    $core.int? streamIndex,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (streamIndex != null) {
      $result.streamIndex = streamIndex;
    }
    return $result;
  }
  GetStreamInfoRequest._() : super();
  factory GetStreamInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStreamInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStreamInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseRequest>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseRequest.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'streamIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStreamInfoRequest clone() => GetStreamInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStreamInfoRequest copyWith(void Function(GetStreamInfoRequest) updates) => super.copyWith((message) => updates(message as GetStreamInfoRequest)) as GetStreamInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStreamInfoRequest create() => GetStreamInfoRequest._();
  GetStreamInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetStreamInfoRequest> createRepeated() => $pb.PbList<GetStreamInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStreamInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStreamInfoRequest>(create);
  static GetStreamInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BaseRequest get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseRequest ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get streamIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set streamIndex($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStreamIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamIndex() => clearField(2);
}

/// 获取流信息响应
class GetStreamInfoResponse extends $pb.GeneratedMessage {
  factory GetStreamInfoResponse({
    BaseResponse? base,
    $2.MALStream? stream,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (stream != null) {
      $result.stream = stream;
    }
    return $result;
  }
  GetStreamInfoResponse._() : super();
  factory GetStreamInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStreamInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStreamInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..aOM<$2.MALStream>(3, _omitFieldNames ? '' : 'stream', subBuilder: $2.MALStream.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStreamInfoResponse clone() => GetStreamInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStreamInfoResponse copyWith(void Function(GetStreamInfoResponse) updates) => super.copyWith((message) => updates(message as GetStreamInfoResponse)) as GetStreamInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStreamInfoResponse create() => GetStreamInfoResponse._();
  GetStreamInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetStreamInfoResponse> createRepeated() => $pb.PbList<GetStreamInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStreamInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStreamInfoResponse>(create);
  static GetStreamInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(3)
  $2.MALStream get stream => $_getN(1);
  @$pb.TagNumber(3)
  set stream($2.MALStream v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStream() => $_has(1);
  @$pb.TagNumber(3)
  void clearStream() => clearField(3);
  @$pb.TagNumber(3)
  $2.MALStream ensureStream() => $_ensure(1);
}

class GetAllStreamInfoResponse extends $pb.GeneratedMessage {
  factory GetAllStreamInfoResponse({
    BaseResponse? base,
    $core.Iterable<$2.MALStream>? streams,
  }) {
    final $result = create();
    if (base != null) {
      $result.base = base;
    }
    if (streams != null) {
      $result.streams.addAll(streams);
    }
    return $result;
  }
  GetAllStreamInfoResponse._() : super();
  factory GetAllStreamInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllStreamInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllStreamInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'mal.service'), createEmptyInstance: create)
    ..aOM<BaseResponse>(1, _omitFieldNames ? '' : 'base', subBuilder: BaseResponse.create)
    ..pc<$2.MALStream>(2, _omitFieldNames ? '' : 'streams', $pb.PbFieldType.PM, subBuilder: $2.MALStream.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllStreamInfoResponse clone() => GetAllStreamInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllStreamInfoResponse copyWith(void Function(GetAllStreamInfoResponse) updates) => super.copyWith((message) => updates(message as GetAllStreamInfoResponse)) as GetAllStreamInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllStreamInfoResponse create() => GetAllStreamInfoResponse._();
  GetAllStreamInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetAllStreamInfoResponse> createRepeated() => $pb.PbList<GetAllStreamInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAllStreamInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllStreamInfoResponse>(create);
  static GetAllStreamInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseResponse get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  BaseResponse ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$2.MALStream> get streams => $_getList(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
