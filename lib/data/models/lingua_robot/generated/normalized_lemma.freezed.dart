// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../normalized_lemma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NormalizedLemma _$NormalizedLemmaFromJson(Map<String, dynamic> json) {
  return _NormalizedLemma.fromJson(json);
}

/// @nodoc
mixin _$NormalizedLemma {
  String get lemma => throw _privateConstructorUsedError;

  /// Serializes this NormalizedLemma to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NormalizedLemma
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NormalizedLemmaCopyWith<NormalizedLemma> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NormalizedLemmaCopyWith<$Res> {
  factory $NormalizedLemmaCopyWith(
    NormalizedLemma value,
    $Res Function(NormalizedLemma) then,
  ) = _$NormalizedLemmaCopyWithImpl<$Res, NormalizedLemma>;
  @useResult
  $Res call({String lemma});
}

/// @nodoc
class _$NormalizedLemmaCopyWithImpl<$Res, $Val extends NormalizedLemma>
    implements $NormalizedLemmaCopyWith<$Res> {
  _$NormalizedLemmaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NormalizedLemma
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lemma = null}) {
    return _then(
      _value.copyWith(
            lemma:
                null == lemma
                    ? _value.lemma
                    : lemma // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NormalizedLemmaImplCopyWith<$Res>
    implements $NormalizedLemmaCopyWith<$Res> {
  factory _$$NormalizedLemmaImplCopyWith(
    _$NormalizedLemmaImpl value,
    $Res Function(_$NormalizedLemmaImpl) then,
  ) = __$$NormalizedLemmaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lemma});
}

/// @nodoc
class __$$NormalizedLemmaImplCopyWithImpl<$Res>
    extends _$NormalizedLemmaCopyWithImpl<$Res, _$NormalizedLemmaImpl>
    implements _$$NormalizedLemmaImplCopyWith<$Res> {
  __$$NormalizedLemmaImplCopyWithImpl(
    _$NormalizedLemmaImpl _value,
    $Res Function(_$NormalizedLemmaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NormalizedLemma
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lemma = null}) {
    return _then(
      _$NormalizedLemmaImpl(
        lemma:
            null == lemma
                ? _value.lemma
                : lemma // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NormalizedLemmaImpl implements _NormalizedLemma {
  const _$NormalizedLemmaImpl({this.lemma = ''});

  factory _$NormalizedLemmaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormalizedLemmaImplFromJson(json);

  @override
  @JsonKey()
  final String lemma;

  @override
  String toString() {
    return 'NormalizedLemma(lemma: $lemma)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalizedLemmaImpl &&
            (identical(other.lemma, lemma) || other.lemma == lemma));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lemma);

  /// Create a copy of NormalizedLemma
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalizedLemmaImplCopyWith<_$NormalizedLemmaImpl> get copyWith =>
      __$$NormalizedLemmaImplCopyWithImpl<_$NormalizedLemmaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalizedLemmaImplToJson(this);
  }
}

abstract class _NormalizedLemma implements NormalizedLemma {
  const factory _NormalizedLemma({final String lemma}) = _$NormalizedLemmaImpl;

  factory _NormalizedLemma.fromJson(Map<String, dynamic> json) =
      _$NormalizedLemmaImpl.fromJson;

  @override
  String get lemma;

  /// Create a copy of NormalizedLemma
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NormalizedLemmaImplCopyWith<_$NormalizedLemmaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
