// ignore_for_file: invalid_annotation_target

import 'package:execution_protocol/execution_protocol.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_domain.freezed.dart';
part 'recipe_domain.g.dart';

const String kRecipeSchemaVersion = '1.0.0';

@freezed
class InputAssumptions with _$InputAssumptions {
  @JsonSerializable(explicitToJson: true)
  const factory InputAssumptions({
    required PayloadKind preferredKind,
    String? notes,
  }) = _InputAssumptions;

  factory InputAssumptions.fromJson(Map<String, dynamic> json) =>
      _$InputAssumptionsFromJson(json);
}

@freezed
class RequiredPackRef with _$RequiredPackRef {
  @JsonSerializable(explicitToJson: true)
  const factory RequiredPackRef({
    required String packId,
    required String versionRange,
  }) = _RequiredPackRef;

  factory RequiredPackRef.fromJson(Map<String, dynamic> json) =>
      _$RequiredPackRefFromJson(json);
}

@freezed
class DeprecatedOperationFallback with _$DeprecatedOperationFallback {
  @JsonSerializable(explicitToJson: true)
  const factory DeprecatedOperationFallback({
    required String operationId,
    required String replacementOperationId,
  }) = _DeprecatedOperationFallback;

  factory DeprecatedOperationFallback.fromJson(Map<String, dynamic> json) =>
      _$DeprecatedOperationFallbackFromJson(json);
}

@freezed
class RecipeCompatibility with _$RecipeCompatibility {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeCompatibility({
    required String minAppProtocolVersion,
    required List<RequiredPackRef> requiredPacks,
    @Default(<DeprecatedOperationFallback>[])
    List<DeprecatedOperationFallback> deprecatedOperationFallbacks,
  }) = _RecipeCompatibility;

  factory RecipeCompatibility.fromJson(Map<String, dynamic> json) =>
      _$RecipeCompatibilityFromJson(json);
}

@freezed
class RecipeOperationRef with _$RecipeOperationRef {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeOperationRef({
    required String id,
    required String versionRange,
  }) = _RecipeOperationRef;

  factory RecipeOperationRef.fromJson(Map<String, dynamic> json) =>
      _$RecipeOperationRefFromJson(json);
}

@freezed
class RecipeAssertion with _$RecipeAssertion {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeAssertion({
    required String type,
    @Default(<String, Object?>{}) Map<String, Object?> config,
  }) = _RecipeAssertion;

  factory RecipeAssertion.fromJson(Map<String, dynamic> json) =>
      _$RecipeAssertionFromJson(json);
}

@freezed
class RecipeStep with _$RecipeStep {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeStep({
    required String stepId,
    required bool enabled,
    required RecipeOperationRef operation,
    required Map<String, Object?> params,
    @Default(<RecipeAssertion>[]) List<RecipeAssertion> assertions,
    String? label,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);
}

@freezed
class RecipeNote with _$RecipeNote {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeNote({
    required String type,
    required String text,
  }) = _RecipeNote;

  factory RecipeNote.fromJson(Map<String, dynamic> json) =>
      _$RecipeNoteFromJson(json);
}

@freezed
class RecipeProvenance with _$RecipeProvenance {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeProvenance({
    required String createdBy,
    required String source,
  }) = _RecipeProvenance;

  factory RecipeProvenance.fromJson(Map<String, dynamic> json) =>
      _$RecipeProvenanceFromJson(json);
}

@freezed
class RecipeDocument with _$RecipeDocument {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeDocument({
    required String schemaVersion,
    required String recipeId,
    required String title,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<String> tags,
    required InputAssumptions inputAssumptions,
    required RecipeCompatibility compatibility,
    required List<RecipeStep> steps,
    required List<RecipeNote> notes,
    required RecipeProvenance provenance,
  }) = _RecipeDocument;

  factory RecipeDocument.fromJson(Map<String, dynamic> json) =>
      _$RecipeDocumentFromJson(json);
}

class RecipeValidationIssue {
  const RecipeValidationIssue({
    required this.code,
    required this.message,
    this.stepId,
  });

  final String code;
  final String message;
  final String? stepId;
}

class RecipeValidator {
  List<RecipeValidationIssue> validate(RecipeDocument recipe) {
    final List<RecipeValidationIssue> issues = <RecipeValidationIssue>[];
    if (recipe.schemaVersion.isEmpty) {
      issues.add(
        const RecipeValidationIssue(
          code: 'missingSchemaVersion',
          message: 'Recipe schemaVersion is required.',
        ),
      );
    }
    final Set<String> stepIds = <String>{};
    for (final RecipeStep step in recipe.steps) {
      if (!stepIds.add(step.stepId)) {
        issues.add(
          RecipeValidationIssue(
            code: 'duplicateStepId',
            message: 'Recipe step ids must be unique.',
            stepId: step.stepId,
          ),
        );
      }
      if (step.operation.id.isEmpty) {
        issues.add(
          RecipeValidationIssue(
            code: 'missingOperationId',
            message: 'Recipe steps must reference an operation id.',
            stepId: step.stepId,
          ),
        );
      }
    }
    return issues;
  }
}

abstract class RecipeMigration {
  String get fromVersion;
  String get toVersion;
  RecipeDocument migrate(RecipeDocument document);
}

class RecipeMigrationRegistry {
  RecipeMigrationRegistry(this._migrations);

  final List<RecipeMigration> _migrations;

  RecipeDocument migrateToLatest(RecipeDocument document) {
    RecipeDocument current = document;
    while (current.schemaVersion != kRecipeSchemaVersion) {
      final RecipeMigration migration = _migrations.firstWhere(
        (RecipeMigration candidate) =>
            candidate.fromVersion == current.schemaVersion,
      );
      current = migration.migrate(current);
    }
    return current;
  }
}
