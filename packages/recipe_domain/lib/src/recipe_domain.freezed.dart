// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InputAssumptions _$InputAssumptionsFromJson(Map<String, dynamic> json) {
  return _InputAssumptions.fromJson(json);
}

/// @nodoc
mixin _$InputAssumptions {
  PayloadKind get preferredKind => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this InputAssumptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputAssumptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputAssumptionsCopyWith<InputAssumptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputAssumptionsCopyWith<$Res> {
  factory $InputAssumptionsCopyWith(
          InputAssumptions value, $Res Function(InputAssumptions) then) =
      _$InputAssumptionsCopyWithImpl<$Res, InputAssumptions>;
  @useResult
  $Res call({PayloadKind preferredKind, String? notes});
}

/// @nodoc
class _$InputAssumptionsCopyWithImpl<$Res, $Val extends InputAssumptions>
    implements $InputAssumptionsCopyWith<$Res> {
  _$InputAssumptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputAssumptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredKind = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      preferredKind: null == preferredKind
          ? _value.preferredKind
          : preferredKind // ignore: cast_nullable_to_non_nullable
              as PayloadKind,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputAssumptionsImplCopyWith<$Res>
    implements $InputAssumptionsCopyWith<$Res> {
  factory _$$InputAssumptionsImplCopyWith(_$InputAssumptionsImpl value,
          $Res Function(_$InputAssumptionsImpl) then) =
      __$$InputAssumptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PayloadKind preferredKind, String? notes});
}

