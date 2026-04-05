// ignore_for_file: invalid_annotation_target

import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_protocol.freezed.dart';
part 'execution_protocol.g.dart';

const String kProtocolVersion = '1.0.0';

enum PayloadKind { text, bytes, json, lines }

enum ParamType {
  string,
  intType,
  doubleType,
  boolType,
  enumType,
  stringList,
  bytes,
  json,
  durationMs,
}

enum UiHint {
  singleLineText,
  multiLineText,
  toggle,
  segmentedChoice,
  dropdown,
  chips,
  numericStepper,
  secretText,
  byteModePicker,
}

enum Stability { experimental, stable, deprecated }

enum BackendKind { inlineDart, backgroundIsolate, ffi, reserved }

enum DiagnosticSeverity { info, warning, error }

enum ExecutionErrorCode {
  invalidParams,
  invalidInput,
  unsupportedPayloadKind,
  deprecatedBlocked,
  experimentalBlocked,
  cancelled,
  backendUnavailable,
  operationCrashed,
  outputTooLarge,
  migrationRequired,
  internal,
}

enum ValidationRuleKind { minValue, maxValue, minLength, maxLength, pattern }

class PayloadEnvelope {
  const PayloadEnvelope({
    required this.kind,
    required this.sizeBytes,
    required this.data,
    this.mediaType,
    this.characterEncoding,
    this.meta = const <String, Object?>{},
  });

  final PayloadKind kind;
  final String? mediaType;
  final String? characterEncoding;
  final int sizeBytes;
  final Object data;
  final Map<String, Object?> meta;

  String asText() {
    if (kind == PayloadKind.text) {
      return data as String;
    }
    if (kind == PayloadKind.lines) {
      return (data as List<String>).join('\n');
    }
    if (kind == PayloadKind.bytes) {
      return utf8.decode(data as Uint8List);
    }
    return jsonEncode(data);
  }

  Uint8List asBytes() {
    if (kind == PayloadKind.bytes) {
      return data as Uint8List;
    }
    return Uint8List.fromList(utf8.encode(asText()));
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'kind': kind.name,
      'mediaType': mediaType,
      'characterEncoding': characterEncoding,
      'sizeBytes': sizeBytes,
      'data': _encodeData(kind, data),
      'meta': meta,
    };
  }

  static PayloadEnvelope fromJson(Map<String, dynamic> json) {
    final PayloadKind kind = PayloadKind.values.byName(json['kind']! as String);
    return PayloadEnvelope(
      kind: kind,
      mediaType: json['mediaType'] as String?,
      characterEncoding: json['characterEncoding'] as String?,
      sizeBytes: json['sizeBytes']! as int,
      data: _decodeData(kind, json['data']),
      meta: Map<String, Object?>.from(json['meta'] as Map? ?? const {}),
    );
  }

  static Object _encodeData(PayloadKind kind, Object data) {
    switch (kind) {
      case PayloadKind.text:
        return data as String;
      case PayloadKind.bytes:
        return base64Encode((data as Uint8List));
      case PayloadKind.json:
        return data;
      case PayloadKind.lines:
        return List<String>.from(data as List<String>);
    }
  }

  static Object _decodeData(PayloadKind kind, Object? data) {
    switch (kind) {
      case PayloadKind.text:
        return data! as String;
      case PayloadKind.bytes:
        return Uint8List.fromList(base64Decode(data! as String));
      case PayloadKind.json:
        return data!;
      case PayloadKind.lines:
        return List<String>.from(data! as List);
    }
  }
}

@freezed
class ValidationRule with _$ValidationRule {
  @JsonSerializable(explicitToJson: true)
  const factory ValidationRule({
    required ValidationRuleKind kind,
    required Object? value,
    String? message,
  }) = _ValidationRule;

  factory ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);
}

class ValidationRuleSet {
  const ValidationRuleSet(this.rules);

  const ValidationRuleSet.none() : rules = const <ValidationRule>[];

  final List<ValidationRule> rules;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'rules': rules.map((ValidationRule rule) => rule.toJson()).toList(),
      };

  static ValidationRuleSet fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      final rules = (json['rules'] as List<dynamic>? ?? const <dynamic>[])
          .map((dynamic value) => ValidationRule.fromJson(value as Map<String, dynamic>))
          .toList(growable: false);
      return ValidationRuleSet(rules);
    }
    if (json is List<dynamic>) {
      return ValidationRuleSet(
        json
            .map((dynamic value) => ValidationRule.fromJson(value as Map<String, dynamic>))
            .toList(growable: false),
      );
    }
    return const ValidationRuleSet.none();
  }
}

