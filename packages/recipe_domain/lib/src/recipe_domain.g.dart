// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputAssumptionsImpl _$$InputAssumptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$InputAssumptionsImpl(
      preferredKind: $enumDecode(_$PayloadKindEnumMap, json['preferredKind']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$InputAssumptionsImplToJson(
        _$InputAssumptionsImpl instance) =>
    <String, dynamic>{
      'preferredKind': _$PayloadKindEnumMap[instance.preferredKind]!,
      'notes': instance.notes,
    };

const _$PayloadKindEnumMap = {
  PayloadKind.text: 'text',
  PayloadKind.bytes: 'bytes',
  PayloadKind.json: 'json',
  PayloadKind.lines: 'lines',
};

_$RequiredPackRefImpl _$$RequiredPackRefImplFromJson(
        Map<String, dynamic> json) =>
    _$RequiredPackRefImpl(
      packId: json['packId'] as String,
      versionRange: json['versionRange'] as String,
    );

Map<String, dynamic> _$$RequiredPackRefImplToJson(
        _$RequiredPackRefImpl instance) =>
    <String, dynamic>{
      'packId': instance.packId,
      'versionRange': instance.versionRange,
    };

_$DeprecatedOperationFallbackImpl _$$DeprecatedOperationFallbackImplFromJson(
        Map<String, dynamic> json) =>
    _$DeprecatedOperationFallbackImpl(
      operationId: json['operationId'] as String,
      replacementOperationId: json['replacementOperationId'] as String,
    );

Map<String, dynamic> _$$DeprecatedOperationFallbackImplToJson(
        _$DeprecatedOperationFallbackImpl instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'replacementOperationId': instance.replacementOperationId,
    };

_$RecipeCompatibilityImpl _$$RecipeCompatibilityImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeCompatibilityImpl(
      minAppProtocolVersion: json['minAppProtocolVersion'] as String,
      requiredPacks: (json['requiredPacks'] as List<dynamic>)
          .map((e) => RequiredPackRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      deprecatedOperationFallbacks:
          (json['deprecatedOperationFallbacks'] as List<dynamic>?)
                  ?.map((e) => DeprecatedOperationFallback.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const <DeprecatedOperationFallback>[],
    );

Map<String, dynamic> _$$RecipeCompatibilityImplToJson(
        _$RecipeCompatibilityImpl instance) =>
    <String, dynamic>{
      'minAppProtocolVersion': instance.minAppProtocolVersion,
      'requiredPacks': instance.requiredPacks.map((e) => e.toJson()).toList(),
      'deprecatedOperationFallbacks':
          instance.deprecatedOperationFallbacks.map((e) => e.toJson()).toList(),
    };

_$RecipeOperationRefImpl _$$RecipeOperationRefImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeOperationRefImpl(
      id: json['id'] as String,
      versionRange: json['versionRange'] as String,
    );

Map<String, dynamic> _$$RecipeOperationRefImplToJson(
        _$RecipeOperationRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'versionRange': instance.versionRange,
    };

_$RecipeAssertionImpl _$$RecipeAssertionImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeAssertionImpl(
      type: json['type'] as String,
      config:
          json['config'] as Map<String, dynamic>? ?? const <String, Object?>{},
    );

Map<String, dynamic> _$$RecipeAssertionImplToJson(
        _$RecipeAssertionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'config': instance.config,
    };

_$RecipeStepImpl _$$RecipeStepImplFromJson(Map<String, dynamic> json) =>
    _$RecipeStepImpl(
      stepId: json['stepId'] as String,
      enabled: json['enabled'] as bool,
      operation: RecipeOperationRef.fromJson(
          json['operation'] as Map<String, dynamic>),
      params: json['params'] as Map<String, dynamic>,
      assertions: (json['assertions'] as List<dynamic>?)
              ?.map((e) => RecipeAssertion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RecipeAssertion>[],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$RecipeStepImplToJson(_$RecipeStepImpl instance) =>
    <String, dynamic>{
      'stepId': instance.stepId,
      'enabled': instance.enabled,
      'operation': instance.operation.toJson(),
      'params': instance.params,
      'assertions': instance.assertions.map((e) => e.toJson()).toList(),
      'label': instance.label,
    };

_$RecipeNoteImpl _$$RecipeNoteImplFromJson(Map<String, dynamic> json) =>
    _$RecipeNoteImpl(
      type: json['type'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$RecipeNoteImplToJson(_$RecipeNoteImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

_$RecipeProvenanceImpl _$$RecipeProvenanceImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeProvenanceImpl(
      createdBy: json['createdBy'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$$RecipeProvenanceImplToJson(
        _$RecipeProvenanceImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'source': instance.source,
    };

_$RecipeDocumentImpl _$$RecipeDocumentImplFromJson(Map<String, dynamic> json) =>
    _$RecipeDocumentImpl(
      schemaVersion: json['schemaVersion'] as String,
      recipeId: json['recipeId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      inputAssumptions: InputAssumptions.fromJson(
          json['inputAssumptions'] as Map<String, dynamic>),
      compatibility: RecipeCompatibility.fromJson(
          json['compatibility'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: (json['notes'] as List<dynamic>)
          .map((e) => RecipeNote.fromJson(e as Map<String, dynamic>))
          .toList(),
      provenance:
          RecipeProvenance.fromJson(json['provenance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecipeDocumentImplToJson(
        _$RecipeDocumentImpl instance) =>
    <String, dynamic>{
      'schemaVersion': instance.schemaVersion,
      'recipeId': instance.recipeId,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'tags': instance.tags,
      'inputAssumptions': instance.inputAssumptions.toJson(),
      'compatibility': instance.compatibility.toJson(),
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'notes': instance.notes.map((e) => e.toJson()).toList(),
      'provenance': instance.provenance.toJson(),
    };