/// @nodoc
class __$$InputAssumptionsImplCopyWithImpl<$Res>
    extends _$InputAssumptionsCopyWithImpl<$Res, _$InputAssumptionsImpl>
    implements _$$InputAssumptionsImplCopyWith<$Res> {
  __$$InputAssumptionsImplCopyWithImpl(_$InputAssumptionsImpl _value,
      $Res Function(_$InputAssumptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InputAssumptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredKind = null,
    Object? notes = freezed,
  }) {
    return _then(_$InputAssumptionsImpl(
      preferredKind: null == preferredKind
          ? _value.preferredKind
          : preferredKind // ignore: cast_nullable_to_non_nullable
              as PayloadKind,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InputAssumptionsImpl implements _InputAssumptions {
  const _$InputAssumptionsImpl({required this.preferredKind, this.notes});

  factory _$InputAssumptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputAssumptionsImplFromJson(json);

  @override
  final PayloadKind preferredKind;
  @override
  final String? notes;

  @override
  String toString() {
    return 'InputAssumptions(preferredKind: $preferredKind, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputAssumptionsImpl &&
            (identical(other.preferredKind, preferredKind) ||
                other.preferredKind == preferredKind) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, preferredKind, notes);

  /// Create a copy of InputAssumptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputAssumptionsImplCopyWith<_$InputAssumptionsImpl> get copyWith =>
      __$$InputAssumptionsImplCopyWithImpl<_$InputAssumptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputAssumptionsImplToJson(
      this,
    );
  }
}

abstract class _InputAssumptions implements InputAssumptions {
  const factory _InputAssumptions(
      {required final PayloadKind preferredKind,
      final String? notes}) = _$InputAssumptionsImpl;

  factory _InputAssumptions.fromJson(Map<String, dynamic> json) =
      _$InputAssumptionsImpl.fromJson;

  @override
  PayloadKind get preferredKind;
  @override
  String? get notes;

  /// Create a copy of InputAssumptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputAssumptionsImplCopyWith<_$InputAssumptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequiredPackRef _$RequiredPackRefFromJson(Map<String, dynamic> json) {
  return _RequiredPackRef.fromJson(json);
}

/// @nodoc
mixin _$RequiredPackRef {
  String get packId => throw _privateConstructorUsedError;
  String get versionRange => throw _privateConstructorUsedError;

  /// Serializes this RequiredPackRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequiredPackRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequiredPackRefCopyWith<RequiredPackRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequiredPackRefCopyWith<$Res> {
  factory $RequiredPackRefCopyWith(
          RequiredPackRef value, $Res Function(RequiredPackRef) then) =
      _$RequiredPackRefCopyWithImpl<$Res, RequiredPackRef>;
  @useResult
  $Res call({String packId, String versionRange});
}

/// @nodoc
class _$RequiredPackRefCopyWithImpl<$Res, $Val extends RequiredPackRef>
    implements $RequiredPackRefCopyWith<$Res> {
  _$RequiredPackRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequiredPackRef
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
abstract class _$$RequiredPackRefImplCopyWith<$Res>
    implements $RequiredPackRefCopyWith<$Res> {
  factory _$$RequiredPackRefImplCopyWith(_$RequiredPackRefImpl value,
          $Res Function(_$RequiredPackRefImpl) then) =
      __$$RequiredPackRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String packId, String versionRange});
}

/// @nodoc
class __$$RequiredPackRefImplCopyWithImpl<$Res>
    extends _$RequiredPackRefCopyWithImpl<$Res, _$RequiredPackRefImpl>
    implements _$$RequiredPackRefImplCopyWith<$Res> {
  __$$RequiredPackRefImplCopyWithImpl(
      _$RequiredPackRefImpl _value, $Res Function(_$RequiredPackRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequiredPackRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packId = null,
    Object? versionRange = null,
  }) {
    return _then(_$RequiredPackRefImpl(
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
class _$RequiredPackRefImpl implements _RequiredPackRef {
  const _$RequiredPackRefImpl(
      {required this.packId, required this.versionRange});

  factory _$RequiredPackRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequiredPackRefImplFromJson(json);

  @override
  final String packId;
  @override
  final String versionRange;

  @override
  String toString() {
    return 'RequiredPackRef(packId: $packId, versionRange: $versionRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequiredPackRefImpl &&
            (identical(other.packId, packId) || other.packId == packId) &&
            (identical(other.versionRange, versionRange) ||
                other.versionRange == versionRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packId, versionRange);

  /// Create a copy of RequiredPackRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequiredPackRefImplCopyWith<_$RequiredPackRefImpl> get copyWith =>
      __$$RequiredPackRefImplCopyWithImpl<_$RequiredPackRefImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequiredPackRefImplToJson(
      this,
    );
  }
}

abstract class _RequiredPackRef implements RequiredPackRef {
  const factory _RequiredPackRef(
      {required final String packId,
      required final String versionRange}) = _$RequiredPackRefImpl;

  factory _RequiredPackRef.fromJson(Map<String, dynamic> json) =
      _$RequiredPackRefImpl.fromJson;

  @override
  String get packId;
  @override
  String get versionRange;

  /// Create a copy of RequiredPackRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequiredPackRefImplCopyWith<_$RequiredPackRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeprecatedOperationFallback _$DeprecatedOperationFallbackFromJson(
    Map<String, dynamic> json) {
  return _DeprecatedOperationFallback.fromJson(json);
}

/// @nodoc
mixin _$DeprecatedOperationFallback {
  String get operationId => throw _privateConstructorUsedError;
  String get replacementOperationId => throw _privateConstructorUsedError;

  /// Serializes this DeprecatedOperationFallback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecatedOperationFallback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecatedOperationFallbackCopyWith<DeprecatedOperationFallback>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecatedOperationFallbackCopyWith<$Res> {
  factory $DeprecatedOperationFallbackCopyWith(
          DeprecatedOperationFallback value,
          $Res Function(DeprecatedOperationFallback) then) =
      _$DeprecatedOperationFallbackCopyWithImpl<$Res,
          DeprecatedOperationFallback>;
  @useResult
  $Res call({String operationId, String replacementOperationId});
}

/// @nodoc
class _$DeprecatedOperationFallbackCopyWithImpl<$Res,
        $Val extends DeprecatedOperationFallback>
    implements $DeprecatedOperationFallbackCopyWith<$Res> {
  _$DeprecatedOperationFallbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecatedOperationFallback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? replacementOperationId = null,
  }) {
    return _then(_value.copyWith(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: null == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeprecatedOperationFallbackImplCopyWith<$Res>
    implements $DeprecatedOperationFallbackCopyWith<$Res> {
  factory _$$DeprecatedOperationFallbackImplCopyWith(
          _$DeprecatedOperationFallbackImpl value,
          $Res Function(_$DeprecatedOperationFallbackImpl) then) =
      __$$DeprecatedOperationFallbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String operationId, String replacementOperationId});
}

/// @nodoc
class __$$DeprecatedOperationFallbackImplCopyWithImpl<$Res>
    extends _$DeprecatedOperationFallbackCopyWithImpl<$Res,
        _$DeprecatedOperationFallbackImpl>
    implements _$$DeprecatedOperationFallbackImplCopyWith<$Res> {
  __$$DeprecatedOperationFallbackImplCopyWithImpl(
      _$DeprecatedOperationFallbackImpl _value,
      $Res Function(_$DeprecatedOperationFallbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeprecatedOperationFallback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? replacementOperationId = null,
  }) {
    return _then(_$DeprecatedOperationFallbackImpl(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      replacementOperationId: null == replacementOperationId
          ? _value.replacementOperationId
          : replacementOperationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DeprecatedOperationFallbackImpl
    implements _DeprecatedOperationFallback {
  const _$DeprecatedOperationFallbackImpl(
      {required this.operationId, required this.replacementOperationId});

  factory _$DeprecatedOperationFallbackImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeprecatedOperationFallbackImplFromJson(json);

  @override
  final String operationId;
  @override
  final String replacementOperationId;

  @override
  String toString() {
    return 'DeprecatedOperationFallback(operationId: $operationId, replacementOperationId: $replacementOperationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeprecatedOperationFallbackImpl &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.replacementOperationId, replacementOperationId) ||
                other.replacementOperationId == replacementOperationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, operationId, replacementOperationId);

  /// Create a copy of DeprecatedOperationFallback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeprecatedOperationFallbackImplCopyWith<_$DeprecatedOperationFallbackImpl>
      get copyWith => __$$DeprecatedOperationFallbackImplCopyWithImpl<
          _$DeprecatedOperationFallbackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeprecatedOperationFallbackImplToJson(
      this,
    );
  }
}

abstract class _DeprecatedOperationFallback
    implements DeprecatedOperationFallback {
  const factory _DeprecatedOperationFallback(
          {required final String operationId,
          required final String replacementOperationId}) =
      _$DeprecatedOperationFallbackImpl;

  factory _DeprecatedOperationFallback.fromJson(Map<String, dynamic> json) =
      _$DeprecatedOperationFallbackImpl.fromJson;

  @override
  String get operationId;
  @override
  String get replacementOperationId;

  /// Create a copy of DeprecatedOperationFallback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeprecatedOperationFallbackImplCopyWith<_$DeprecatedOperationFallbackImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecipeCompatibility _$RecipeCompatibilityFromJson(Map<String, dynamic> json) {
  return _RecipeCompatibility.fromJson(json);
}

/// @nodoc
mixin _$RecipeCompatibility {
  String get minAppProtocolVersion => throw _privateConstructorUsedError;
  List<RequiredPackRef> get requiredPacks => throw _privateConstructorUsedError;
  List<DeprecatedOperationFallback> get deprecatedOperationFallbacks =>
      throw _privateConstructorUsedError;

  /// Serializes this RecipeCompatibility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeCompatibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCompatibilityCopyWith<RecipeCompatibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCompatibilityCopyWith<$Res> {
  factory $RecipeCompatibilityCopyWith(
          RecipeCompatibility value, $Res Function(RecipeCompatibility) then) =
      _$RecipeCompatibilityCopyWithImpl<$Res, RecipeCompatibility>;
  @useResult
  $Res call(
      {String minAppProtocolVersion,
      List<RequiredPackRef> requiredPacks,
      List<DeprecatedOperationFallback> deprecatedOperationFallbacks});
}

/// @nodoc
class _$RecipeCompatibilityCopyWithImpl<$Res, $Val extends RecipeCompatibility>
    implements $RecipeCompatibilityCopyWith<$Res> {
  _$RecipeCompatibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeCompatibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAppProtocolVersion = null,
    Object? requiredPacks = null,
    Object? deprecatedOperationFallbacks = null,
  }) {
    return _then(_value.copyWith(
      minAppProtocolVersion: null == minAppProtocolVersion
          ? _value.minAppProtocolVersion
          : minAppProtocolVersion // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPacks: null == requiredPacks
          ? _value.requiredPacks
          : requiredPacks // ignore: cast_nullable_to_non_nullable
              as List<RequiredPackRef>,
      deprecatedOperationFallbacks: null == deprecatedOperationFallbacks
          ? _value.deprecatedOperationFallbacks
          : deprecatedOperationFallbacks // ignore: cast_nullable_to_non_nullable
              as List<DeprecatedOperationFallback>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeCompatibilityImplCopyWith<$Res>
    implements $RecipeCompatibilityCopyWith<$Res> {
  factory _$$RecipeCompatibilityImplCopyWith(_$RecipeCompatibilityImpl value,
          $Res Function(_$RecipeCompatibilityImpl) then) =
      __$$RecipeCompatibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String minAppProtocolVersion,
      List<RequiredPackRef> requiredPacks,
      List<DeprecatedOperationFallback> deprecatedOperationFallbacks});
}

/// @nodoc
class __$$RecipeCompatibilityImplCopyWithImpl<$Res>
    extends _$RecipeCompatibilityCopyWithImpl<$Res, _$RecipeCompatibilityImpl>
    implements _$$RecipeCompatibilityImplCopyWith<$Res> {
  __$$RecipeCompatibilityImplCopyWithImpl(_$RecipeCompatibilityImpl _value,
      $Res Function(_$RecipeCompatibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeCompatibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAppProtocolVersion = null,
    Object? requiredPacks = null,
    Object? deprecatedOperationFallbacks = null,
  }) {
    return _then(_$RecipeCompatibilityImpl(
      minAppProtocolVersion: null == minAppProtocolVersion
          ? _value.minAppProtocolVersion
          : minAppProtocolVersion // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPacks: null == requiredPacks
          ? _value._requiredPacks
          : requiredPacks // ignore: cast_nullable_to_non_nullable
              as List<RequiredPackRef>,
      deprecatedOperationFallbacks: null == deprecatedOperationFallbacks
          ? _value._deprecatedOperationFallbacks
          : deprecatedOperationFallbacks // ignore: cast_nullable_to_non_nullable
              as List<DeprecatedOperationFallback>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeCompatibilityImpl implements _RecipeCompatibility {
  const _$RecipeCompatibilityImpl(
      {required this.minAppProtocolVersion,
      required final List<RequiredPackRef> requiredPacks,
      final List<DeprecatedOperationFallback> deprecatedOperationFallbacks =
          const <DeprecatedOperationFallback>[]})
      : _requiredPacks = requiredPacks,
        _deprecatedOperationFallbacks = deprecatedOperationFallbacks;

  factory _$RecipeCompatibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeCompatibilityImplFromJson(json);

  @override
  final String minAppProtocolVersion;
  final List<RequiredPackRef> _requiredPacks;
  @override
  List<RequiredPackRef> get requiredPacks {
    if (_requiredPacks is EqualUnmodifiableListView) return _requiredPacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredPacks);
  }

  final List<DeprecatedOperationFallback> _deprecatedOperationFallbacks;
  @override
  @JsonKey()
  List<DeprecatedOperationFallback> get deprecatedOperationFallbacks {
    if (_deprecatedOperationFallbacks is EqualUnmodifiableListView)
      return _deprecatedOperationFallbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deprecatedOperationFallbacks);
  }

  @override
  String toString() {
    return 'RecipeCompatibility(minAppProtocolVersion: $minAppProtocolVersion, requiredPacks: $requiredPacks, deprecatedOperationFallbacks: $deprecatedOperationFallbacks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeCompatibilityImpl &&
            (identical(other.minAppProtocolVersion, minAppProtocolVersion) ||
                other.minAppProtocolVersion == minAppProtocolVersion) &&
            const DeepCollectionEquality()
                .equals(other._requiredPacks, _requiredPacks) &&
            const DeepCollectionEquality().equals(
                other._deprecatedOperationFallbacks,
                _deprecatedOperationFallbacks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      minAppProtocolVersion,
      const DeepCollectionEquality().hash(_requiredPacks),
      const DeepCollectionEquality().hash(_deprecatedOperationFallbacks));

  /// Create a copy of RecipeCompatibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeCompatibilityImplCopyWith<_$RecipeCompatibilityImpl> get copyWith =>
      __$$RecipeCompatibilityImplCopyWithImpl<_$RecipeCompatibilityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeCompatibilityImplToJson(
      this,
    );
  }
}

abstract class _RecipeCompatibility implements RecipeCompatibility {
  const factory _RecipeCompatibility(
      {required final String minAppProtocolVersion,
      required final List<RequiredPackRef> requiredPacks,
      final List<DeprecatedOperationFallback>
          deprecatedOperationFallbacks}) = _$RecipeCompatibilityImpl;

  factory _RecipeCompatibility.fromJson(Map<String, dynamic> json) =
      _$RecipeCompatibilityImpl.fromJson;

  @override
  String get minAppProtocolVersion;
  @override
  List<RequiredPackRef> get requiredPacks;
  @override
  List<DeprecatedOperationFallback> get deprecatedOperationFallbacks;

  /// Create a copy of RecipeCompatibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeCompatibilityImplCopyWith<_$RecipeCompatibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeOperationRef _$RecipeOperationRefFromJson(Map<String, dynamic> json) {
  return _RecipeOperationRef.fromJson(json);
}

/// @nodoc
mixin _$RecipeOperationRef {
  String get id => throw _privateConstructorUsedError;
  String get versionRange => throw _privateConstructorUsedError;

  /// Serializes this RecipeOperationRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeOperationRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeOperationRefCopyWith<RecipeOperationRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeOperationRefCopyWith<$Res> {
  factory $RecipeOperationRefCopyWith(
          RecipeOperationRef value, $Res Function(RecipeOperationRef) then) =
      _$RecipeOperationRefCopyWithImpl<$Res, RecipeOperationRef>;
  @useResult
  $Res call({String id, String versionRange});
}

/// @nodoc
class _$RecipeOperationRefCopyWithImpl<$Res, $Val extends RecipeOperationRef>
    implements $RecipeOperationRefCopyWith<$Res> {
  _$RecipeOperationRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeOperationRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? versionRange = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      versionRange: null == versionRange
          ? _value.versionRange
          : versionRange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeOperationRefImplCopyWith<$Res>
    implements $RecipeOperationRefCopyWith<$Res> {
  factory _$$RecipeOperationRefImplCopyWith(_$RecipeOperationRefImpl value,
          $Res Function(_$RecipeOperationRefImpl) then) =
      __$$RecipeOperationRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String versionRange});
}

/// @nodoc
class __$$RecipeOperationRefImplCopyWithImpl<$Res>
    extends _$RecipeOperationRefCopyWithImpl<$Res, _$RecipeOperationRefImpl>
    implements _$$RecipeOperationRefImplCopyWith<$Res> {
  __$$RecipeOperationRefImplCopyWithImpl(_$RecipeOperationRefImpl _value,
      $Res Function(_$RecipeOperationRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeOperationRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? versionRange = null,
  }) {
    return _then(_$RecipeOperationRefImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$RecipeOperationRefImpl implements _RecipeOperationRef {
  const _$RecipeOperationRefImpl(
      {required this.id, required this.versionRange});

  factory _$RecipeOperationRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeOperationRefImplFromJson(json);

  @override
  final String id;
  @override
  final String versionRange;

  @override
  String toString() {
    return 'RecipeOperationRef(id: $id, versionRange: $versionRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeOperationRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.versionRange, versionRange) ||
                other.versionRange == versionRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, versionRange);

  /// Create a copy of RecipeOperationRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeOperationRefImplCopyWith<_$RecipeOperationRefImpl> get copyWith =>
      __$$RecipeOperationRefImplCopyWithImpl<_$RecipeOperationRefImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeOperationRefImplToJson(
      this,
    );
  }
}

abstract class _RecipeOperationRef implements RecipeOperationRef {
  const factory _RecipeOperationRef(
      {required final String id,
      required final String versionRange}) = _$RecipeOperationRefImpl;

  factory _RecipeOperationRef.fromJson(Map<String, dynamic> json) =
      _$RecipeOperationRefImpl.fromJson;

  @override
  String get id;
  @override
  String get versionRange;

  /// Create a copy of RecipeOperationRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeOperationRefImplCopyWith<_$RecipeOperationRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeAssertion _$RecipeAssertionFromJson(Map<String, dynamic> json) {
  return _RecipeAssertion.fromJson(json);
}

/// @nodoc
mixin _$RecipeAssertion {
  String get type => throw _privateConstructorUsedError;
  Map<String, Object?> get config => throw _privateConstructorUsedError;

  /// Serializes this RecipeAssertion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeAssertion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeAssertionCopyWith<RecipeAssertion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeAssertionCopyWith<$Res> {
  factory $RecipeAssertionCopyWith(
          RecipeAssertion value, $Res Function(RecipeAssertion) then) =
      _$RecipeAssertionCopyWithImpl<$Res, RecipeAssertion>;
  @useResult
  $Res call({String type, Map<String, Object?> config});
}

/// @nodoc
class _$RecipeAssertionCopyWithImpl<$Res, $Val extends RecipeAssertion>
    implements $RecipeAssertionCopyWith<$Res> {
  _$RecipeAssertionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeAssertion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeAssertionImplCopyWith<$Res>
    implements $RecipeAssertionCopyWith<$Res> {
  factory _$$RecipeAssertionImplCopyWith(_$RecipeAssertionImpl value,
          $Res Function(_$RecipeAssertionImpl) then) =
      __$$RecipeAssertionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, Map<String, Object?> config});
}

/// @nodoc
class __$$RecipeAssertionImplCopyWithImpl<$Res>
    extends _$RecipeAssertionCopyWithImpl<$Res, _$RecipeAssertionImpl>
    implements _$$RecipeAssertionImplCopyWith<$Res> {
  __$$RecipeAssertionImplCopyWithImpl(
      _$RecipeAssertionImpl _value, $Res Function(_$RecipeAssertionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeAssertion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? config = null,
  }) {
    return _then(_$RecipeAssertionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeAssertionImpl implements _RecipeAssertion {
  const _$RecipeAssertionImpl(
      {required this.type,
      final Map<String, Object?> config = const <String, Object?>{}})
      : _config = config;

  factory _$RecipeAssertionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeAssertionImplFromJson(json);

  @override
  final String type;
  final Map<String, Object?> _config;
  @override
  @JsonKey()
  Map<String, Object?> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  String toString() {
    return 'RecipeAssertion(type: $type, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeAssertionImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._config, _config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_config));

  /// Create a copy of RecipeAssertion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeAssertionImplCopyWith<_$RecipeAssertionImpl> get copyWith =>
      __$$RecipeAssertionImplCopyWithImpl<_$RecipeAssertionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeAssertionImplToJson(
      this,
    );
  }
}

abstract class _RecipeAssertion implements RecipeAssertion {
  const factory _RecipeAssertion(
      {required final String type,
      final Map<String, Object?> config}) = _$RecipeAssertionImpl;

  factory _RecipeAssertion.fromJson(Map<String, dynamic> json) =
      _$RecipeAssertionImpl.fromJson;

  @override
  String get type;
  @override
  Map<String, Object?> get config;

  /// Create a copy of RecipeAssertion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeAssertionImplCopyWith<_$RecipeAssertionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return _RecipeStep.fromJson(json);
}

/// @nodoc
mixin _$RecipeStep {
  String get stepId => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  RecipeOperationRef get operation => throw _privateConstructorUsedError;
  Map<String, Object?> get params => throw _privateConstructorUsedError;
  List<RecipeAssertion> get assertions => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this RecipeStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeStepCopyWith<RecipeStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStepCopyWith<$Res> {
  factory $RecipeStepCopyWith(
          RecipeStep value, $Res Function(RecipeStep) then) =
      _$RecipeStepCopyWithImpl<$Res, RecipeStep>;
  @useResult
  $Res call(
      {String stepId,
      bool enabled,
      RecipeOperationRef operation,
      Map<String, Object?> params,
      List<RecipeAssertion> assertions,
      String? label});

  $RecipeOperationRefCopyWith<$Res> get operation;
}

/// @nodoc
class _$RecipeStepCopyWithImpl<$Res, $Val extends RecipeStep>
    implements $RecipeStepCopyWith<$Res> {
  _$RecipeStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? enabled = null,
    Object? operation = null,
    Object? params = null,
    Object? assertions = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as RecipeOperationRef,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      assertions: null == assertions
          ? _value.assertions
          : assertions // ignore: cast_nullable_to_non_nullable
              as List<RecipeAssertion>,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeOperationRefCopyWith<$Res> get operation {
    return $RecipeOperationRefCopyWith<$Res>(_value.operation, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeStepImplCopyWith<$Res>
    implements $RecipeStepCopyWith<$Res> {
  factory _$$RecipeStepImplCopyWith(
          _$RecipeStepImpl value, $Res Function(_$RecipeStepImpl) then) =
      __$$RecipeStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stepId,
      bool enabled,
      RecipeOperationRef operation,
      Map<String, Object?> params,
      List<RecipeAssertion> assertions,
      String? label});

  @override
  $RecipeOperationRefCopyWith<$Res> get operation;
}

/// @nodoc
class __$$RecipeStepImplCopyWithImpl<$Res>
    extends _$RecipeStepCopyWithImpl<$Res, _$RecipeStepImpl>
    implements _$$RecipeStepImplCopyWith<$Res> {
  __$$RecipeStepImplCopyWithImpl(
      _$RecipeStepImpl _value, $Res Function(_$RecipeStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? enabled = null,
    Object? operation = null,
    Object? params = null,
    Object? assertions = null,
    Object? label = freezed,
  }) {
    return _then(_$RecipeStepImpl(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as RecipeOperationRef,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      assertions: null == assertions
          ? _value._assertions
          : assertions // ignore: cast_nullable_to_non_nullable
              as List<RecipeAssertion>,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeStepImpl implements _RecipeStep {
  const _$RecipeStepImpl(
      {required this.stepId,
      required this.enabled,
      required this.operation,
      required final Map<String, Object?> params,
      final List<RecipeAssertion> assertions = const <RecipeAssertion>[],
      this.label})
      : _params = params,
        _assertions = assertions;

  factory _$RecipeStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeStepImplFromJson(json);

  @override
  final String stepId;
  @override
  final bool enabled;
  @override
  final RecipeOperationRef operation;
  final Map<String, Object?> _params;
  @override
  Map<String, Object?> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  final List<RecipeAssertion> _assertions;
  @override
  @JsonKey()
  List<RecipeAssertion> get assertions {
    if (_assertions is EqualUnmodifiableListView) return _assertions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assertions);
  }

  @override
  final String? label;

  @override
  String toString() {
    return 'RecipeStep(stepId: $stepId, enabled: $enabled, operation: $operation, params: $params, assertions: $assertions, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStepImpl &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            const DeepCollectionEquality()
                .equals(other._assertions, _assertions) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stepId,
      enabled,
      operation,
      const DeepCollectionEquality().hash(_params),
      const DeepCollectionEquality().hash(_assertions),
      label);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      __$$RecipeStepImplCopyWithImpl<_$RecipeStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeStepImplToJson(
      this,
    );
  }
}

abstract class _RecipeStep implements RecipeStep {
  const factory _RecipeStep(
      {required final String stepId,
      required final bool enabled,
      required final RecipeOperationRef operation,
      required final Map<String, Object?> params,
      final List<RecipeAssertion> assertions,
      final String? label}) = _$RecipeStepImpl;

  factory _RecipeStep.fromJson(Map<String, dynamic> json) =
      _$RecipeStepImpl.fromJson;

  @override
  String get stepId;
  @override
  bool get enabled;
  @override
  RecipeOperationRef get operation;
  @override
  Map<String, Object?> get params;
  @override
  List<RecipeAssertion> get assertions;
  @override
  String? get label;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeNote _$RecipeNoteFromJson(Map<String, dynamic> json) {
  return _RecipeNote.fromJson(json);
}

/// @nodoc
mixin _$RecipeNote {
  String get type => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this RecipeNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeNoteCopyWith<RecipeNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeNoteCopyWith<$Res> {
  factory $RecipeNoteCopyWith(
          RecipeNote value, $Res Function(RecipeNote) then) =
      _$RecipeNoteCopyWithImpl<$Res, RecipeNote>;
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class _$RecipeNoteCopyWithImpl<$Res, $Val extends RecipeNote>
    implements $RecipeNoteCopyWith<$Res> {
  _$RecipeNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeNoteImplCopyWith<$Res>
    implements $RecipeNoteCopyWith<$Res> {
  factory _$$RecipeNoteImplCopyWith(
          _$RecipeNoteImpl value, $Res Function(_$RecipeNoteImpl) then) =
      __$$RecipeNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class __$$RecipeNoteImplCopyWithImpl<$Res>
    extends _$RecipeNoteCopyWithImpl<$Res, _$RecipeNoteImpl>
    implements _$$RecipeNoteImplCopyWith<$Res> {
  __$$RecipeNoteImplCopyWithImpl(
      _$RecipeNoteImpl _value, $Res Function(_$RecipeNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$RecipeNoteImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeNoteImpl implements _RecipeNote {
  const _$RecipeNoteImpl({required this.type, required this.text});

  factory _$RecipeNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeNoteImplFromJson(json);

  @override
  final String type;
  @override
  final String text;

  @override
  String toString() {
    return 'RecipeNote(type: $type, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeNoteImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeNoteImplCopyWith<_$RecipeNoteImpl> get copyWith =>
      __$$RecipeNoteImplCopyWithImpl<_$RecipeNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeNoteImplToJson(
      this,
    );
  }
}

abstract class _RecipeNote implements RecipeNote {
  const factory _RecipeNote(
      {required final String type,
      required final String text}) = _$RecipeNoteImpl;

  factory _RecipeNote.fromJson(Map<String, dynamic> json) =
      _$RecipeNoteImpl.fromJson;

  @override
  String get type;
  @override
  String get text;

  /// Create a copy of RecipeNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeNoteImplCopyWith<_$RecipeNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeProvenance _$RecipeProvenanceFromJson(Map<String, dynamic> json) {
  return _RecipeProvenance.fromJson(json);
}

/// @nodoc
mixin _$RecipeProvenance {
  String get createdBy => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this RecipeProvenance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeProvenance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeProvenanceCopyWith<RecipeProvenance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeProvenanceCopyWith<$Res> {
  factory $RecipeProvenanceCopyWith(
          RecipeProvenance value, $Res Function(RecipeProvenance) then) =
      _$RecipeProvenanceCopyWithImpl<$Res, RecipeProvenance>;
  @useResult
  $Res call({String createdBy, String source});
}

/// @nodoc
class _$RecipeProvenanceCopyWithImpl<$Res, $Val extends RecipeProvenance>
    implements $RecipeProvenanceCopyWith<$Res> {
  _$RecipeProvenanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeProvenance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeProvenanceImplCopyWith<$Res>
    implements $RecipeProvenanceCopyWith<$Res> {
  factory _$$RecipeProvenanceImplCopyWith(_$RecipeProvenanceImpl value,
          $Res Function(_$RecipeProvenanceImpl) then) =
      __$$RecipeProvenanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String createdBy, String source});
}

/// @nodoc
class __$$RecipeProvenanceImplCopyWithImpl<$Res>
    extends _$RecipeProvenanceCopyWithImpl<$Res, _$RecipeProvenanceImpl>
    implements _$$RecipeProvenanceImplCopyWith<$Res> {
  __$$RecipeProvenanceImplCopyWithImpl(_$RecipeProvenanceImpl _value,
      $Res Function(_$RecipeProvenanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeProvenance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? source = null,
  }) {
    return _then(_$RecipeProvenanceImpl(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeProvenanceImpl implements _RecipeProvenance {
  const _$RecipeProvenanceImpl({required this.createdBy, required this.source});

  factory _$RecipeProvenanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeProvenanceImplFromJson(json);

  @override
  final String createdBy;
  @override
  final String source;

  @override
  String toString() {
    return 'RecipeProvenance(createdBy: $createdBy, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeProvenanceImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdBy, source);

  /// Create a copy of RecipeProvenance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeProvenanceImplCopyWith<_$RecipeProvenanceImpl> get copyWith =>
      __$$RecipeProvenanceImplCopyWithImpl<_$RecipeProvenanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeProvenanceImplToJson(
      this,
    );
  }
}

abstract class _RecipeProvenance implements RecipeProvenance {
  const factory _RecipeProvenance(
      {required final String createdBy,
      required final String source}) = _$RecipeProvenanceImpl;

  factory _RecipeProvenance.fromJson(Map<String, dynamic> json) =
      _$RecipeProvenanceImpl.fromJson;

  @override
  String get createdBy;
  @override
  String get source;

  /// Create a copy of RecipeProvenance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeProvenanceImplCopyWith<_$RecipeProvenanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeDocument _$RecipeDocumentFromJson(Map<String, dynamic> json) {
  return _RecipeDocument.fromJson(json);
}

/// @nodoc
mixin _$RecipeDocument {
  String get schemaVersion => throw _privateConstructorUsedError;
  String get recipeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  InputAssumptions get inputAssumptions => throw _privateConstructorUsedError;
  RecipeCompatibility get compatibility => throw _privateConstructorUsedError;
  List<RecipeStep> get steps => throw _privateConstructorUsedError;
  List<RecipeNote> get notes => throw _privateConstructorUsedError;
  RecipeProvenance get provenance => throw _privateConstructorUsedError;

  /// Serializes this RecipeDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeDocumentCopyWith<RecipeDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDocumentCopyWith<$Res> {
  factory $RecipeDocumentCopyWith(
          RecipeDocument value, $Res Function(RecipeDocument) then) =
      _$RecipeDocumentCopyWithImpl<$Res, RecipeDocument>;
  @useResult
  $Res call(
      {String schemaVersion,
      String recipeId,
      String title,
      String? description,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> tags,
      InputAssumptions inputAssumptions,
      RecipeCompatibility compatibility,
      List<RecipeStep> steps,
      List<RecipeNote> notes,
      RecipeProvenance provenance});

  $InputAssumptionsCopyWith<$Res> get inputAssumptions;
  $RecipeCompatibilityCopyWith<$Res> get compatibility;
  $RecipeProvenanceCopyWith<$Res> get provenance;
}

/// @nodoc
class _$RecipeDocumentCopyWithImpl<$Res, $Val extends RecipeDocument>
    implements $RecipeDocumentCopyWith<$Res> {
  _$RecipeDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schemaVersion = null,
    Object? recipeId = null,
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? inputAssumptions = null,
    Object? compatibility = null,
    Object? steps = null,
    Object? notes = null,
    Object? provenance = null,
  }) {
    return _then(_value.copyWith(
      schemaVersion: null == schemaVersion
          ? _value.schemaVersion
          : schemaVersion // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputAssumptions: null == inputAssumptions
          ? _value.inputAssumptions
          : inputAssumptions // ignore: cast_nullable_to_non_nullable
              as InputAssumptions,
      compatibility: null == compatibility
          ? _value.compatibility
          : compatibility // ignore: cast_nullable_to_non_nullable
              as RecipeCompatibility,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<RecipeNote>,
      provenance: null == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as RecipeProvenance,
    ) as $Val);
  }

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputAssumptionsCopyWith<$Res> get inputAssumptions {
    return $InputAssumptionsCopyWith<$Res>(_value.inputAssumptions, (value) {
      return _then(_value.copyWith(inputAssumptions: value) as $Val);
    });
  }

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeCompatibilityCopyWith<$Res> get compatibility {
    return $RecipeCompatibilityCopyWith<$Res>(_value.compatibility, (value) {
      return _then(_value.copyWith(compatibility: value) as $Val);
    });
  }

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeProvenanceCopyWith<$Res> get provenance {
    return $RecipeProvenanceCopyWith<$Res>(_value.provenance, (value) {
      return _then(_value.copyWith(provenance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeDocumentImplCopyWith<$Res>
    implements $RecipeDocumentCopyWith<$Res> {
  factory _$$RecipeDocumentImplCopyWith(_$RecipeDocumentImpl value,
          $Res Function(_$RecipeDocumentImpl) then) =
      __$$RecipeDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String schemaVersion,
      String recipeId,
      String title,
      String? description,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> tags,
      InputAssumptions inputAssumptions,
      RecipeCompatibility compatibility,
      List<RecipeStep> steps,
      List<RecipeNote> notes,
      RecipeProvenance provenance});

  @override
  $InputAssumptionsCopyWith<$Res> get inputAssumptions;
  @override
  $RecipeCompatibilityCopyWith<$Res> get compatibility;
  @override
  $RecipeProvenanceCopyWith<$Res> get provenance;
}

/// @nodoc
class __$$RecipeDocumentImplCopyWithImpl<$Res>
    extends _$RecipeDocumentCopyWithImpl<$Res, _$RecipeDocumentImpl>
    implements _$$RecipeDocumentImplCopyWith<$Res> {
  __$$RecipeDocumentImplCopyWithImpl(
      _$RecipeDocumentImpl _value, $Res Function(_$RecipeDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schemaVersion = null,
    Object? recipeId = null,
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? inputAssumptions = null,
    Object? compatibility = null,
    Object? steps = null,
    Object? notes = null,
    Object? provenance = null,
  }) {
    return _then(_$RecipeDocumentImpl(
      schemaVersion: null == schemaVersion
          ? _value.schemaVersion
          : schemaVersion // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inputAssumptions: null == inputAssumptions
          ? _value.inputAssumptions
          : inputAssumptions // ignore: cast_nullable_to_non_nullable
              as InputAssumptions,
      compatibility: null == compatibility
          ? _value.compatibility
          : compatibility // ignore: cast_nullable_to_non_nullable
              as RecipeCompatibility,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<RecipeNote>,
      provenance: null == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as RecipeProvenance,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeDocumentImpl implements _RecipeDocument {
  const _$RecipeDocumentImpl(
      {required this.schemaVersion,
      required this.recipeId,
      required this.title,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      required final List<String> tags,
      required this.inputAssumptions,
      required this.compatibility,
      required final List<RecipeStep> steps,
      required final List<RecipeNote> notes,
      required this.provenance})
      : _tags = tags,
        _steps = steps,
        _notes = notes;

  factory _$RecipeDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeDocumentImplFromJson(json);

  @override
  final String schemaVersion;
  @override
  final String recipeId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final InputAssumptions inputAssumptions;
  @override
  final RecipeCompatibility compatibility;
  final List<RecipeStep> _steps;
  @override
  List<RecipeStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  final List<RecipeNote> _notes;
  @override
  List<RecipeNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final RecipeProvenance provenance;

  @override
  String toString() {
    return 'RecipeDocument(schemaVersion: $schemaVersion, recipeId: $recipeId, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, inputAssumptions: $inputAssumptions, compatibility: $compatibility, steps: $steps, notes: $notes, provenance: $provenance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDocumentImpl &&
            (identical(other.schemaVersion, schemaVersion) ||
                other.schemaVersion == schemaVersion) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.inputAssumptions, inputAssumptions) ||
                other.inputAssumptions == inputAssumptions) &&
            (identical(other.compatibility, compatibility) ||
                other.compatibility == compatibility) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.provenance, provenance) ||
                other.provenance == provenance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      schemaVersion,
      recipeId,
      title,
      description,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      inputAssumptions,
      compatibility,
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_notes),
      provenance);

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDocumentImplCopyWith<_$RecipeDocumentImpl> get copyWith =>
      __$$RecipeDocumentImplCopyWithImpl<_$RecipeDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeDocumentImplToJson(
      this,
    );
  }
}

abstract class _RecipeDocument implements RecipeDocument {
  const factory _RecipeDocument(
      {required final String schemaVersion,
      required final String recipeId,
      required final String title,
      final String? description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<String> tags,
      required final InputAssumptions inputAssumptions,
      required final RecipeCompatibility compatibility,
      required final List<RecipeStep> steps,
      required final List<RecipeNote> notes,
      required final RecipeProvenance provenance}) = _$RecipeDocumentImpl;

  factory _RecipeDocument.fromJson(Map<String, dynamic> json) =
      _$RecipeDocumentImpl.fromJson;

  @override
  String get schemaVersion;
  @override
  String get recipeId;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<String> get tags;
  @override
  InputAssumptions get inputAssumptions;
  @override
  RecipeCompatibility get compatibility;
  @override
  List<RecipeStep> get steps;
  @override
  List<RecipeNote> get notes;
  @override
  RecipeProvenance get provenance;

  /// Create a copy of RecipeDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeDocumentImplCopyWith<_$RecipeDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