@freezed
class ParamFieldSpec with _$ParamFieldSpec {
  @JsonSerializable(explicitToJson: true)
  const factory ParamFieldSpec({
    required String id,
    required String label,
    required String description,
    required ParamType type,
    required bool required,
    @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
    Object? defaultValue,
    @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
    List<Object?>? allowedValues,
    String? example,
    @JsonKey(fromJson: ValidationRuleSet.fromJson, toJson: _validationRuleSetToJson)
    required ValidationRuleSet validation,
    required UiHint uiHint,
    required bool secret,
  }) = _ParamFieldSpec;

  factory ParamFieldSpec.fromJson(Map<String, dynamic> json) =>
      _$ParamFieldSpecFromJson(json);
}

@freezed
class CapabilitySet with _$CapabilitySet {
  @JsonSerializable(explicitToJson: true)
  const factory CapabilitySet({
    required bool deterministic,
    required bool reversible,
    required bool previewSafe,
    required bool supportsLargeInputs,
    required bool supportsStreamingFuture,
    required bool mayProduceBinary,
    required bool requiresSecretParams,
    required bool educational,
  }) = _CapabilitySet;

  factory CapabilitySet.fromJson(Map<String, dynamic> json) =>
      _$CapabilitySetFromJson(json);
}

@freezed
class LearningContentRef with _$LearningContentRef {
  @JsonSerializable(explicitToJson: true)
  const factory LearningContentRef({
    required String bundleId,
    required String operationId,
  }) = _LearningContentRef;

  factory LearningContentRef.fromJson(Map<String, dynamic> json) =>
      _$LearningContentRefFromJson(json);
}

@freezed
class LicenseRef with _$LicenseRef {
  @JsonSerializable(explicitToJson: true)
  const factory LicenseRef({
    required String spdx,
    String? noticeRef,
    String? sourceRef,
  }) = _LicenseRef;

  factory LicenseRef.fromJson(Map<String, dynamic> json) =>
      _$LicenseRefFromJson(json);
}

@freezed
class DeprecationNotice with _$DeprecationNotice {
  @JsonSerializable(explicitToJson: true)
  const factory DeprecationNotice({
    required String message,
    String? replacementOperationId,
  }) = _DeprecationNotice;

  factory DeprecationNotice.fromJson(Map<String, dynamic> json) =>
      _$DeprecationNoticeFromJson(json);
}

@freezed
class OperationManifest with _$OperationManifest {
  @JsonSerializable(explicitToJson: true)
  const factory OperationManifest({
    required String id,
    required String version,
    required String title,
    required String shortDescription,
    required String category,
    required List<String> tags,
    required List<PayloadKind> inputKinds,
    required List<PayloadKind> outputKinds,
    required List<ParamFieldSpec> params,
    required CapabilitySet capabilities,
    required Stability stability,
    required BackendKind backendKind,
    LicenseRef? provenanceLicense,
    LearningContentRef? learning,
    DeprecationNotice? deprecation,
  }) = _OperationManifest;

  factory OperationManifest.fromJson(Map<String, dynamic> json) =>
      _$OperationManifestFromJson(json);
}

@freezed
class PackDependency with _$PackDependency {
  @JsonSerializable(explicitToJson: true)
  const factory PackDependency({
    required String packId,
    required String versionRange,
  }) = _PackDependency;

  factory PackDependency.fromJson(Map<String, dynamic> json) =>
      _$PackDependencyFromJson(json);
}

@freezed
class PackDeprecation with _$PackDeprecation {
  @JsonSerializable(explicitToJson: true)
  const factory PackDeprecation({
    required String operationId,
    required String reason,
    String? replacementOperationId,
  }) = _PackDeprecation;

  factory PackDeprecation.fromJson(Map<String, dynamic> json) =>
      _$PackDeprecationFromJson(json);
}

@freezed
class PackManifest with _$PackManifest {
  @JsonSerializable(explicitToJson: true)
  const factory PackManifest({
    required String packId,
    required String version,
    required String title,
    required String description,
    required Stability stability,
    required String minProtocolVersion,
    required List<PackDependency> dependencies,
    required List<OperationManifest> operations,
    String? learningBundleRef,
    required List<LicenseRef> licenseNotices,
    required List<PackDeprecation> deprecations,
    required List<String> searchKeywords,
    required String maintainer,
    required bool signed,
  }) = _PackManifest;

