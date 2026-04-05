// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidationRuleImpl _$$ValidationRuleImplFromJson(Map<String, dynamic> json) =>
    _$ValidationRuleImpl(
      kind: $enumDecode(_$ValidationRuleKindEnumMap, json['kind']),
      value: json['value'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ValidationRuleImplToJson(
        _$ValidationRuleImpl instance) =>
    <String, dynamic>{
      'kind': _$ValidationRuleKindEnumMap[instance.kind]!,
      'value': instance.value,
      'message': instance.message,
    };

const _$ValidationRuleKindEnumMap = {
  ValidationRuleKind.minValue: 'minValue',
  ValidationRuleKind.maxValue: 'maxValue',
  ValidationRuleKind.minLength: 'minLength',
  ValidationRuleKind.maxLength: 'maxLength',
  ValidationRuleKind.pattern: 'pattern',
};

_$ParamFieldSpecImpl _$$ParamFieldSpecImplFromJson(Map<String, dynamic> json) =>
    _$ParamFieldSpecImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ParamTypeEnumMap, json['type']),
      required: json['required'] as bool,
      defaultValue: _jsonObjectIdentity(json['defaultValue']),
      allowedValues: _objectListFromJson(json['allowedValues']),
      example: json['example'] as String?,
      validation: ValidationRuleSet.fromJson(json['validation']),
      uiHint: $enumDecode(_$UiHintEnumMap, json['uiHint']),
      secret: json['secret'] as bool,
    );

Map<String, dynamic> _$$ParamFieldSpecImplToJson(
        _$ParamFieldSpecImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'type': _$ParamTypeEnumMap[instance.type]!,
      'required': instance.required,
      'defaultValue': _jsonObjectIdentity(instance.defaultValue),
      'allowedValues': _objectListToJson(instance.allowedValues),
      'example': instance.example,
      'validation': _validationRuleSetToJson(instance.validation),
      'uiHint': _$UiHintEnumMap[instance.uiHint]!,
      'secret': instance.secret,
    };

const _$ParamTypeEnumMap = {
  ParamType.string: 'string',
  ParamType.intType: 'intType',
  ParamType.doubleType: 'doubleType',
  ParamType.boolType: 'boolType',
  ParamType.enumType: 'enumType',
  ParamType.stringList: 'stringList',
  ParamType.bytes: 'bytes',
  ParamType.json: 'json',
  ParamType.durationMs: 'durationMs',
};

const _$UiHintEnumMap = {
  UiHint.singleLineText: 'singleLineText',
  UiHint.multiLineText: 'multiLineText',
  UiHint.toggle: 'toggle',
  UiHint.segmentedChoice: 'segmentedChoice',
  UiHint.dropdown: 'dropdown',
  UiHint.chips: 'chips',
  UiHint.numericStepper: 'numericStepper',
  UiHint.secretText: 'secretText',
  UiHint.byteModePicker: 'byteModePicker',
};

_$CapabilitySetImpl _$$CapabilitySetImplFromJson(Map<String, dynamic> json) =>
    _$CapabilitySetImpl(
      deterministic: json['deterministic'] as bool,
      reversible: json['reversible'] as bool,
      previewSafe: json['previewSafe'] as bool,
      supportsLargeInputs: json['supportsLargeInputs'] as bool,
      supportsStreamingFuture: json['supportsStreamingFuture'] as bool,
      mayProduceBinary: json['mayProduceBinary'] as bool,
      requiresSecretParams: json['requiresSecretParams'] as bool,
      educational: json['educational'] as bool,
    );

Map<String, dynamic> _$$CapabilitySetImplToJson(_$CapabilitySetImpl instance) =>
    <String, dynamic>{
      'deterministic': instance.deterministic,
      'reversible': instance.reversible,
      'previewSafe': instance.previewSafe,
      'supportsLargeInputs': instance.supportsLargeInputs,
      'supportsStreamingFuture': instance.supportsStreamingFuture,
      'mayProduceBinary': instance.mayProduceBinary,
      'requiresSecretParams': instance.requiresSecretParams,
      'educational': instance.educational,
    };

_$LearningContentRefImpl _$$LearningContentRefImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningContentRefImpl(
      bundleId: json['bundleId'] as String,
      operationId: json['operationId'] as String,
    );

