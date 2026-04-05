// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution_protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidationRule _$ValidationRuleFromJson(Map<String, dynamic> json) {
  return _ValidationRule.fromJson(json);
}

/// @nodoc
mixin _$ValidationRule {
  ValidationRuleKind get kind => throw _privateConstructorUsedError;
  Object? get value => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ValidationRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationRuleCopyWith<ValidationRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationRuleCopyWith<$Res> {
  factory $ValidationRuleCopyWith(
          ValidationRule value, $Res Function(ValidationRule) then) =
      _$ValidationRuleCopyWithImpl<$Res, ValidationRule>;
  @useResult
  $Res call({ValidationRuleKind kind, Object? value, String? message});
}

/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res, $Val extends ValidationRule>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ValidationRuleKind,
      value: freezed == value ? _value.value : value,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationRuleImplCopyWith<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  factory _$$ValidationRuleImplCopyWith(_$ValidationRuleImpl value,
          $Res Function(_$ValidationRuleImpl) then) =
      __$$ValidationRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ValidationRuleKind kind, Object? value, String? message});
}

/// @nodoc
class __$$ValidationRuleImplCopyWithImpl<$Res>
    extends _$ValidationRuleCopyWithImpl<$Res, _$ValidationRuleImpl>
    implements _$$ValidationRuleImplCopyWith<$Res> {
  __$$ValidationRuleImplCopyWithImpl(
      _$ValidationRuleImpl _value, $Res Function(_$ValidationRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ValidationRuleImpl(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ValidationRuleKind,
      value: freezed == value ? _value.value : value,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ValidationRuleImpl implements _ValidationRule {
  const _$ValidationRuleImpl(
      {required this.kind, required this.value, this.message});

  factory _$ValidationRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationRuleImplFromJson(json);

  @override
  final ValidationRuleKind kind;
  @override
  final Object? value;
  @override
  final String? message;

  @override
  String toString() {
    return 'ValidationRule(kind: $kind, value: $value, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationRuleImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(value), message);

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      __$$ValidationRuleImplCopyWithImpl<_$ValidationRuleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationRuleImplToJson(
      this,
    );
  }
}

abstract class _ValidationRule implements ValidationRule {
  const factory _ValidationRule(
      {required final ValidationRuleKind kind,
      required final Object? value,
      final String? message}) = _$ValidationRuleImpl;

  factory _ValidationRule.fromJson(Map<String, dynamic> json) =
      _$ValidationRuleImpl.fromJson;

  @override
  ValidationRuleKind get kind;
  @override
  Object? get value;
  @override
  String? get message;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParamFieldSpec _$ParamFieldSpecFromJson(Map<String, dynamic> json) {
  return _ParamFieldSpec.fromJson(json);
}

/// @nodoc
mixin _$ParamFieldSpec {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ParamType get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
  Object? get defaultValue => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
  List<Object?>? get allowedValues => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: ValidationRuleSet.fromJson, toJson: _validationRuleSetToJson)
  ValidationRuleSet get validation => throw _privateConstructorUsedError;
  UiHint get uiHint => throw _privateConstructorUsedError;
  bool get secret => throw _privateConstructorUsedError;

  /// Serializes this ParamFieldSpec to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParamFieldSpec
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParamFieldSpecCopyWith<ParamFieldSpec> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamFieldSpecCopyWith<$Res> {
  factory $ParamFieldSpecCopyWith(
          ParamFieldSpec value, $Res Function(ParamFieldSpec) then) =
      _$ParamFieldSpecCopyWithImpl<$Res, ParamFieldSpec>;
  @useResult
  $Res call(
      {String id,
      String label,
      String description,
      ParamType type,
      bool required,
      @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
      Object? defaultValue,
      @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
      List<Object?>? allowedValues,
      String? example,
      @JsonKey(
          fromJson: ValidationRuleSet.fromJson,
          toJson: _validationRuleSetToJson)
      ValidationRuleSet validation,
      UiHint uiHint,
      bool secret});
}

/// @nodoc
class _$ParamFieldSpecCopyWithImpl<$Res, $Val extends ParamFieldSpec>
    implements $ParamFieldSpecCopyWith<$Res> {
  _$ParamFieldSpecCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParamFieldSpec
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? defaultValue = freezed,
    Object? allowedValues = freezed,
    Object? example = freezed,
    Object? validation = null,
    Object? uiHint = null,
    Object? secret = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParamType,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultValue:
          freezed == defaultValue ? _value.defaultValue : defaultValue,
      allowedValues: freezed == allowedValues
          ? _value.allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<Object?>?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationRuleSet,
      uiHint: null == uiHint
          ? _value.uiHint
          : uiHint // ignore: cast_nullable_to_non_nullable
              as UiHint,
      secret: null == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParamFieldSpecImplCopyWith<$Res>
    implements $ParamFieldSpecCopyWith<$Res> {
  factory _$$ParamFieldSpecImplCopyWith(_$ParamFieldSpecImpl value,
          $Res Function(_$ParamFieldSpecImpl) then) =
      __$$ParamFieldSpecImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String description,
      ParamType type,
      bool required,
      @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
      Object? defaultValue,
      @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
      List<Object?>? allowedValues,
      String? example,
      @JsonKey(
          fromJson: ValidationRuleSet.fromJson,
          toJson: _validationRuleSetToJson)
      ValidationRuleSet validation,
      UiHint uiHint,
      bool secret});
}

/// @nodoc
class __$$ParamFieldSpecImplCopyWithImpl<$Res>
    extends _$ParamFieldSpecCopyWithImpl<$Res, _$ParamFieldSpecImpl>
    implements _$$ParamFieldSpecImplCopyWith<$Res> {
  __$$ParamFieldSpecImplCopyWithImpl(
      _$ParamFieldSpecImpl _value, $Res Function(_$ParamFieldSpecImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamFieldSpec
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? defaultValue = freezed,
    Object? allowedValues = freezed,
    Object? example = freezed,
    Object? validation = null,
    Object? uiHint = null,
    Object? secret = null,
  }) {
    return _then(_$ParamFieldSpecImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ParamType,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultValue:
          freezed == defaultValue ? _value.defaultValue : defaultValue,
      allowedValues: freezed == allowedValues
          ? _value._allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<Object?>?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationRuleSet,
      uiHint: null == uiHint
          ? _value.uiHint
          : uiHint // ignore: cast_nullable_to_non_nullable
              as UiHint,
      secret: null == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ParamFieldSpecImpl implements _ParamFieldSpec {
  const _$ParamFieldSpecImpl(
      {required this.id,
      required this.label,
      required this.description,
      required this.type,
      required this.required,
      @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
      this.defaultValue,
      @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
      final List<Object?>? allowedValues,
      this.example,
      @JsonKey(
          fromJson: ValidationRuleSet.fromJson,
          toJson: _validationRuleSetToJson)
      required this.validation,
      required this.uiHint,
      required this.secret})
      : _allowedValues = allowedValues;

  factory _$ParamFieldSpecImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamFieldSpecImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String description;
  @override
  final ParamType type;
  @override
  final bool required;
  @override
  @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
  final Object? defaultValue;
  final List<Object?>? _allowedValues;
  @override
  @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
  List<Object?>? get allowedValues {
    final value = _allowedValues;
    if (value == null) return null;
    if (_allowedValues is EqualUnmodifiableListView) return _allowedValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? example;
  @override
  @JsonKey(
      fromJson: ValidationRuleSet.fromJson, toJson: _validationRuleSetToJson)
  final ValidationRuleSet validation;
  @override
  final UiHint uiHint;
  @override
  final bool secret;

  @override
  String toString() {
    return 'ParamFieldSpec(id: $id, label: $label, description: $description, type: $type, required: $required, defaultValue: $defaultValue, allowedValues: $allowedValues, example: $example, validation: $validation, uiHint: $uiHint, secret: $secret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamFieldSpecImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            const DeepCollectionEquality()
                .equals(other._allowedValues, _allowedValues) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.uiHint, uiHint) || other.uiHint == uiHint) &&
            (identical(other.secret, secret) || other.secret == secret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      description,
      type,
      required,
      const DeepCollectionEquality().hash(defaultValue),
      const DeepCollectionEquality().hash(_allowedValues),
      example,
      validation,
      uiHint,
      secret);

  /// Create a copy of ParamFieldSpec
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamFieldSpecImplCopyWith<_$ParamFieldSpecImpl> get copyWith =>
      __$$ParamFieldSpecImplCopyWithImpl<_$ParamFieldSpecImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamFieldSpecImplToJson(
      this,
    );
  }
}

abstract class _ParamFieldSpec implements ParamFieldSpec {
  const factory _ParamFieldSpec(
      {required final String id,
      required final String label,
      required final String description,
      required final ParamType type,
      required final bool required,
      @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
      final Object? defaultValue,
      @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
      final List<Object?>? allowedValues,
      final String? example,
      @JsonKey(
          fromJson: ValidationRuleSet.fromJson,
          toJson: _validationRuleSetToJson)
      required final ValidationRuleSet validation,
      required final UiHint uiHint,
      required final bool secret}) = _$ParamFieldSpecImpl;

  factory _ParamFieldSpec.fromJson(Map<String, dynamic> json) =
      _$ParamFieldSpecImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get description;
  @override
  ParamType get type;
  @override
  bool get required;
  @override
  @JsonKey(fromJson: _jsonObjectIdentity, toJson: _jsonObjectIdentity)
  Object? get defaultValue;
  @override
  @JsonKey(fromJson: _objectListFromJson, toJson: _objectListToJson)
  List<Object?>? get allowedValues;
  @override
  String? get example;
  @override
  @JsonKey(
      fromJson: ValidationRuleSet.fromJson, toJson: _validationRuleSetToJson)
  ValidationRuleSet get validation;
  @override
  UiHint get uiHint;
  @override
  bool get secret;

  /// Create a copy of ParamFieldSpec
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamFieldSpecImplCopyWith<_$ParamFieldSpecImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CapabilitySet _$CapabilitySetFromJson(Map<String, dynamic> json) {
  return _CapabilitySet.fromJson(json);
}

/// @nodoc
mixin _$CapabilitySet {
  bool get deterministic => throw _privateConstructorUsedError;
  bool get reversible => throw _privateConstructorUsedError;
  bool get previewSafe => throw _privateConstructorUsedError;
  bool get supportsLargeInputs => throw _privateConstructorUsedError;
  bool get supportsStreamingFuture => throw _privateConstructorUsedError;
  bool get mayProduceBinary => throw _privateConstructorUsedError;
  bool get requiresSecretParams => throw _privateConstructorUsedError;
  bool get educational => throw _privateConstructorUsedError;

  /// Serializes this CapabilitySet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CapabilitySet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CapabilitySetCopyWith<CapabilitySet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapabilitySetCopyWith<$Res> {
  factory $CapabilitySetCopyWith(
          CapabilitySet value, $Res Function(CapabilitySet) then) =
      _$CapabilitySetCopyWithImpl<$Res, CapabilitySet>;
  @useResult
  $Res call(
      {bool deterministic,
      bool reversible,
      bool previewSafe,
      bool supportsLargeInputs,
      bool supportsStreamingFuture,
      bool mayProduceBinary,
      bool requiresSecretParams,
      bool educational});
}

/// @nodoc
class _$CapabilitySetCopyWithImpl<$Res, $Val extends CapabilitySet>
    implements $CapabilitySetCopyWith<$Res> {
  _$CapabilitySetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CapabilitySet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deterministic = null,
    Object? reversible = null,
    Object? previewSafe = null,
    Object? supportsLargeInputs = null,
    Object? supportsStreamingFuture = null,
    Object? mayProduceBinary = null,
    Object? requiresSecretParams = null,
    Object? educational = null,
  }) {
    return _then(_value.copyWith(
      deterministic: null == deterministic
          ? _value.deterministic
          : deterministic // ignore: cast_nullable_to_non_nullable
              as bool,
      reversible: null == reversible
          ? _value.reversible
          : reversible // ignore: cast_nullable_to_non_nullable
              as bool,
      previewSafe: null == previewSafe
          ? _value.previewSafe
          : previewSafe // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsLargeInputs: null == supportsLargeInputs
          ? _value.supportsLargeInputs
          : supportsLargeInputs // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsStreamingFuture: null == supportsStreamingFuture
          ? _value.supportsStreamingFuture
          : supportsStreamingFuture // ignore: cast_nullable_to_non_nullable
              as bool,
      mayProduceBinary: null == mayProduceBinary
          ? _value.mayProduceBinary
          : mayProduceBinary // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSecretParams: null == requiresSecretParams
          ? _value.requiresSecretParams
          : requiresSecretParams // ignore: cast_nullable_to_non_nullable
              as bool,
      educational: null == educational
          ? _value.educational
          : educational // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CapabilitySetImplCopyWith<$Res>
    implements $CapabilitySetCopyWith<$Res> {
  factory _$$CapabilitySetImplCopyWith(
          _$CapabilitySetImpl value, $Res Function(_$CapabilitySetImpl) then) =
      __$$CapabilitySetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool deterministic,
      bool reversible,
      bool previewSafe,
      bool supportsLargeInputs,
      bool supportsStreamingFuture,
      bool mayProduceBinary,
      bool requiresSecretParams,
      bool educational});
}

/// @nodoc
class __$$CapabilitySetImplCopyWithImpl<$Res>
    extends _$CapabilitySetCopyWithImpl<$Res, _$CapabilitySetImpl>
    implements _$$CapabilitySetImplCopyWith<$Res> {
  __$$CapabilitySetImplCopyWithImpl(
      _$CapabilitySetImpl _value, $Res Function(_$CapabilitySetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CapabilitySet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deterministic = null,
    Object? reversible = null,
    Object? previewSafe = null,
    Object? supportsLargeInputs = null,
    Object? supportsStreamingFuture = null,
    Object? mayProduceBinary = null,
    Object? requiresSecretParams = null,
    Object? educational = null,
  }) {
    return _then(_$CapabilitySetImpl(
      deterministic: null == deterministic
          ? _value.deterministic
          : deterministic // ignore: cast_nullable_to_non_nullable
              as bool,
      reversible: null == reversible
          ? _value.reversible
          : reversible // ignore: cast_nullable_to_non_nullable
              as bool,
      previewSafe: null == previewSafe
          ? _value.previewSafe
          : previewSafe // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsLargeInputs: null == supportsLargeInputs
          ? _value.supportsLargeInputs
          : supportsLargeInputs // ignore: cast_nullable_to_non_nullable
              as bool,
      supportsStreamingFuture: null == supportsStreamingFuture
          ? _value.supportsStreamingFuture
          : supportsStreamingFuture // ignore: cast_nullable_to_non_nullable
              as bool,
      mayProduceBinary: null == mayProduceBinary
          ? _value.mayProduceBinary
          : mayProduceBinary // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresSecretParams: null == requiresSecretParams
          ? _value.requiresSecretParams
          : requiresSecretParams // ignore: cast_nullable_to_non_nullable
              as bool,
      educational: null == educational
          ? _value.educational
          : educational // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CapabilitySetImpl implements _CapabilitySet {
  const _$CapabilitySetImpl(
      {required this.deterministic,
      required this.reversible,
      required this.previewSafe,
      required this.supportsLargeInputs,
      required this.supportsStreamingFuture,
      required this.mayProduceBinary,
      required this.requiresSecretParams,
      required this.educational});

  factory _$CapabilitySetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CapabilitySetImplFromJson(json);

  @override
  final bool deterministic;
  @override
  final bool reversible;
  @override
  final bool previewSafe;
  @override
  final bool supportsLargeInputs;
  @override
  final bool supportsStreamingFuture;
  @override
  final bool mayProduceBinary;
  @override
  final bool requiresSecretParams;
  @override
  final bool educational;

  @override
  String toString() {
    return 'CapabilitySet(deterministic: $deterministic, reversible: $reversible, previewSafe: $previewSafe, supportsLargeInputs: $supportsLargeInputs, supportsStreamingFuture: $supportsStreamingFuture, mayProduceBinary: $mayProduceBinary, requiresSecretParams: $requiresSecretParams, educational: $educational)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CapabilitySetImpl &&
            (identical(other.deterministic, deterministic) ||
                other.deterministic == deterministic) &&
            (identical(other.reversible, reversible) ||
                other.reversible == reversible) &&
            (identical(other.previewSafe, previewSafe) ||
                other.previewSafe == previewSafe) &&
            (identical(other.supportsLargeInputs, supportsLargeInputs) ||
                other.supportsLargeInputs == supportsLargeInputs) &&
            (identical(
                    other.supportsStreamingFuture, supportsStreamingFuture) ||
                other.supportsStreamingFuture == supportsStreamingFuture) &&
            (identical(other.mayProduceBinary, mayProduceBinary) ||
                other.mayProduceBinary == mayProduceBinary) &&
            (identical(other.requiresSecretParams, requiresSecretParams) ||
                other.requiresSecretParams == requiresSecretParams) &&
            (identical(other.educational, educational) ||
                other.educational == educational));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deterministic,
      reversible,
      previewSafe,
      supportsLargeInputs,
      supportsStreamingFuture,
      mayProduceBinary,
      requiresSecretParams,
      educational);

  /// Create a copy of CapabilitySet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CapabilitySetImplCopyWith<_$CapabilitySetImpl> get copyWith =>
      __$$CapabilitySetImplCopyWithImpl<_$CapabilitySetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CapabilitySetImplToJson(
      this,
    );
  }
}

abstract class _CapabilitySet implements CapabilitySet {
  const factory _CapabilitySet(
      {required final bool deterministic,
      required final bool reversible,
      required final bool previewSafe,
      required final bool supportsLargeInputs,
      required final bool supportsStreamingFuture,
      required final bool mayProduceBinary,
      required final bool requiresSecretParams,
      required final bool educational}) = _$CapabilitySetImpl;

  factory _CapabilitySet.fromJson(Map<String, dynamic> json) =
      _$CapabilitySetImpl.fromJson;

  @override
  bool get deterministic;
  @override
  bool get reversible;
  @override
  bool get previewSafe;
  @override
  bool get supportsLargeInputs;
  @override
  bool get supportsStreamingFuture;
  @override
  bool get mayProduceBinary;
  @override
  bool get requiresSecretParams;
  @override
  bool get educational;

  /// Create a copy of CapabilitySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CapabilitySetImplCopyWith<_$CapabilitySetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LearningContentRef _$LearningContentRefFromJson(Map<String, dynamic> json) {
  return _LearningContentRef.fromJson(json);
}

/// @nodoc
mixin _$LearningContentRef {
  String get bundleId => throw _privateConstructorUsedError;
  String get operationId => throw _privateConstructorUsedError;

  /// Serializes this LearningContentRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningContentRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningContentRefCopyWith<LearningContentRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningContentRefCopyWith<$Res> {
  factory $LearningContentRefCopyWith(
          LearningContentRef value, $Res Function(LearningContentRef) then) =
      _$LearningContentRefCopyWithImpl<$Res, LearningContentRef>;
  @useResult
  $Res call({String bundleId, String operationId});
}

/// @nodoc
class _$LearningContentRefCopyWithImpl<$Res, $Val extends LearningContentRef>
    implements $LearningContentRefCopyWith<$Res> {
  _$LearningContentRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningContentRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
    Object? operationId = null,
  }) {
    return _then(_value.copyWith(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningContentRefImplCopyWith<$Res>
    implements $LearningContentRefCopyWith<$Res> {
  factory _$$LearningContentRefImplCopyWith(_$LearningContentRefImpl value,
          $Res Function(_$LearningContentRefImpl) then) =
      __$$LearningContentRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bundleId, String operationId});
}

/// @nodoc
class __$$LearningContentRefImplCopyWithImpl<$Res>
    extends _$LearningContentRefCopyWithImpl<$Res, _$LearningContentRefImpl>
    implements _$$LearningContentRefImplCopyWith<$Res> {
  __$$LearningContentRefImplCopyWithImpl(_$LearningContentRefImpl _value,
      $Res Function(_$LearningContentRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningContentRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
    Object? operationId = null,
  }) {
    return _then(_$LearningContentRefImpl(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LearningContentRefImpl implements _LearningContentRef {
  const _$LearningContentRefImpl(
      {required this.bundleId, required this.operationId});

  factory _$LearningContentRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningContentRefImplFromJson(json);

  @override
  final String bundleId;
  @override
  final String operationId;

  @override
  String toString() {
    return 'LearningContentRef(bundleId: $bundleId, operationId: $operationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningContentRefImpl &&
            (identical(other.bundleId, bundleId) ||
                other.bundleId == bundleId) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bundleId, operationId);

  /// Create a copy of LearningContentRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningContentRefImplCopyWith<_$LearningContentRefImpl> get copyWith =>
      __$$LearningContentRefImplCopyWithImpl<_$LearningContentRefImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningContentRefImplToJson(
      this,
    );
  }
}

abstract class _LearningContentRef implements LearningContentRef {
  const factory _LearningContentRef(
      {required final String bundleId,
      required final String operationId}) = _$LearningContentRefImpl;

  factory _LearningContentRef.fromJson(Map<String, dynamic> json) =
      _$LearningContentRefImpl.fromJson;

  @override
  String get bundleId;
  @override
  String get operationId;

  /// Create a copy of LearningContentRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningContentRefImplCopyWith<_$LearningContentRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LicenseRef _$LicenseRefFromJson(Map<String, dynamic> json) {
  return _LicenseRef.fromJson(json);
}

/// @nodoc
mixin _$LicenseRef {
  String get spdx => throw _privateConstructorUsedError;
  String? get noticeRef => throw _privateConstructorUsedError;
  String? get sourceRef => throw _privateConstructorUsedError;

  /// Serializes this LicenseRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LicenseRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseRefCopyWith<LicenseRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseRefCopyWith<$Res> {
  factory $LicenseRefCopyWith(
          LicenseRef value, $Res Function(LicenseRef) then) =
      _$LicenseRefCopyWithImpl<$Res, LicenseRef>;
  @useResult
  $Res call({String spdx, String? noticeRef, String? sourceRef});
}

/// @nodoc
class _$LicenseRefCopyWithImpl<$Res, $Val extends LicenseRef>
    implements $LicenseRefCopyWith<$Res> {
  _$LicenseRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LicenseRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spdx = null,
    Object? noticeRef = freezed,
    Object? sourceRef = freezed,
  }) {
    return _then(_value.copyWith(
      spdx: null == spdx
          ? _value.spdx
          : spdx // ignore: cast_nullable_to_non_nullable
              as String,
      noticeRef: freezed == noticeRef
          ? _value.noticeRef
          : noticeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRef: freezed == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseRefImplCopyWith<$Res>
    implements $LicenseRefCopyWith<$Res> {
  factory _$$LicenseRefImplCopyWith(
          _$LicenseRefImpl value, $Res Function(_$LicenseRefImpl) then) =
      __$$LicenseRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String spdx, String? noticeRef, String? sourceRef});
}

/// @nodoc
class __$$LicenseRefImplCopyWithImpl<$Res>
    extends _$LicenseRefCopyWithImpl<$Res, _$LicenseRefImpl>
    implements _$$LicenseRefImplCopyWith<$Res> {
  __$$LicenseRefImplCopyWithImpl(
      _$LicenseRefImpl _value, $Res Function(_$LicenseRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of LicenseRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spdx = null,
    Object? noticeRef = freezed,
    Object? sourceRef = freezed,
  }) {
    return _then(_$LicenseRefImpl(
      spdx: null == spdx
          ? _value.spdx
          : spdx // ignore: cast_nullable_to_non_nullable
              as String,
      noticeRef: freezed == noticeRef
          ? _value.noticeRef
          : noticeRef // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRef: freezed == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LicenseRefImpl implements _LicenseRef {
  const _$LicenseRefImpl({required this.spdx, this.noticeRef, this.sourceRef});

  factory _$LicenseRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseRefImplFromJson(json);

  @override
  final String spdx;
  @override
  final String? noticeRef;
  @override
  final String? sourceRef;

  @override
  String toString() {
    return 'LicenseRef(spdx: $spdx, noticeRef: $noticeRef, sourceRef: $sourceRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseRefImpl &&
            (identical(other.spdx, spdx) || other.spdx == spdx) &&
            (identical(other.noticeRef, noticeRef) ||
                other.noticeRef == noticeRef) &&
            (identical(other.sourceRef, sourceRef) ||
                other.sourceRef == sourceRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, spdx, noticeRef, sourceRef);

  /// Create a copy of LicenseRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseRefImplCopyWith<_$LicenseRefImpl> get copyWith =>
      __$$LicenseRefImplCopyWithImpl<_$LicenseRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseRefImplToJson(
      this,
    );
  }
}

abstract class _LicenseRef implements LicenseRef {
  const factory _LicenseRef(
      {required final String spdx,
      final String? noticeRef,
      final String? sourceRef}) = _$LicenseRefImpl;

  factory _LicenseRef.fromJson(Map<String, dynamic> json) =
      _$LicenseRefImpl.fromJson;

  @override
  String get spdx;
  @override
  String? get noticeRef;
  @override
  String? get sourceRef;

  /// Create a copy of LicenseRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LicenseRefImplCopyWith<_$LicenseRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeprecationNotice _$DeprecationNoticeFromJson(Map<String, dynamic> json) {
  return _DeprecationNotice.fromJson(json);
}

/// @nodoc
mixin _$DeprecationNotice {
  String get message => throw _privateConstructorUsedError;
  String? get replacementOperationId => throw _privateConstructorUsedError;

  /// Serializes this DeprecationNotice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecationNotice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecationNoticeCopyWith<DeprecationNotice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecationNoticeCopyWith<$Res> {
  factory $DeprecationNoticeCopyWith(
          DeprecationNotice value, $Res Function(DeprecationNotice) then) =
      _$DeprecationNoticeCopyWithImpl<$Res, DeprecationNotice>;
  @useResult
  $Res call({String message, String? replacementOperationId});
}

/// @nodoc
class _$DeprecationNoticeCopyWithImpl<$Res, $Val extends DeprecationNotice>
    implements $DeprecationNoticeCopyWith<$Res> {
  _$DeprecationNoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecationNotice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? replacementOperationId = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: freezed == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeprecationNoticeImplCopyWith<$Res>
    implements $DeprecationNoticeCopyWith<$Res> {
  factory _$$DeprecationNoticeImplCopyWith(_$DeprecationNoticeImpl value,
          $Res Function(_$DeprecationNoticeImpl) then) =
      __$$DeprecationNoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? replacementOperationId});
}

/// @nodoc
class __$$DeprecationNoticeImplCopyWithImpl<$Res>
    extends _$DeprecationNoticeCopyWithImpl<$Res, _$DeprecationNoticeImpl>
    implements _$$DeprecationNoticeImplCopyWith<$Res> {
  __$$DeprecationNoticeImplCopyWithImpl(_$DeprecationNoticeImpl _value,
      $Res Function(_$DeprecationNoticeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeprecationNotice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? replacementOperationId = freezed,
  }) {
    return _then(_$DeprecationNoticeImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: freezed == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DeprecationNoticeImpl implements _DeprecationNotice {
  const _$DeprecationNoticeImpl(
      {required this.message, this.replacementOperationId});

  factory _$DeprecationNoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeprecationNoticeImplFromJson(json);

  @override
  final String message;
  @override
  final String? replacementOperationId;

  @override
  String toString() {
    return 'DeprecationNotice(message: $message, replacementOperationId: $replacementOperationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeprecationNoticeImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.replacementOperationId, replacementOperationId) ||
                other.replacementOperationId == replacementOperationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, replacementOperationId);

  /// Create a copy of DeprecationNotice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeprecationNoticeImplCopyWith<_$DeprecationNoticeImpl> get copyWith =>
      __$$DeprecationNoticeImplCopyWithImpl<_$DeprecationNoticeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeprecationNoticeImplToJson(
      this,
    );
  }
}

abstract class _DeprecationNotice implements DeprecationNotice {
  const factory _DeprecationNotice(
      {required final String message,
      final String? replacementOperationId}) = _$DeprecationNoticeImpl;

  factory _DeprecationNotice.fromJson(Map<String, dynamic> json) =
      _$DeprecationNoticeImpl.fromJson;

  @override
  String get message;
  @override
  String? get replacementOperationId;

  /// Create a copy of DeprecationNotice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeprecationNoticeImplCopyWith<_$DeprecationNoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperationManifest _$OperationManifestFromJson(Map<String, dynamic> json) {
  return _OperationManifest.fromJson(json);
}

/// @nodoc
mixin _$OperationManifest {
  String get id => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<PayloadKind> get inputKinds => throw _privateConstructorUsedError;
  List<PayloadKind> get outputKinds => throw _privateConstructorUsedError;
  List<ParamFieldSpec> get params => throw _privateConstructorUsedError;
  CapabilitySet get capabilities => throw _privateConstructorUsedError;
  Stability get stability => throw _privateConstructorUsedError;
  BackendKind get backendKind => throw _privateConstructorUsedError;
  LicenseRef? get provenanceLicense => throw _privateConstructorUsedError;
  LearningContentRef? get learning => throw _privateConstructorUsedError;
  DeprecationNotice? get deprecation => throw _privateConstructorUsedError;

  /// Serializes this OperationManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationManifestCopyWith<OperationManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationManifestCopyWith<$Res> {
  factory $OperationManifestCopyWith(
          OperationManifest value, $Res Function(OperationManifest) then) =
      _$OperationManifestCopyWithImpl<$Res, OperationManifest>;
  @useResult
  $Res call(
      {String id,
      String version,
      String title,
      String shortDescription,
      String category,
      List<String> tags,
      List<PayloadKind> inputKinds,
      List<PayloadKind> outputKinds,
      List<ParamFieldSpec> params,
      CapabilitySet capabilities,
      Stability stability,
      BackendKind backendKind,
      LicenseRef? provenanceLicense,
      LearningContentRef? learning,
      DeprecationNotice? deprecation});

  $CapabilitySetCopyWith<$Res> get capabilities;
  $LicenseRefCopyWith<$Res>? get provenanceLicense;
  $LearningContentRefCopyWith<$Res>? get learning;
  $DeprecationNoticeCopyWith<$Res>? get deprecation;
}

/// @nodoc
class _$OperationManifestCopyWithImpl<$Res, $Val extends OperationManifest>
    implements $OperationManifestCopyWith<$Res> {
  _$OperationManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = null,
    Object? title = null,
    Object? shortDescription = null,
    Object? category = null,
    Object? tags = null,
    Object? inputKinds = null,
    Object? outputKinds = null,
    Object? params = null,
    Object? capabilities = null,
    Object? stability = null,
    Object? backendKind = null,
    Object? provenanceLicense = freezed,
    Object? learning = freezed,
    Object? deprecation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputKinds: null == inputKinds
          ? _value.inputKinds
          : inputKinds // ignore: cast_nullable_to_non_nullable
              as List<PayloadKind>,
      outputKinds: null == outputKinds
          ? _value.outputKinds
          : outputKinds // ignore: cast_nullable_to_non_nullable
              as List<PayloadKind>,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ParamFieldSpec>,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as CapabilitySet,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as Stability,
      backendKind: null == backendKind
          ? _value.backendKind
          : backendKind // ignore: cast_nullable_to_non_nullable
              as BackendKind,
      provenanceLicense: freezed == provenanceLicense
          ? _value.provenanceLicense
          : provenanceLicense // ignore: cast_nullable_to_non_nullable
              as LicenseRef?,
      learning: freezed == learning
          ? _value.learning
          : learning // ignore: cast_nullable_to_non_nullable
              as LearningContentRef?,
      deprecation: freezed == deprecation
          ? _value.deprecation
          : deprecation // ignore: cast_nullable_to_non_nullable
              as DeprecationNotice?,
    ) as $Val);
  }

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CapabilitySetCopyWith<$Res> get capabilities {
    return $CapabilitySetCopyWith<$Res>(_value.capabilities, (value) {
      return _then(_value.copyWith(capabilities: value) as $Val);
    });
  }

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LicenseRefCopyWith<$Res>? get provenanceLicense {
    if (_value.provenanceLicense == null) {
      return null;
    }

    return $LicenseRefCopyWith<$Res>(_value.provenanceLicense!, (value) {
      return _then(_value.copyWith(provenanceLicense: value) as $Val);
    });
  }

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LearningContentRefCopyWith<$Res>? get learning {
    if (_value.learning == null) {
      return null;
    }

    return $LearningContentRefCopyWith<$Res>(_value.learning!, (value) {
      return _then(_value.copyWith(learning: value) as $Val);
    });
  }

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeprecationNoticeCopyWith<$Res>? get deprecation {
    if (_value.deprecation == null) {
      return null;
    }

    return $DeprecationNoticeCopyWith<$Res>(_value.deprecation!, (value) {
      return _then(_value.copyWith(deprecation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperationManifestImplCopyWith<$Res>
    implements $OperationManifestCopyWith<$Res> {
  factory _$$OperationManifestImplCopyWith(_$OperationManifestImpl value,
          $Res Function(_$OperationManifestImpl) then) =
      __$$OperationManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String version,
      String title,
      String shortDescription,
      String category,
      List<String> tags,
      List<PayloadKind> inputKinds,
      List<PayloadKind> outputKinds,
      List<ParamFieldSpec> params,
      CapabilitySet capabilities,
      Stability stability,
      BackendKind backendKind,
      LicenseRef? provenanceLicense,
      LearningContentRef? learning,
      DeprecationNotice? deprecation});

  @override
  $CapabilitySetCopyWith<$Res> get capabilities;
  @override
  $LicenseRefCopyWith<$Res>? get provenanceLicense;
  @override
  $LearningContentRefCopyWith<$Res>? get learning;
  @override
  $DeprecationNoticeCopyWith<$Res>? get deprecation;
}

/// @nodoc
class __$$OperationManifestImplCopyWithImpl<$Res>
    extends _$OperationManifestCopyWithImpl<$Res, _$OperationManifestImpl>
    implements _$$OperationManifestImplCopyWith<$Res> {
  __$$OperationManifestImplCopyWithImpl(_$OperationManifestImpl _value,
      $Res Function(_$OperationManifestImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = null,
    Object? title = null,
    Object? shortDescription = null,
    Object? category = null,
    Object? tags = null,
    Object? inputKinds = null,
    Object? outputKinds = null,
    Object? params = null,
    Object? capabilities = null,
    Object? stability = null,
    Object? backendKind = null,
    Object? provenanceLicense = freezed,
    Object? learning = freezed,
    Object? deprecation = freezed,
  }) {
    return _then(_$OperationManifestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputKinds: null == inputKinds
          ? _value._inputKinds
          : inputKinds // ignore: cast_nullable_to_non_nullable
              as List<PayloadKind>,
      outputKinds: null == outputKinds
          ? _value._outputKinds
          : outputKinds // ignore: cast_nullable_to_non_nullable
              as List<PayloadKind>,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<ParamFieldSpec>,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as CapabilitySet,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as Stability,
      backendKind: null == backendKind
          ? _value.backendKind
          : backendKind // ignore: cast_nullable_to_non_nullable
              as BackendKind,
      provenanceLicense: freezed == provenanceLicense
          ? _value.provenanceLicense
          : provenanceLicense // ignore: cast_nullable_to_non_nullable
              as LicenseRef?,
      learning: freezed == learning
          ? _value.learning
          : learning // ignore: cast_nullable_to_non_nullable
              as LearningContentRef?,
      deprecation: freezed == deprecation
          ? _value.deprecation
          : deprecation // ignore: cast_nullable_to_non_nullable
              as DeprecationNotice?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OperationManifestImpl implements _OperationManifest {
  const _$OperationManifestImpl(
      {required this.id,
      required this.version,
      required this.title,
      required this.shortDescription,
      required this.category,
      required final List<String> tags,
      required final List<PayloadKind> inputKinds,
      required final List<PayloadKind> outputKinds,
      required final List<ParamFieldSpec> params,
      required this.capabilities,
      required this.stability,
      required this.backendKind,
      this.provenanceLicense,
      this.learning,
      this.deprecation})
      : _tags = tags,
        _inputKinds = inputKinds,
        _outputKinds = outputKinds,
        _params = params;

  factory _$OperationManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationManifestImplFromJson(json);

  @override
  final String id;
  @override
  final String version;
  @override
  final String title;
  @override
  final String shortDescription;
  @override
  final String category;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<PayloadKind> _inputKinds;
  @override
  List<PayloadKind> get inputKinds {
    if (_inputKinds is EqualUnmodifiableListView) return _inputKinds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputKinds);
  }

  final List<PayloadKind> _outputKinds;
  @override
  List<PayloadKind> get outputKinds {
    if (_outputKinds is EqualUnmodifiableListView) return _outputKinds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputKinds);
  }

  final List<ParamFieldSpec> _params;
  @override
  List<ParamFieldSpec> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  final CapabilitySet capabilities;
  @override
  final Stability stability;
  @override
  final BackendKind backendKind;
  @override
  final LicenseRef? provenanceLicense;
  @override
  final LearningContentRef? learning;
  @override
  final DeprecationNotice? deprecation;

  @override
  String toString() {
    return 'OperationManifest(id: $id, version: $version, title: $title, shortDescription: $shortDescription, category: $category, tags: $tags, inputKinds: $inputKinds, outputKinds: $outputKinds, params: $params, capabilities: $capabilities, stability: $stability, backendKind: $backendKind, provenanceLicense: $provenanceLicense, learning: $learning, deprecation: $deprecation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationManifestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._inputKinds, _inputKinds) &&
            const DeepCollectionEquality()
                .equals(other._outputKinds, _outputKinds) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            (identical(other.capabilities, capabilities) ||
                other.capabilities == capabilities) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            (identical(other.backendKind, backendKind) ||
                other.backendKind == backendKind) &&
            (identical(other.provenanceLicense, provenanceLicense) ||
                other.provenanceLicense == provenanceLicense) &&
            (identical(other.learning, learning) ||
                other.learning == learning) &&
            (identical(other.deprecation, deprecation) ||
                other.deprecation == deprecation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      title,
      shortDescription,
      category,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_inputKinds),
      const DeepCollectionEquality().hash(_outputKinds),
      const DeepCollectionEquality().hash(_params),
      capabilities,
      stability,
      backendKind,
      provenanceLicense,
      learning,
      deprecation);

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationManifestImplCopyWith<_$OperationManifestImpl> get copyWith =>
      __$$OperationManifestImplCopyWithImpl<_$OperationManifestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationManifestImplToJson(
      this,
    );
  }
}

abstract class _OperationManifest implements OperationManifest {
  const factory _OperationManifest(
      {required final String id,
      required final String version,
      required final String title,
      required final String shortDescription,
      required final String category,
      required final List<String> tags,
      required final List<PayloadKind> inputKinds,
      required final List<PayloadKind> outputKinds,
      required final List<ParamFieldSpec> params,
      required final CapabilitySet capabilities,
      required final Stability stability,
      required final BackendKind backendKind,
      final LicenseRef? provenanceLicense,
      final LearningContentRef? learning,
      final DeprecationNotice? deprecation}) = _$OperationManifestImpl;

  factory _OperationManifest.fromJson(Map<String, dynamic> json) =
      _$OperationManifestImpl.fromJson;

  @override
  String get id;
  @override
  String get version;
  @override
  String get title;
  @override
  String get shortDescription;
  @override
  String get category;
  @override
  List<String> get tags;
  @override
  List<PayloadKind> get inputKinds;
  @override
  List<PayloadKind> get outputKinds;
  @override
  List<ParamFieldSpec> get params;
  @override
  CapabilitySet get capabilities;
  @override
  Stability get stability;
  @override
  BackendKind get backendKind;
  @override
  LicenseRef? get provenanceLicense;
  @override
  LearningContentRef? get learning;
  @override
  DeprecationNotice? get deprecation;

  /// Create a copy of OperationManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationManifestImplCopyWith<_$OperationManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackDependency _$PackDependencyFromJson(Map<String, dynamic> json) {
  return _PackDependency.fromJson(json);
}

/// @nodoc
mixin _$PackDependency {
  String get packId => throw _privateConstructorUsedError;
  String get versionRange => throw _privateConstructorUsedError;

  /// Serializes this PackDependency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackDependency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackDependencyCopyWith<PackDependency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackDependencyCopyWith<$Res> {
  factory $PackDependencyCopyWith(
          PackDependency value, $Res Function(PackDependency) then) =
      _$PackDependencyCopyWithImpl<$Res, PackDependency>;
  @useResult
  $Res call({String packId, String versionRange});
}

/// @nodoc
class _$PackDependencyCopyWithImpl<$Res, $Val extends PackDependency>
    implements $PackDependencyCopyWith<$Res> {
  _$PackDependencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackDependency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packId = null,
    Object? versionRange = null,
  }) {
    return _then(_value.copyWith(
      packId: null == packId
          ? _value.packId
          : packId // ignore: cast_nullable_to_non_nullable
              as String,
      versionRange: null == versionRange
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackDependencyImplCopyWith<$Res>
    implements $PackDependencyCopyWith<$Res> {
  factory _$$PackDependencyImplCopyWith(_$PackDependencyImpl value,
          $Res Function(_$PackDependencyImpl) then) =
      __$$PackDependencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String packId, String versionRange});
}

/// @nodoc
class __$$PackDependencyImplCopyWithImpl<$Res>
    extends _$PackDependencyCopyWithImpl<$Res, _$PackDependencyImpl>
    implements _$$PackDependencyImplCopyWith<$Res> {
  __$$PackDependencyImplCopyWithImpl(
      _$PackDependencyImpl _value, $Res Function(_$PackDependencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackDependency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packId = null,
    Object? versionRange = null,
  }) {
    return _then(_$PackDependencyImpl(
      packId: null == packId
          ? _value.packId
          : packId // ignore: cast_nullable_to_non_nullable
              as String,
      versionRange: null == versionRange
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PackDependencyImpl implements _PackDependency {
  const _$PackDependencyImpl(
      {required this.packId, required this.versionRange});

  factory _$PackDependencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackDependencyImplFromJson(json);

  @override
  final String packId;
  @override
  final String versionRange;

  @override
  String toString() {
    return 'PackDependency(packId: $packId, versionRange: $versionRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackDependencyImpl &&
            (identical(other.packId, packId) || other.packId == packId) &&
            (identical(other.versionRange, versionRange) ||
                other.versionRange == versionRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packId, versionRange);

  /// Create a copy of PackDependency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackDependencyImplCopyWith<_$PackDependencyImpl> get copyWith =>
      __$$PackDependencyImplCopyWithImpl<_$PackDependencyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackDependencyImplToJson(
      this,
    );
  }
}

abstract class _PackDependency implements PackDependency {
  const factory _PackDependency(
      {required final String packId,
      required final String versionRange}) = _$PackDependencyImpl;

  factory _PackDependency.fromJson(Map<String, dynamic> json) =
      _$PackDependencyImpl.fromJson;

  @override
  String get packId;
  @override
  String get versionRange;

  /// Create a copy of PackDependency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackDependencyImplCopyWith<_$PackDependencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackDeprecation _$PackDeprecationFromJson(Map<String, dynamic> json) {
  return _PackDeprecation.fromJson(json);
}

/// @nodoc
mixin _$PackDeprecation {
  String get operationId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get replacementOperationId => throw _privateConstructorUsedError;

  /// Serializes this PackDeprecation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackDeprecation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackDeprecationCopyWith<PackDeprecation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackDeprecationCopyWith<$Res> {
  factory $PackDeprecationCopyWith(
          PackDeprecation value, $Res Function(PackDeprecation) then) =
      _$PackDeprecationCopyWithImpl<$Res, PackDeprecation>;
  @useResult
  $Res call(
      {String operationId, String reason, String? replacementOperationId});
}

/// @nodoc
class _$PackDeprecationCopyWithImpl<$Res, $Val extends PackDeprecation>
    implements $PackDeprecationCopyWith<$Res> {
  _$PackDeprecationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackDeprecation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? reason = null,
    Object? replacementOperationId = freezed,
  }) {
    return _then(_value.copyWith(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: freezed == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackDeprecationImplCopyWith<$Res>
    implements $PackDeprecationCopyWith<$Res> {
  factory _$$PackDeprecationImplCopyWith(_$PackDeprecationImpl value,
          $Res Function(_$PackDeprecationImpl) then) =
      __$$PackDeprecationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operationId, String reason, String? replacementOperationId});
}

/// @nodoc
class __$$PackDeprecationImplCopyWithImpl<$Res>
    extends _$PackDeprecationCopyWithImpl<$Res, _$PackDeprecationImpl>
    implements _$$PackDeprecationImplCopyWith<$Res> {
  __$$PackDeprecationImplCopyWithImpl(
      _$PackDeprecationImpl _value, $Res Function(_$PackDeprecationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackDeprecation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? reason = null,
    Object? replacementOperationId = freezed,
  }) {
    return _then(_$PackDeprecationImpl(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: freezed == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PackDeprecationImpl implements _PackDeprecation {
  const _$PackDeprecationImpl(
      {required this.operationId,
      required this.reason,
      this.replacementOperationId});

  factory _$PackDeprecationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackDeprecationImplFromJson(json);

  @override
  final String operationId;
  @override
  final String reason;
  @override
  final String? replacementOperationId;

  @override
  String toString() {
    return 'PackDeprecation(operationId: $operationId, reason: $reason, replacementOperationId: $replacementOperationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackDeprecationImpl &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.replacementOperationId, replacementOperationId) ||
                other.replacementOperationId == replacementOperationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, operationId, reason, replacementOperationId);

  /// Create a copy of PackDeprecation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackDeprecationImplCopyWith<_$PackDeprecationImpl> get copyWith =>
      __$$PackDeprecationImplCopyWithImpl<_$PackDeprecationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackDeprecationImplToJson(
      this,
    );
  }
}

abstract class _PackDeprecation implements PackDeprecation {
  const factory _PackDeprecation(
      {required final String operationId,
      required final String reason,
      final String? replacementOperationId}) = _$PackDeprecationImpl;

  factory _PackDeprecation.fromJson(Map<String, dynamic> json) =
      _$PackDeprecationImpl.fromJson;

  @override
  String get operationId;
  @override
  String get reason;
  @override
  String? get replacementOperationId;

  /// Create a copy of PackDeprecation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackDeprecationImplCopyWith<_$PackDeprecationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackManifest _$PackManifestFromJson(Map<String, dynamic> json) {
  return _PackManifest.fromJson(json);
}

/// @nodoc
mixin _$PackManifest {
  String get packId => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Stability get stability => throw _privateConstructorUsedError;
  String get minProtocolVersion => throw _privateConstructorUsedError;
  List<PackDependency> get dependencies => throw _privateConstructorUsedError;
  List<OperationManifest> get operations => throw _privateConstructorUsedError;
  String? get learningBundleRef => throw _privateConstructorUsedError;
  List<LicenseRef> get licenseNotices => throw _privateConstructorUsedError;
  List<PackDeprecation> get deprecations => throw _privateConstructorUsedError;
  List<String> get searchKeywords => throw _privateConstructorUsedError;
  String get maintainer => throw _privateConstructorUsedError;
  bool get signed => throw _privateConstructorUsedError;

  /// Serializes this PackManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackManifestCopyWith<PackManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackManifestCopyWith<$Res> {
  factory $PackManifestCopyWith(
          PackManifest value, $Res Function(PackManifest) then) =
      _$PackManifestCopyWithImpl<$Res, PackManifest>;
  @useResult
  $Res call(
      {String packId,
      String version,
      String title,
      String description,
      Stability stability,
      String minProtocolVersion,
      List<PackDependency> dependencies,
      List<OperationManifest> operations,
      String? learningBundleRef,
      List<LicenseRef> licenseNotices,
      List<PackDeprecation> deprecations,
      List<String> searchKeywords,
      String maintainer,
      bool signed});
}

/// @nodoc
class _$PackManifestCopyWithImpl<$Res, $Val extends PackManifest>
    implements $PackManifestCopyWith<$Res> {
  _$PackManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packId = null,
    Object? version = null,
    Object? title = null,
    Object? description = null,
    Object? stability = null,
    Object? minProtocolVersion = null,
    Object? dependencies = null,
    Object? operations = null,
    Object? learningBundleRef = freezed,
    Object? licenseNotices = null,
    Object? deprecations = null,
    Object? searchKeywords = null,
    Object? maintainer = null,
    Object? signed = null,
  }) {
    return _then(_value.copyWith(
      packId: null == packId
          ? _value.packId
          : packId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as Stability,
      minProtocolVersion: null == minProtocolVersion
          ? _value.minProtocolVersion
          : minProtocolVersion // ignore: cast_nullable_to_non_nullable
              as String,
      dependencies: null == dependencies
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<PackDependency>,
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<OperationManifest>,
      learningBundleRef: freezed == learningBundleRef
          ? _value.learningBundleRef
          : learningBundleRef // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNotices: null == licenseNotices
          ? _value.licenseNotices
          : licenseNotices // ignore: cast_nullable_to_non_nullable
              as List<LicenseRef>,
      deprecations: null == deprecations
          ? _value.deprecations
          : deprecations // ignore: cast_nullable_to_non_nullable
              as List<PackDeprecation>,
      searchKeywords: null == searchKeywords
          ? _value.searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maintainer: null == maintainer
          ? _value.maintainer
          : maintainer // ignore: cast_nullable_to_non_nullable
              as String,
      signed: null == signed
          ? _value.signed
          : signed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackManifestImplCopyWith<$Res>
    implements $PackManifestCopyWith<$Res> {
  factory _$$PackManifestImplCopyWith(
          _$PackManifestImpl value, $Res Function(_$PackManifestImpl) then) =
      __$$PackManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packId,
      String version,
      String title,
      String description,
      Stability stability,
      String minProtocolVersion,
      List<PackDependency> dependencies,
      List<OperationManifest> operations,
      String? learningBundleRef,
      List<LicenseRef> licenseNotices,
      List<PackDeprecation> deprecations,
      List<String> searchKeywords,
      String maintainer,
      bool signed});
}

/// @nodoc
class __$$PackManifestImplCopyWithImpl<$Res>
    extends _$PackManifestCopyWithImpl<$Res, _$PackManifestImpl>
    implements _$$PackManifestImplCopyWith<$Res> {
  __$$PackManifestImplCopyWithImpl(
      _$PackManifestImpl _value, $Res Function(_$PackManifestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packId = null,
    Object? version = null,
    Object? title = null,
    Object? description = null,
    Object? stability = null,
    Object? minProtocolVersion = null,
    Object? dependencies = null,
    Object? operations = null,
    Object? learningBundleRef = freezed,
    Object? licenseNotices = null,
    Object? deprecations = null,
    Object? searchKeywords = null,
    Object? maintainer = null,
    Object? signed = null,
  }) {
    return _then(_$PackManifestImpl(
      packId: null == packId
          ? _value.packId
          : packId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as Stability,
      minProtocolVersion: null == minProtocolVersion
          ? _value.minProtocolVersion
          : minProtocolVersion // ignore: cast_nullable_to_non_nullable
              as String,
      dependencies: null == dependencies
          ? _value._dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as List<PackDependency>,
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<OperationManifest>,
      learningBundleRef: freezed == learningBundleRef
          ? _value.learningBundleRef
          : learningBundleRef // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNotices: null == licenseNotices
          ? _value._licenseNotices
          : licenseNotices // ignore: cast_nullable_to_non_nullable
              as List<LicenseRef>,
      deprecations: null == deprecations
          ? _value._deprecations
          : deprecations // ignore: cast_nullable_to_non_nullable
              as List<PackDeprecation>,
      searchKeywords: null == searchKeywords
          ? _value._searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maintainer: null == maintainer
          ? _value.maintainer
          : maintainer // ignore: cast_nullable_to_non_nullable
              as String,
      signed: null == signed
          ? _value.signed
          : signed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PackManifestImpl implements _PackManifest {
  const _$PackManifestImpl(
      {required this.packId,
      required this.version,
      required this.title,
      required this.description,
      required this.stability,
      required this.minProtocolVersion,
      required final List<PackDependency> dependencies,
      required final List<OperationManifest> operations,
      this.learningBundleRef,
      required final List<LicenseRef> licenseNotices,
      required final List<PackDeprecation> deprecations,
      required final List<String> searchKeywords,
      required this.maintainer,
      required this.signed})
      : _dependencies = dependencies,
        _operations = operations,
        _licenseNotices = licenseNotices,
        _deprecations = deprecations,
        _searchKeywords = searchKeywords;

  factory _$PackManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackManifestImplFromJson(json);

  @override
  final String packId;
  @override
  final String version;
  @override
  final String title;
  @override
  final String description;
  @override
  final Stability stability;
  @override
  final String minProtocolVersion;
  final List<PackDependency> _dependencies;
  @override
  List<PackDependency> get dependencies {
    if (_dependencies is EqualUnmodifiableListView) return _dependencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dependencies);
  }

  final List<OperationManifest> _operations;
  @override
  List<OperationManifest> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  final String? learningBundleRef;
  final List<LicenseRef> _licenseNotices;
  @override
  List<LicenseRef> get licenseNotices {
    if (_licenseNotices is EqualUnmodifiableListView) return _licenseNotices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_licenseNotices);
  }

  final List<PackDeprecation> _deprecations;
  @override
  List<PackDeprecation> get deprecations {
    if (_deprecations is EqualUnmodifiableListView) return _deprecations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deprecations);
  }

  final List<String> _searchKeywords;
  @override
  List<String> get searchKeywords {
    if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeywords);
  }

  @override
  final String maintainer;
  @override
  final bool signed;

  @override
  String toString() {
    return 'PackManifest(packId: $packId, version: $version, title: $title, description: $description, stability: $stability, minProtocolVersion: $minProtocolVersion, dependencies: $dependencies, operations: $operations, learningBundleRef: $learningBundleRef, licenseNotices: $licenseNotices, deprecations: $deprecations, searchKeywords: $searchKeywords, maintainer: $maintainer, signed: $signed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackManifestImpl &&
            (identical(other.packId, packId) || other.packId == packId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            (identical(other.minProtocolVersion, minProtocolVersion) ||
                other.minProtocolVersion == minProtocolVersion) &&
            const DeepCollectionEquality()
                .equals(other._dependencies, _dependencies) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations) &&
            (identical(other.learningBundleRef, learningBundleRef) ||
                other.learningBundleRef == learningBundleRef) &&
            const DeepCollectionEquality()
                .equals(other._licenseNotices, _licenseNotices) &&
            const DeepCollectionEquality()
                .equals(other._deprecations, _deprecations) &&
            const DeepCollectionEquality()
                .equals(other._searchKeywords, _searchKeywords) &&
            (identical(other.maintainer, maintainer) ||
                other.maintainer == maintainer) &&
            (identical(other.signed, signed) || other.signed == signed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      packId,
      version,
      title,
      description,
      stability,
      minProtocolVersion,
      const DeepCollectionEquality().hash(_dependencies),
      const DeepCollectionEquality().hash(_operations),
      learningBundleRef,
      const DeepCollectionEquality().hash(_licenseNotices),
      const DeepCollectionEquality().hash(_deprecations),
      const DeepCollectionEquality().hash(_searchKeywords),
      maintainer,
      signed);

  /// Create a copy of PackManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackManifestImplCopyWith<_$PackManifestImpl> get copyWith =>
      __$$PackManifestImplCopyWithImpl<_$PackManifestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackManifestImplToJson(
      this,
    );
  }
}

abstract class _PackManifest implements PackManifest {
  const factory _PackManifest(
      {required final String packId,
      required final String version,
      required final String title,
      required final String description,
      required final Stability stability,
      required final String minProtocolVersion,
      required final List<PackDependency> dependencies,
      required final List<OperationManifest> operations,
      final String? learningBundleRef,
      required final List<LicenseRef> licenseNotices,
      required final List<PackDeprecation> deprecations,
      required final List<String> searchKeywords,
      required final String maintainer,
      required final bool signed}) = _$PackManifestImpl;

  factory _PackManifest.fromJson(Map<String, dynamic> json) =
      _$PackManifestImpl.fromJson;

  @override
  String get packId;
  @override
  String get version;
  @override
  String get title;
  @override
  String get description;
  @override
  Stability get stability;
  @override
  String get minProtocolVersion;
  @override
  List<PackDependency> get dependencies;
  @override
  List<OperationManifest> get operations;
  @override
  String? get learningBundleRef;
  @override
  List<LicenseRef> get licenseNotices;
  @override
  List<PackDeprecation> get deprecations;
  @override
  List<String> get searchKeywords;
  @override
  String get maintainer;
  @override
  bool get signed;

  /// Create a copy of PackManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackManifestImplCopyWith<_$PackManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExecutionPolicy _$ExecutionPolicyFromJson(Map<String, dynamic> json) {
  return _ExecutionPolicy.fromJson(json);
}

/// @nodoc
mixin _$ExecutionPolicy {
  bool get allowExperimentalOps => throw _privateConstructorUsedError;
  bool get allowDeprecatedOps => throw _privateConstructorUsedError;
  bool get failFast => throw _privateConstructorUsedError;
  bool get collectStepTraces => throw _privateConstructorUsedError;
  bool get sanitizeDiagnostics => throw _privateConstructorUsedError;

  /// Serializes this ExecutionPolicy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExecutionPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExecutionPolicyCopyWith<ExecutionPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExecutionPolicyCopyWith<$Res> {
  factory $ExecutionPolicyCopyWith(
          ExecutionPolicy value, $Res Function(ExecutionPolicy) then) =
      _$ExecutionPolicyCopyWithImpl<$Res, ExecutionPolicy>;
  @useResult
  $Res call(
      {bool allowExperimentalOps,
      bool allowDeprecatedOps,
      bool failFast,
      bool collectStepTraces,
      bool sanitizeDiagnostics});
}

/// @nodoc
class _$ExecutionPolicyCopyWithImpl<$Res, $Val extends ExecutionPolicy>
    implements $ExecutionPolicyCopyWith<$Res> {
  _$ExecutionPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExecutionPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowExperimentalOps = null,
    Object? allowDeprecatedOps = null,
    Object? failFast = null,
    Object? collectStepTraces = null,
    Object? sanitizeDiagnostics = null,
  }) {
    return _then(_value.copyWith(
      allowExperimentalOps: null == allowExperimentalOps
          ? _value.allowExperimentalOps
          : allowExperimentalOps // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDeprecatedOps: null == allowDeprecatedOps
          ? _value.allowDeprecatedOps
          : allowDeprecatedOps // ignore: cast_nullable_to_non_nullable
              as bool,
      failFast: null == failFast
          ? _value.failFast
          : failFast // ignore: cast_nullable_to_non_nullable
              as bool,
      collectStepTraces: null == collectStepTraces
          ? _value.collectStepTraces
          : collectStepTraces // ignore: cast_nullable_to_non_nullable
              as bool,
      sanitizeDiagnostics: null == sanitizeDiagnostics
          ? _value.sanitizeDiagnostics
          : sanitizeDiagnostics // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExecutionPolicyImplCopyWith<$Res>
    implements $ExecutionPolicyCopyWith<$Res> {
  factory _$$ExecutionPolicyImplCopyWith(_$ExecutionPolicyImpl value,
          $Res Function(_$ExecutionPolicyImpl) then) =
      __$$ExecutionPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool allowExperimentalOps,
      bool allowDeprecatedOps,
      bool failFast,
      bool collectStepTraces,
      bool sanitizeDiagnostics});
}

/// @nodoc
class __$$ExecutionPolicyImplCopyWithImpl<$Res>
    extends _$ExecutionPolicyCopyWithImpl<$Res, _$ExecutionPolicyImpl>
    implements _$$ExecutionPolicyImplCopyWith<$Res> {
  __$$ExecutionPolicyImplCopyWithImpl(
      _$ExecutionPolicyImpl _value, $Res Function(_$ExecutionPolicyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExecutionPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowExperimentalOps = null,
    Object? allowDeprecatedOps = null,
    Object? failFast = null,
    Object? collectStepTraces = null,
    Object? sanitizeDiagnostics = null,
  }) {
    return _then(_$ExecutionPolicyImpl(
      allowExperimentalOps: null == allowExperimentalOps
          ? _value.allowExperimentalOps
          : allowExperimentalOps // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDeprecatedOps: null == allowDeprecatedOps
          ? _value.allowDeprecatedOps
          : allowDeprecatedOps // ignore: cast_nullable_to_non_nullable
              as bool,
      failFast: null == failFast
          ? _value.failFast
          : failFast // ignore: cast_nullable_to_non_nullable
              as bool,
      collectStepTraces: null == collectStepTraces
          ? _value.collectStepTraces
          : collectStepTraces // ignore: cast_nullable_to_non_nullable
              as bool,
      sanitizeDiagnostics: null == sanitizeDiagnostics
          ? _value.sanitizeDiagnostics
          : sanitizeDiagnostics // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ExecutionPolicyImpl implements _ExecutionPolicy {
  const _$ExecutionPolicyImpl(
      {this.allowExperimentalOps = false,
      this.allowDeprecatedOps = true,
      this.failFast = true,
      this.collectStepTraces = true,
      this.sanitizeDiagnostics = true});

  factory _$ExecutionPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExecutionPolicyImplFromJson(json);

  @override
  @JsonKey()
  final bool allowExperimentalOps;
  @override
  @JsonKey()
  final bool allowDeprecatedOps;
  @override
  @JsonKey()
  final bool failFast;
  @override
  @JsonKey()
  final bool collectStepTraces;
  @override
  @JsonKey()
  final bool sanitizeDiagnostics;

  @override
  String toString() {
    return 'ExecutionPolicy(allowExperimentalOps: $allowExperimentalOps, allowDeprecatedOps: $allowDeprecatedOps, failFast: $failFast, collectStepTraces: $collectStepTraces, sanitizeDiagnostics: $sanitizeDiagnostics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutionPolicyImpl &&
            (identical(other.allowExperimentalOps, allowExperimentalOps) ||
                other.allowExperimentalOps == allowExperimentalOps) &&
            (identical(other.allowDeprecatedOps, allowDeprecatedOps) ||
                other.allowDeprecatedOps == allowDeprecatedOps) &&
            (identical(other.failFast, failFast) ||
                other.failFast == failFast) &&
            (identical(other.collectStepTraces, collectStepTraces) ||
                other.collectStepTraces == collectStepTraces) &&
            (identical(other.sanitizeDiagnostics, sanitizeDiagnostics) ||
                other.sanitizeDiagnostics == sanitizeDiagnostics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allowExperimentalOps,
      allowDeprecatedOps, failFast, collectStepTraces, sanitizeDiagnostics);

  /// Create a copy of ExecutionPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutionPolicyImplCopyWith<_$ExecutionPolicyImpl> get copyWith =>
      __$$ExecutionPolicyImplCopyWithImpl<_$ExecutionPolicyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExecutionPolicyImplToJson(
      this,
    );
  }
}

abstract class _ExecutionPolicy implements ExecutionPolicy {
  const factory _ExecutionPolicy(
      {final bool allowExperimentalOps,
      final bool allowDeprecatedOps,
      final bool failFast,
      final bool collectStepTraces,
      final bool sanitizeDiagnostics}) = _$ExecutionPolicyImpl;

  factory _ExecutionPolicy.fromJson(Map<String, dynamic> json) =
      _$ExecutionPolicyImpl.fromJson;

  @override
  bool get allowExperimentalOps;
  @override
  bool get allowDeprecatedOps;
  @override
  bool get failFast;
  @override
  bool get collectStepTraces;
  @override
  bool get sanitizeDiagnostics;

  /// Create a copy of ExecutionPolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExecutionPolicyImplCopyWith<_$ExecutionPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) {
  return _Diagnostic.fromJson(json);
}

/// @nodoc
mixin _$Diagnostic {
  String get code => throw _privateConstructorUsedError;
  DiagnosticSeverity get severity => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
  Map<String, Object?> get meta => throw _privateConstructorUsedError;

  /// Serializes this Diagnostic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticCopyWith<Diagnostic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticCopyWith<$Res> {
  factory $DiagnosticCopyWith(
          Diagnostic value, $Res Function(Diagnostic) then) =
      _$DiagnosticCopyWithImpl<$Res, Diagnostic>;
  @useResult
  $Res call(
      {String code,
      DiagnosticSeverity severity,
      String message,
      String? detail,
      @JsonKey(
          fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
      Map<String, Object?> meta});
}

/// @nodoc
class _$DiagnosticCopyWithImpl<$Res, $Val extends Diagnostic>
    implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? severity = null,
    Object? message = null,
    Object? detail = freezed,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as DiagnosticSeverity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticImplCopyWith<$Res>
    implements $DiagnosticCopyWith<$Res> {
  factory _$$DiagnosticImplCopyWith(
          _$DiagnosticImpl value, $Res Function(_$DiagnosticImpl) then) =
      __$$DiagnosticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      DiagnosticSeverity severity,
      String message,
      String? detail,
      @JsonKey(
          fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
      Map<String, Object?> meta});
}

/// @nodoc
class __$$DiagnosticImplCopyWithImpl<$Res>
    extends _$DiagnosticCopyWithImpl<$Res, _$DiagnosticImpl>
    implements _$$DiagnosticImplCopyWith<$Res> {
  __$$DiagnosticImplCopyWithImpl(
      _$DiagnosticImpl _value, $Res Function(_$DiagnosticImpl) _then)
      : super(_value, _then);

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? severity = null,
    Object? message = null,
    Object? detail = freezed,
    Object? meta = null,
  }) {
    return _then(_$DiagnosticImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as DiagnosticSeverity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: null == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DiagnosticImpl implements _Diagnostic {
  const _$DiagnosticImpl(
      {required this.code,
      required this.severity,
      required this.message,
      this.detail,
      @JsonKey(
          fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
      final Map<String, Object?> meta = const <String, Object?>{}})
      : _meta = meta;

  factory _$DiagnosticImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticImplFromJson(json);

  @override
  final String code;
  @override
  final DiagnosticSeverity severity;
  @override
  final String message;
  @override
  final String? detail;
  final Map<String, Object?> _meta;
  @override
  @JsonKey(fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
  Map<String, Object?> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  String toString() {
    return 'Diagnostic(code: $code, severity: $severity, message: $message, detail: $detail, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, severity, message, detail,
      const DeepCollectionEquality().hash(_meta));

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticImplCopyWith<_$DiagnosticImpl> get copyWith =>
      __$$DiagnosticImplCopyWithImpl<_$DiagnosticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticImplToJson(
      this,
    );
  }
}

abstract class _Diagnostic implements Diagnostic {
  const factory _Diagnostic(
      {required final String code,
      required final DiagnosticSeverity severity,
      required final String message,
      final String? detail,
      @JsonKey(
          fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
      final Map<String, Object?> meta}) = _$DiagnosticImpl;

  factory _Diagnostic.fromJson(Map<String, dynamic> json) =
      _$DiagnosticImpl.fromJson;

  @override
  String get code;
  @override
  DiagnosticSeverity get severity;
  @override
  String get message;
  @override
  String? get detail;
  @override
  @JsonKey(fromJson: _stringObjectMapFromJson, toJson: _stringObjectMapToJson)
  Map<String, Object?> get meta;

  /// Create a copy of Diagnostic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticImplCopyWith<_$DiagnosticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StepMetrics _$StepMetricsFromJson(Map<String, dynamic> json) {
  return _StepMetrics.fromJson(json);
}

/// @nodoc
mixin _$StepMetrics {
  int get elapsedMs => throw _privateConstructorUsedError;
  int get inputBytes => throw _privateConstructorUsedError;
  int get outputBytes => throw _privateConstructorUsedError;

  /// Serializes this StepMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepMetricsCopyWith<StepMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepMetricsCopyWith<$Res> {
  factory $StepMetricsCopyWith(
          StepMetrics value, $Res Function(StepMetrics) then) =
      _$StepMetricsCopyWithImpl<$Res, StepMetrics>;
  @useResult
  $Res call({int elapsedMs, int inputBytes, int outputBytes});
}

/// @nodoc
class _$StepMetricsCopyWithImpl<$Res, $Val extends StepMetrics>
    implements $StepMetricsCopyWith<$Res> {
  _$StepMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsedMs = null,
    Object? inputBytes = null,
    Object? outputBytes = null,
  }) {
    return _then(_value.copyWith(
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      inputBytes: null == inputBytes
          ? _value.inputBytes
          : inputBytes // ignore: cast_nullable_to_non_nullable
              as int,
      outputBytes: null == outputBytes
          ? _value.outputBytes
          : outputBytes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepMetricsImplCopyWith<$Res>
    implements $StepMetricsCopyWith<$Res> {
  factory _$$StepMetricsImplCopyWith(
          _$StepMetricsImpl value, $Res Function(_$StepMetricsImpl) then) =
      __$$StepMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int elapsedMs, int inputBytes, int outputBytes});
}

/// @nodoc
class __$$StepMetricsImplCopyWithImpl<$Res>
    extends _$StepMetricsCopyWithImpl<$Res, _$StepMetricsImpl>
    implements _$$StepMetricsImplCopyWith<$Res> {
  __$$StepMetricsImplCopyWithImpl(
      _$StepMetricsImpl _value, $Res Function(_$StepMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StepMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsedMs = null,
    Object? inputBytes = null,
    Object? outputBytes = null,
  }) {
    return _then(_$StepMetricsImpl(
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      inputBytes: null == inputBytes
          ? _value.inputBytes
          : inputBytes // ignore: cast_nullable_to_non_nullable
              as int,
      outputBytes: null == outputBytes
          ? _value.outputBytes
          : outputBytes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StepMetricsImpl implements _StepMetrics {
  const _$StepMetricsImpl(
      {required this.elapsedMs,
      required this.inputBytes,
      required this.outputBytes});

  factory _$StepMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepMetricsImplFromJson(json);

  @override
  final int elapsedMs;
  @override
  final int inputBytes;
  @override
  final int outputBytes;

  @override
  String toString() {
    return 'StepMetrics(elapsedMs: $elapsedMs, inputBytes: $inputBytes, outputBytes: $outputBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepMetricsImpl &&
            (identical(other.elapsedMs, elapsedMs) ||
                other.elapsedMs == elapsedMs) &&
            (identical(other.inputBytes, inputBytes) ||
                other.inputBytes == inputBytes) &&
            (identical(other.outputBytes, outputBytes) ||
                other.outputBytes == outputBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, elapsedMs, inputBytes, outputBytes);

  /// Create a copy of StepMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepMetricsImplCopyWith<_$StepMetricsImpl> get copyWith =>
      __$$StepMetricsImplCopyWithImpl<_$StepMetricsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepMetricsImplToJson(
      this,
    );
  }
}

abstract class _StepMetrics implements StepMetrics {
  const factory _StepMetrics(
      {required final int elapsedMs,
      required final int inputBytes,
      required final int outputBytes}) = _$StepMetricsImpl;

  factory _StepMetrics.fromJson(Map<String, dynamic> json) =
      _$StepMetricsImpl.fromJson;

  @override
  int get elapsedMs;
  @override
  int get inputBytes;
  @override
  int get outputBytes;

  /// Create a copy of StepMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepMetricsImplCopyWith<_$StepMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StepTrace _$StepTraceFromJson(Map<String, dynamic> json) {
  return _StepTrace.fromJson(json);
}

/// @nodoc
mixin _$StepTrace {
  int get stepIndex => throw _privateConstructorUsedError;
  String get operationId => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<Diagnostic> get diagnostics => throw _privateConstructorUsedError;
  StepMetrics get metrics => throw _privateConstructorUsedError;

  /// Serializes this StepTrace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepTraceCopyWith<StepTrace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepTraceCopyWith<$Res> {
  factory $StepTraceCopyWith(StepTrace value, $Res Function(StepTrace) then) =
      _$StepTraceCopyWithImpl<$Res, StepTrace>;
  @useResult
  $Res call(
      {int stepIndex,
      String operationId,
      bool success,
      List<Diagnostic> diagnostics,
      StepMetrics metrics});

  $StepMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$StepTraceCopyWithImpl<$Res, $Val extends StepTrace>
    implements $StepTraceCopyWith<$Res> {
  _$StepTraceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepIndex = null,
    Object? operationId = null,
    Object? success = null,
    Object? diagnostics = null,
    Object? metrics = null,
  }) {
    return _then(_value.copyWith(
      stepIndex: null == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      diagnostics: null == diagnostics
          ? _value.diagnostics
          : diagnostics // ignore: cast_nullable_to_non_nullable
              as List<Diagnostic>,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StepMetrics,
    ) as $Val);
  }

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepMetricsCopyWith<$Res> get metrics {
    return $StepMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StepTraceImplCopyWith<$Res>
    implements $StepTraceCopyWith<$Res> {
  factory _$$StepTraceImplCopyWith(
          _$StepTraceImpl value, $Res Function(_$StepTraceImpl) then) =
      __$$StepTraceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stepIndex,
      String operationId,
      bool success,
      List<Diagnostic> diagnostics,
      StepMetrics metrics});

  @override
  $StepMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$StepTraceImplCopyWithImpl<$Res>
    extends _$StepTraceCopyWithImpl<$Res, _$StepTraceImpl>
    implements _$$StepTraceImplCopyWith<$Res> {
  __$$StepTraceImplCopyWithImpl(
      _$StepTraceImpl _value, $Res Function(_$StepTraceImpl) _then)
      : super(_value, _then);

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepIndex = null,
    Object? operationId = null,
    Object? success = null,
    Object? diagnostics = null,
    Object? metrics = null,
  }) {
    return _then(_$StepTraceImpl(
      stepIndex: null == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      diagnostics: null == diagnostics
          ? _value._diagnostics
          : diagnostics // ignore: cast_nullable_to_non_nullable
              as List<Diagnostic>,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StepMetrics,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$StepTraceImpl implements _StepTrace {
  const _$StepTraceImpl(
      {required this.stepIndex,
      required this.operationId,
      required this.success,
      required final List<Diagnostic> diagnostics,
      required this.metrics})
      : _diagnostics = diagnostics;

  factory _$StepTraceImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepTraceImplFromJson(json);

  @override
  final int stepIndex;
  @override
  final String operationId;
  @override
  final bool success;
  final List<Diagnostic> _diagnostics;
  @override
  List<Diagnostic> get diagnostics {
    if (_diagnostics is EqualUnmodifiableListView) return _diagnostics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnostics);
  }

  @override
  final StepMetrics metrics;

  @override
  String toString() {
    return 'StepTrace(stepIndex: $stepIndex, operationId: $operationId, success: $success, diagnostics: $diagnostics, metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepTraceImpl &&
            (identical(other.stepIndex, stepIndex) ||
                other.stepIndex == stepIndex) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._diagnostics, _diagnostics) &&
            (identical(other.metrics, metrics) || other.metrics == metrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepIndex, operationId, success,
      const DeepCollectionEquality().hash(_diagnostics), metrics);

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepTraceImplCopyWith<_$StepTraceImpl> get copyWith =>
      __$$StepTraceImplCopyWithImpl<_$StepTraceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepTraceImplToJson(
      this,
    );
  }
}

abstract class _StepTrace implements StepTrace {
  const factory _StepTrace(
      {required final int stepIndex,
      required final String operationId,
      required final bool success,
      required final List<Diagnostic> diagnostics,
      required final StepMetrics metrics}) = _$StepTraceImpl;

  factory _StepTrace.fromJson(Map<String, dynamic> json) =
      _$StepTraceImpl.fromJson;

  @override
  int get stepIndex;
  @override
  String get operationId;
  @override
  bool get success;
  @override
  List<Diagnostic> get diagnostics;
  @override
  StepMetrics get metrics;

  /// Create a copy of StepTrace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepTraceImplCopyWith<_$StepTraceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExecutionError _$ExecutionErrorFromJson(Map<String, dynamic> json) {
  return _ExecutionError.fromJson(json);
}

/// @nodoc
mixin _$ExecutionError {
  ExecutionErrorCode get code => throw _privateConstructorUsedError;
  String get userMessage => throw _privateConstructorUsedError;
  String? get developerMessage => throw _privateConstructorUsedError;
  int? get stepIndex => throw _privateConstructorUsedError;
  String? get operationId => throw _privateConstructorUsedError;

  /// Serializes this ExecutionError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExecutionError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExecutionErrorCopyWith<ExecutionError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExecutionErrorCopyWith<$Res> {
  factory $ExecutionErrorCopyWith(
          ExecutionError value, $Res Function(ExecutionError) then) =
      _$ExecutionErrorCopyWithImpl<$Res, ExecutionError>;
  @useResult
  $Res call(
      {ExecutionErrorCode code,
      String userMessage,
      String? developerMessage,
      int? stepIndex,
      String? operationId});
}

/// @nodoc
class _$ExecutionErrorCopyWithImpl<$Res, $Val extends ExecutionError>
    implements $ExecutionErrorCopyWith<$Res> {
  _$ExecutionErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExecutionError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? userMessage = null,
    Object? developerMessage = freezed,
    Object? stepIndex = freezed,
    Object? operationId = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ExecutionErrorCode,
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      developerMessage: freezed == developerMessage
          ? _value.developerMessage
          : developerMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stepIndex: freezed == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      operationId: freezed == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExecutionErrorImplCopyWith<$Res>
    implements $ExecutionErrorCopyWith<$Res> {
  factory _$$ExecutionErrorImplCopyWith(_$ExecutionErrorImpl value,
          $Res Function(_$ExecutionErrorImpl) then) =
      __$$ExecutionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExecutionErrorCode code,
      String userMessage,
      String? developerMessage,
      int? stepIndex,
      String? operationId});
}

/// @nodoc
class __$$ExecutionErrorImplCopyWithImpl<$Res>
    extends _$ExecutionErrorCopyWithImpl<$Res, _$ExecutionErrorImpl>
    implements _$$ExecutionErrorImplCopyWith<$Res> {
  __$$ExecutionErrorImplCopyWithImpl(
      _$ExecutionErrorImpl _value, $Res Function(_$ExecutionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExecutionError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? userMessage = null,
    Object? developerMessage = freezed,
    Object? stepIndex = freezed,
    Object? operationId = freezed,
  }) {
    return _then(_$ExecutionErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as ExecutionErrorCode,
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      developerMessage: freezed == developerMessage
          ? _value.developerMessage
          : developerMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stepIndex: freezed == stepIndex
          ? _value.stepIndex
          : stepIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      operationId: freezed == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ExecutionErrorImpl implements _ExecutionError {
  const _$ExecutionErrorImpl(
      {required this.code,
      required this.userMessage,
      this.developerMessage,
      this.stepIndex,
      this.operationId});

  factory _$ExecutionErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExecutionErrorImplFromJson(json);

  @override
  final ExecutionErrorCode code;
  @override
  final String userMessage;
  @override
  final String? developerMessage;
  @override
  final int? stepIndex;
  @override
  final String? operationId;

  @override
  String toString() {
    return 'ExecutionError(code: $code, userMessage: $userMessage, developerMessage: $developerMessage, stepIndex: $stepIndex, operationId: $operationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutionErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage) &&
            (identical(other.developerMessage, developerMessage) ||
                other.developerMessage == developerMessage) &&
            (identical(other.stepIndex, stepIndex) ||
                other.stepIndex == stepIndex) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, userMessage, developerMessage, stepIndex, operationId);

  /// Create a copy of ExecutionError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutionErrorImplCopyWith<_$ExecutionErrorImpl> get copyWith =>
      __$$ExecutionErrorImplCopyWithImpl<_$ExecutionErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExecutionErrorImplToJson(
      this,
    );
  }
}

abstract class _ExecutionError implements ExecutionError {
  const factory _ExecutionError(
      {required final ExecutionErrorCode code,
      required final String userMessage,
      final String? developerMessage,
      final int? stepIndex,
      final String? operationId}) = _$ExecutionErrorImpl;

  factory _ExecutionError.fromJson(Map<String, dynamic> json) =
      _$ExecutionErrorImpl.fromJson;

  @override
  ExecutionErrorCode get code;
  @override
  String get userMessage;
  @override
  String? get developerMessage;
  @override
  int? get stepIndex;
  @override
  String? get operationId;

  /// Create a copy of ExecutionError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExecutionErrorImplCopyWith<_$ExecutionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExecutionMetrics _$ExecutionMetricsFromJson(Map<String, dynamic> json) {
  return _ExecutionMetrics.fromJson(json);
}

/// @nodoc
mixin _$ExecutionMetrics {
  int get elapsedMs => throw _privateConstructorUsedError;
  int get stepsAttempted => throw _privateConstructorUsedError;

  /// Serializes this ExecutionMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExecutionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExecutionMetricsCopyWith<ExecutionMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExecutionMetricsCopyWith<$Res> {
  factory $ExecutionMetricsCopyWith(
          ExecutionMetrics value, $Res Function(ExecutionMetrics) then) =
      _$ExecutionMetricsCopyWithImpl<$Res, ExecutionMetrics>;
  @useResult
  $Res call({int elapsedMs, int stepsAttempted});
}

/// @nodoc
class _$ExecutionMetricsCopyWithImpl<$Res, $Val extends ExecutionMetrics>
    implements $ExecutionMetricsCopyWith<$Res> {
  _$ExecutionMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExecutionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsedMs = null,
    Object? stepsAttempted = null,
  }) {
    return _then(_value.copyWith(
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      stepsAttempted: null == stepsAttempted
          ? _value.stepsAttempted
          : stepsAttempted // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExecutionMetricsImplCopyWith<$Res>
    implements $ExecutionMetricsCopyWith<$Res> {
  factory _$$ExecutionMetricsImplCopyWith(_$ExecutionMetricsImpl value,
          $Res Function(_$ExecutionMetricsImpl) then) =
      __$$ExecutionMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int elapsedMs, int stepsAttempted});
}

/// @nodoc
class __$$ExecutionMetricsImplCopyWithImpl<$Res>
    extends _$ExecutionMetricsCopyWithImpl<$Res, _$ExecutionMetricsImpl>
    implements _$$ExecutionMetricsImplCopyWith<$Res> {
  __$$ExecutionMetricsImplCopyWithImpl(_$ExecutionMetricsImpl _value,
      $Res Function(_$ExecutionMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExecutionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsedMs = null,
    Object? stepsAttempted = null,
  }) {
    return _then(_$ExecutionMetricsImpl(
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      stepsAttempted: null == stepsAttempted
          ? _value.stepsAttempted
          : stepsAttempted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ExecutionMetricsImpl implements _ExecutionMetrics {
  const _$ExecutionMetricsImpl(
      {required this.elapsedMs, required this.stepsAttempted});

  factory _$ExecutionMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExecutionMetricsImplFromJson(json);

  @override
  final int elapsedMs;
  @override
  final int stepsAttempted;

  @override
  String toString() {
    return 'ExecutionMetrics(elapsedMs: $elapsedMs, stepsAttempted: $stepsAttempted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutionMetricsImpl &&
            (identical(other.elapsedMs, elapsedMs) ||
                other.elapsedMs == elapsedMs) &&
            (identical(other.stepsAttempted, stepsAttempted) ||
                other.stepsAttempted == stepsAttempted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, elapsedMs, stepsAttempted);

  /// Create a copy of ExecutionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutionMetricsImplCopyWith<_$ExecutionMetricsImpl> get copyWith =>
      __$$ExecutionMetricsImplCopyWithImpl<_$ExecutionMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExecutionMetricsImplToJson(
      this,
    );
  }
}

abstract class _ExecutionMetrics implements ExecutionMetrics {
  const factory _ExecutionMetrics(
      {required final int elapsedMs,
      required final int stepsAttempted}) = _$ExecutionMetricsImpl;

  factory _ExecutionMetrics.fromJson(Map<String, dynamic> json) =
      _$ExecutionMetricsImpl.fromJson;

  @override
  int get elapsedMs;
  @override
  int get stepsAttempted;

  /// Create a copy of ExecutionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExecutionMetricsImplCopyWith<_$ExecutionMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParamValidationIssue _$ParamValidationIssueFromJson(Map<String, dynamic> json) {
  return _ParamValidationIssue.fromJson(json);
}

/// @nodoc
mixin _$ParamValidationIssue {
  String get paramId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ParamValidationIssue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParamValidationIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParamValidationIssueCopyWith<ParamValidationIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamValidationIssueCopyWith<$Res> {
  factory $ParamValidationIssueCopyWith(ParamValidationIssue value,
          $Res Function(ParamValidationIssue) then) =
      _$ParamValidationIssueCopyWithImpl<$Res, ParamValidationIssue>;
  @useResult
  $Res call({String paramId, String message});
}

/// @nodoc
class _$ParamValidationIssueCopyWithImpl<$Res,
        $Val extends ParamValidationIssue>
    implements $ParamValidationIssueCopyWith<$Res> {
  _$ParamValidationIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParamValidationIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paramId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      paramId: null == paramId
          ? _value.paramId
          : paramId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParamValidationIssueImplCopyWith<$Res>
    implements $ParamValidationIssueCopyWith<$Res> {
  factory _$$ParamValidationIssueImplCopyWith(_$ParamValidationIssueImpl value,
          $Res Function(_$ParamValidationIssueImpl) then) =
      __$$ParamValidationIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String paramId, String message});
}

/// @nodoc
class __$$ParamValidationIssueImplCopyWithImpl<$Res>
    extends _$ParamValidationIssueCopyWithImpl<$Res, _$ParamValidationIssueImpl>
    implements _$$ParamValidationIssueImplCopyWith<$Res> {
  __$$ParamValidationIssueImplCopyWithImpl(_$ParamValidationIssueImpl _value,
      $Res Function(_$ParamValidationIssueImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParamValidationIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paramId = null,
    Object? message = null,
  }) {
    return _then(_$ParamValidationIssueImpl(
      paramId: null == paramId
          ? _value.paramId
          : paramId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ParamValidationIssueImpl implements _ParamValidationIssue {
  const _$ParamValidationIssueImpl(
      {required this.paramId, required this.message});

  factory _$ParamValidationIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamValidationIssueImplFromJson(json);

  @override
  final String paramId;
  @override
  final String message;

  @override
  String toString() {
    return 'ParamValidationIssue(paramId: $paramId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamValidationIssueImpl &&
            (identical(other.paramId, paramId) || other.paramId == paramId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paramId, message);

  /// Create a copy of ParamValidationIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamValidationIssueImplCopyWith<_$ParamValidationIssueImpl>
      get copyWith =>
          __$$ParamValidationIssueImplCopyWithImpl<_$ParamValidationIssueImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamValidationIssueImplToJson(
      this,
    );
  }
}

abstract class _ParamValidationIssue implements ParamValidationIssue {
  const factory _ParamValidationIssue(
      {required final String paramId,
      required final String message}) = _$ParamValidationIssueImpl;

  factory _ParamValidationIssue.fromJson(Map<String, dynamic> json) =
      _$ParamValidationIssueImpl.fromJson;

  @override
  String get paramId;
  @override
  String get message;

  /// Create a copy of ParamValidationIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParamValidationIssueImplCopyWith<_$ParamValidationIssueImpl>
      get copyWith => throw _privateConstructorUsedError;
}