  factory PackManifest.fromJson(Map<String, dynamic> json) =>
      _$PackManifestFromJson(json);
}

@freezed
class ExecutionPolicy with _$ExecutionPolicy {
  @JsonSerializable(explicitToJson: true)
  const factory ExecutionPolicy({
    @Default(false) bool allowExperimentalOps,
    @Default(true) bool allowDeprecatedOps,
    @Default(true) bool failFast,
    @Default(true) bool collectStepTraces,
    @Default(true) bool sanitizeDiagnostics,
  }) = _ExecutionPolicy;

  factory ExecutionPolicy.fromJson(Map<String, dynamic> json) =>
      _$ExecutionPolicyFromJson(json);
}

class ExecutionRequest {
  const ExecutionRequest({
    required this.requestId,
    required this.input,
    required this.recipe,
    this.previewMode = false,
    this.previewOutputByteLimit,
    this.policy = const ExecutionPolicy(),
  });

  final String requestId;
  final PayloadEnvelope input;
  final Object recipe;
  final bool previewMode;
  final int? previewOutputByteLimit;
  final ExecutionPolicy policy;
}

class CancellationToken {
  CancellationToken._(this._state);

  final _CancellationState _state;

  bool get isCancelled => _state.cancelled;

  void throwIfCancelled() {
    if (_state.cancelled) {
      throw const CancelledException();
    }
  }
}

class CancellationController {
  CancellationController() : _state = _CancellationState();

  final _CancellationState _state;

  CancellationToken get token => CancellationToken._(_state);

  void cancel() {
    _state.cancelled = true;
  }
}

class _CancellationState {
  bool cancelled = false;
}

class CancelledException implements Exception {
  const CancelledException();
}

class OperationContext {
  const OperationContext({
    required this.requestId,
    required this.previewMode,
    required this.cancellationToken,
    this.environment = const <String, Object?>{},
  });

  final String requestId;
  final bool previewMode;
  final CancellationToken cancellationToken;
  final Map<String, Object?> environment;
}

@freezed
class Diagnostic with _$Diagnostic {
  @JsonSerializable(explicitToJson: true)
  const factory Diagnostic({
    required String code,
    required DiagnosticSeverity severity,
    required String message,
    String? detail,
    @JsonKey(fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
    @Default(<String, Object?>{})
    Map<String, Object?> meta,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}

@freezed
class StepMetrics with _$StepMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory StepMetrics({
    required int elapsedMs,
    required int inputBytes,
    required int outputBytes,
  }) = _StepMetrics;

  factory StepMetrics.fromJson(Map<String, dynamic> json) =>
      _$StepMetricsFromJson(json);
}

class StepExecutionResult {
  const StepExecutionResult({
    required this.output,
    this.diagnostics = const <Diagnostic>[],
    required this.metrics,
  });

  final PayloadEnvelope output;
  final List<Diagnostic> diagnostics;
  final StepMetrics metrics;
}

@freezed
class StepTrace with _$StepTrace {
  @JsonSerializable(explicitToJson: true)
  const factory StepTrace({
    required int stepIndex,
    required String operationId,
    required bool success,
    required List<Diagnostic> diagnostics,
    required StepMetrics metrics,
  }) = _StepTrace;

  factory StepTrace.fromJson(Map<String, dynamic> json) =>
      _$StepTraceFromJson(json);
}

@freezed
class ExecutionError with _$ExecutionError {
  @JsonSerializable(explicitToJson: true)
  const factory ExecutionError({
    required ExecutionErrorCode code,
    required String userMessage,
    String? developerMessage,
    int? stepIndex,
    String? operationId,
  }) = _ExecutionError;

  factory ExecutionError.fromJson(Map<String, dynamic> json) =>
      _$ExecutionErrorFromJson(json);
}

@freezed
class ExecutionMetrics with _$ExecutionMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory ExecutionMetrics({
    required int elapsedMs,
    required int stepsAttempted,
  }) = _ExecutionMetrics;

  factory ExecutionMetrics.fromJson(Map<String, dynamic> json) =>
      _$ExecutionMetricsFromJson(json);
}

class ExecutionResult {
  const ExecutionResult({
    required this.success,
    required this.traces,
    required this.metrics,
    this.output,
    this.error,
  });

  final bool success;
  final PayloadEnvelope? output;
  final List<StepTrace> traces;
  final ExecutionError? error;
  final ExecutionMetrics metrics;
}

abstract class OperationMigration {
  String get fromVersion;
  String get toVersion;
  Map<String, Object?> migrateParams(Map<String, Object?> oldParams);
}

abstract class Operation {
  OperationManifest get manifest;

  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  );
}