Map<String, dynamic> _$$LearningContentRefImplToJson(
        _$LearningContentRefImpl instance) =>
    <String, dynamic>{
      'bundleId': instance.bundleId,
      'operationId': instance.operationId,
    };

_$LicenseRefImpl _$$LicenseRefImplFromJson(Map<String, dynamic> json) =>
    _$LicenseRefImpl(
      spdx: json['spdx'] as String,
      noticeRef: json['noticeRef'] as String?,
      sourceRef: json['sourceRef'] as String?,
    );

Map<String, dynamic> _$$LicenseRefImplToJson(_$LicenseRefImpl instance) =>
    <String, dynamic>{
      'spdx': instance.spdx,
      'noticeRef': instance.noticeRef,
      'sourceRef': instance.sourceRef,
    };

_$DeprecationNoticeImpl _$$DeprecationNoticeImplFromJson(
        Map<String, dynamic> json) =>
    _$DeprecationNoticeImpl(
      message: json['message'] as String,
      replacementOperationId: json['replacementOperationId'] as String?,
    );

Map<String, dynamic> _$$DeprecationNoticeImplToJson(
        _$DeprecationNoticeImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'replacementOperationId': instance.replacementOperationId,
    };

_$OperationManifestImpl _$$OperationManifestImplFromJson(
        Map<String, dynamic> json) =>
    _$OperationManifestImpl(
      id: json['id'] as String,
      version: json['version'] as String,
      title: json['title'] as String,
      shortDescription: json['shortDescription'] as String,
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      inputKinds: (json['inputKinds'] as List<dynamic>)
          .map((e) => $enumDecode(_$PayloadKindEnumMap, e))
          .toList(),
      outputKinds: (json['outputKinds'] as List<dynamic>)
          .map((e) => $enumDecode(_$PayloadKindEnumMap, e))
          .toList(),
      params: (json['params'] as List<dynamic>)
          .map((e) => ParamFieldSpec.fromJson(e as Map<String, dynamic>))
          .toList(),
      capabilities:
          CapabilitySet.fromJson(json['capabilities'] as Map<String, dynamic>),
      stability: $enumDecode(_$StabilityEnumMap, json['stability']),
      backendKind: $enumDecode(_$BackendKindEnumMap, json['backendKind']),
      provenanceLicense: json['provenanceLicense'] == null
          ? null
          : LicenseRef.fromJson(
              json['provenanceLicense'] as Map<String, dynamic>),
      learning: json['learning'] == null
          ? null
          : LearningContentRef.fromJson(
              json['learning'] as Map<String, dynamic>),
      deprecation: json['deprecation'] == null
          ? null
          : DeprecationNotice.fromJson(
              json['deprecation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OperationManifestImplToJson(
        _$OperationManifestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'category': instance.category,
      'tags': instance.tags,
      'inputKinds':
          instance.inputKinds.map((e) => _$PayloadKindEnumMap[e]!).toList(),
      'outputKinds':
          instance.outputKinds.map((e) => _$PayloadKindEnumMap[e]!).toList(),
      'params': instance.params.map((e) => e.toJson()).toList(),
      'capabilities': instance.capabilities.toJson(),
      'stability': _$StabilityEnumMap[instance.stability]!,
      'backendKind': _$BackendKindEnumMap[instance.backendKind]!,
      'provenanceLicense': instance.provenanceLicense?.toJson(),
      'learning': instance.learning?.toJson(),
      'deprecation': instance.deprecation?.toJson(),
    };

const _$PayloadKindEnumMap = {
  PayloadKind.text: 'text',
  PayloadKind.bytes: 'bytes',
  PayloadKind.json: 'json',
  PayloadKind.lines: 'lines',
};

const _$StabilityEnumMap = {
  Stability.experimental: 'experimental',
  Stability.stable: 'stable',
  Stability.deprecated: 'deprecated',
};

const _$BackendKindEnumMap = {
  BackendKind.inlineDart: 'inlineDart',
  BackendKind.backgroundIsolate: 'backgroundIsolate',
  BackendKind.ffi: 'ffi',
  BackendKind.reserved: 'reserved',
};

_$PackDependencyImpl _$$PackDependencyImplFromJson(Map<String, dynamic> json) =>
    _$PackDependencyImpl(
      packId: json['packId'] as String,
      versionRange: json['versionRange'] as String,
    );

Map<String, dynamic> _$$PackDependencyImplToJson(
        _$PackDependencyImpl instance) =>
    <String, dynamic>{
      'packId': instance.packId,
      'versionRange': instance.versionRange,
    };

_$PackDeprecationImpl _$$PackDeprecationImplFromJson(
        Map<String, dynamic> json) =>
    _$PackDeprecationImpl(
      operationId: json['operationId'] as String,
      reason: json['reason'] as String,
      replacementOperationId: json['replacementOperationId'] as String?,
    );

Map<String, dynamic> _$$PackDeprecationImplToJson(
        _$PackDeprecationImpl instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'reason': instance.reason,
      'replacementOperationId': instance.replacementOperationId,
    };

_$PackManifestImpl _$$PackManifestImplFromJson(Map<String, dynamic> json) =>
    _$PackManifestImpl(
      packId: json['packId'] as String,
      version: json['version'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      stability: $enumDecode(_$StabilityEnumMap, json['stability']),
      minProtocolVersion: json['minProtocolVersion'] as String,
      dependencies: (json['dependencies'] as List<dynamic>)
          .map((e) => PackDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      operations: (json['operations'] as List<dynamic>)
          .map((e) => OperationManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      learningBundleRef: json['learningBundleRef'] as String?,
      licenseNotices: (json['licenseNotices'] as List<dynamic>)
          .map((e) => LicenseRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      deprecations: (json['deprecations'] as List<dynamic>)
          .map((e) => PackDeprecation.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchKeywords: (json['searchKeywords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      maintainer: json['maintainer'] as String,
      signed: json['signed'] as bool,
    );

Map<String, dynamic> _$$PackManifestImplToJson(_$PackManifestImpl instance) =>
    <String, dynamic>{
      'packId': instance.packId,
      'version': instance.version,
      'title': instance.title,
      'description': instance.description,
      'stability': _$StabilityEnumMap[instance.stability]!,
      'minProtocolVersion': instance.minProtocolVersion,
      'dependencies': instance.dependencies.map((e) => e.toJson()).toList(),
      'operations': instance.operations.map((e) => e.toJson()).toList(),
      'learningBundleRef': instance.learningBundleRef,
      'licenseNotices': instance.licenseNotices.map((e) => e.toJson()).toList(),
      'deprecations': instance.deprecations.map((e) => e.toJson()).toList(),
      'searchKeywords': instance.searchKeywords,
      'maintainer': instance.maintainer,
      'signed': instance.signed,
    };

_$ExecutionPolicyImpl _$$ExecutionPolicyImplFromJson(
        Map<String, dynamic> json) =>
    _$ExecutionPolicyImpl(
      allowExperimentalOps: json['allowExperimentalOps'] as bool? ?? false,
      allowDeprecatedOps: json['allowDeprecatedOps'] as bool? ?? true,
      failFast: json['failFast'] as bool? ?? true,
      collectStepTraces: json['collectStepTraces'] as bool? ?? true,
      sanitizeDiagnostics: json['sanitizeDiagnostics'] as bool? ?? true,
    );

Map<String, dynamic> _$$ExecutionPolicyImplToJson(
        _$ExecutionPolicyImpl instance) =>
    <String, dynamic>{
      'allowExperimentalOps': instance.allowExperimentalOps,
      'allowDeprecatedOps': instance.allowDeprecatedOps,
      'failFast': instance.failFast,
      'collectStepTraces': instance.collectStepTraces,
      'sanitizeDiagnostics': instance.sanitizeDiagnostics,
    };

_$DiagnosticImpl _$$DiagnosticImplFromJson(Map<String, dynamic> json) =>
    _$DiagnosticImpl(
      code: json['code'] as String,
      severity: $enumDecode(_$DiagnosticSeverityEnumMap, json['severity']),
      message: json['message'] as String,
      detail: json['detail'] as String?,
      meta: json['meta'] == null
          ? const <String, Object?>{}
          : _stringObjectMapFromJson(json['meta']),
    );

Map<String, dynamic> _$$DiagnosticImplToJson(_$DiagnosticImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'severity': _$DiagnosticSeverityEnumMap[instance.severity]!,
      'message': instance.message,
      'detail': instance.detail,
      'meta': _stringObjectMapToJson(instance.meta),
    };

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.info: 'info',
  DiagnosticSeverity.warning: 'warning',
  DiagnosticSeverity.error: 'error',
};

_$StepMetricsImpl _$$StepMetricsImplFromJson(Map<String, dynamic> json) =>
    _$StepMetricsImpl(
      elapsedMs: (json['elapsedMs'] as num).toInt(),
      inputBytes: (json['inputBytes'] as num).toInt(),
      outputBytes: (json['outputBytes'] as num).toInt(),
    );

Map<String, dynamic> _$$StepMetricsImplToJson(_$StepMetricsImpl instance) =>
    <String, dynamic>{
      'elapsedMs': instance.elapsedMs,
      'inputBytes': instance.inputBytes,
      'outputBytes': instance.outputBytes,
    };

_$StepTraceImpl _$$StepTraceImplFromJson(Map<String, dynamic> json) =>
    _$StepTraceImpl(
      stepIndex: (json['stepIndex'] as num).toInt(),
      operationId: json['operationId'] as String,
      success: json['success'] as bool,
      diagnostics: (json['diagnostics'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
      metrics: StepMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StepTraceImplToJson(_$StepTraceImpl instance) =>
    <String, dynamic>{
      'stepIndex': instance.stepIndex,
      'operationId': instance.operationId,
      'success': instance.success,
      'diagnostics': instance.diagnostics.map((e) => e.toJson()).toList(),
      'metrics': instance.metrics.toJson(),
    };

_$ExecutionErrorImpl _$$ExecutionErrorImplFromJson(Map<String, dynamic> json) =>
    _$ExecutionErrorImpl(
      code: $enumDecode(_$ExecutionErrorCodeEnumMap, json['code']),
      userMessage: json['userMessage'] as String,
      developerMessage: json['developerMessage'] as String?,
      stepIndex: (json['stepIndex'] as num?)?.toInt(),
      operationId: json['operationId'] as String?,
    );

Map<String, dynamic> _$$ExecutionErrorImplToJson(
        _$ExecutionErrorImpl instance) =>
    <String, dynamic>{
      'code': _$ExecutionErrorCodeEnumMap[instance.code]!,
      'userMessage': instance.userMessage,
      'developerMessage': instance.developerMessage,
      'stepIndex': instance.stepIndex,
      'operationId': instance.operationId,
    };

const _$ExecutionErrorCodeEnumMap = {
  ExecutionErrorCode.invalidParams: 'invalidParams',
  ExecutionErrorCode.invalidInput: 'invalidInput',
  ExecutionErrorCode.unsupportedPayloadKind: 'unsupportedPayloadKind',
  ExecutionErrorCode.deprecatedBlocked: 'deprecatedBlocked',
  ExecutionErrorCode.experimentalBlocked: 'experimentalBlocked',
  ExecutionErrorCode.cancelled: 'cancelled',
  ExecutionErrorCode.backendUnavailable: 'backendUnavailable',
  ExecutionErrorCode.operationCrashed: 'operationCrashed',
  ExecutionErrorCode.outputTooLarge: 'outputTooLarge',
  ExecutionErrorCode.migrationRequired: 'migrationRequired',
  ExecutionErrorCode.internal: 'internal',
};

_$ExecutionMetricsImpl _$$ExecutionMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$ExecutionMetricsImpl(
      elapsedMs: (json['elapsedMs'] as num).toInt(),
      stepsAttempted: (json['stepsAttempted'] as num).toInt(),
    );

Map<String, dynamic> _$$ExecutionMetricsImplToJson(
        _$ExecutionMetricsImpl instance) =>
    <String, dynamic>{
      'elapsedMs': instance.elapsedMs,
      'stepsAttempted': instance.stepsAttempted,
    };

_$ParamValidationIssueImpl _$$ParamValidationIssueImplFromJson(
        Map<String, dynamic> json) =>
    _$ParamValidationIssueImpl(
      paramId: json['paramId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ParamValidationIssueImplToJson(
        _$ParamValidationIssueImpl instance) =>
    <String, dynamic>{
      'paramId': instance.paramId,
      'message': instance.message,
    };