abstract class OperationPack {
  PackManifest get manifest;
  List<Operation> get operations;
}

@freezed
class ParamValidationIssue with _$ParamValidationIssue {
  @JsonSerializable(explicitToJson: true)
  const factory ParamValidationIssue({
    required String paramId,
    required String message,
  }) = _ParamValidationIssue;

  factory ParamValidationIssue.fromJson(Map<String, dynamic> json) =>
      _$ParamValidationIssueFromJson(json);
}

class ParamSchemaValidator {
  static List<ParamValidationIssue> validate(
    List<ParamFieldSpec> specs,
    Map<String, Object?> params,
  ) {
    final List<ParamValidationIssue> issues = <ParamValidationIssue>[];
    for (final ParamFieldSpec spec in specs) {
      final bool hasValue = params.containsKey(spec.id);
      final Object? value = hasValue ? params[spec.id] : spec.defaultValue;
      if (spec.required && value == null) {
        issues.add(
          ParamValidationIssue(
            paramId: spec.id,
            message: 'Parameter is required.',
          ),
        );
        continue;
      }
      if (value == null) {
        continue;
      }
      if (!_matchesType(spec.type, value)) {
        issues.add(
          ParamValidationIssue(
            paramId: spec.id,
            message: 'Parameter has invalid type.',
          ),
        );
        continue;
      }
      if (spec.allowedValues != null && !spec.allowedValues!.contains(value)) {
        issues.add(
          ParamValidationIssue(
            paramId: spec.id,
            message: 'Parameter value is not allowed.',
          ),
        );
      }
      for (final ValidationRule rule in spec.validation.rules) {
        final String? issue = _applyRule(value, rule);
        if (issue != null) {
          issues.add(
            ParamValidationIssue(
              paramId: spec.id,
              message: issue,
            ),
          );
        }
      }
    }
    return issues;
  }

  static bool _matchesType(ParamType type, Object value) {
    switch (type) {
      case ParamType.string:
        return value is String;
      case ParamType.intType:
      case ParamType.durationMs:
        return value is int;
      case ParamType.doubleType:
        return value is double || value is int;
      case ParamType.boolType:
        return value is bool;
      case ParamType.enumType:
        return value is String || value is int || value is bool;
      case ParamType.stringList:
        return value is List<String>;
      case ParamType.bytes:
        return value is Uint8List || value is List<int>;
      case ParamType.json:
        return true;
    }
  }

  static String? _applyRule(Object value, ValidationRule rule) {
    switch (rule.kind) {
      case ValidationRuleKind.minValue:
        final num candidate = value as num;
        return candidate < (rule.value as num)
            ? (rule.message ?? 'Value is below minimum.')
            : null;
      case ValidationRuleKind.maxValue:
        final num candidate = value as num;
        return candidate > (rule.value as num)
            ? (rule.message ?? 'Value is above maximum.')
            : null;
      case ValidationRuleKind.minLength:
        final int length = _valueLength(value);
        return length < (rule.value as int)
            ? (rule.message ?? 'Value is shorter than allowed.')
            : null;
      case ValidationRuleKind.maxLength:
        final int length = _valueLength(value);
        return length > (rule.value as int)
            ? (rule.message ?? 'Value is longer than allowed.')
            : null;
      case ValidationRuleKind.pattern:
        final RegExp expression = RegExp(rule.value as String);
        return expression.hasMatch(value.toString())
            ? null
            : (rule.message ?? 'Value does not match the required pattern.');
    }
  }

  static int _valueLength(Object value) {
    if (value is String) {
      return value.length;
    }
    if (value is List<Object?>) {
      return value.length;
    }
    return value.toString().length;
  }
}

Object? _jsonObjectIdentity(Object? value) => value;

List<Object?>? _objectListFromJson(Object? value) {
  if (value == null) {
    return null;
  }
  return List<Object?>.from(value as List<dynamic>);
}

Object? _objectListToJson(List<Object?>? value) => value;

Object _validationRuleSetToJson(ValidationRuleSet set) {
  return set.rules.map((ValidationRule rule) => rule.toJson()).toList(growable: false);
}

Map<String, Object?> _stringObjectMapFromJson(Object? value) {
  if (value == null) {
    return const <String, Object?>{};
  }
  return Map<String, Object?>.from(value as Map);
}

Map<String, Object?> _stringObjectMapToJson(Map<String, Object?> value) => value;
