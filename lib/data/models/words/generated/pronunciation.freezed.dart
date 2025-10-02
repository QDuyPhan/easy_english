// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pronunciation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Pronunciation _$PronunciationFromJson(Map<String, dynamic> json) {
  return _Pronunciation.fromJson(json);
}

/// @nodoc
mixin _$Pronunciation {
  String? get all => throw _privateConstructorUsedError;

  /// Serializes this Pronunciation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PronunciationCopyWith<Pronunciation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PronunciationCopyWith<$Res> {
  factory $PronunciationCopyWith(
    Pronunciation value,
    $Res Function(Pronunciation) then,
  ) = _$PronunciationCopyWithImpl<$Res, Pronunciation>;
  @useResult
  $Res call({String? all});
}

/// @nodoc
class _$PronunciationCopyWithImpl<$Res, $Val extends Pronunciation>
    implements $PronunciationCopyWith<$Res> {
  _$PronunciationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? all = freezed}) {
    return _then(
      _value.copyWith(
            all:
                freezed == all
                    ? _value.all
                    : all // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PronunciationImplCopyWith<$Res>
    implements $PronunciationCopyWith<$Res> {
  factory _$$PronunciationImplCopyWith(
    _$PronunciationImpl value,
    $Res Function(_$PronunciationImpl) then,
  ) = __$$PronunciationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? all});
}

/// @nodoc
class __$$PronunciationImplCopyWithImpl<$Res>
    extends _$PronunciationCopyWithImpl<$Res, _$PronunciationImpl>
    implements _$$PronunciationImplCopyWith<$Res> {
  __$$PronunciationImplCopyWithImpl(
    _$PronunciationImpl _value,
    $Res Function(_$PronunciationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? all = freezed}) {
    return _then(
      _$PronunciationImpl(
        all:
            freezed == all
                ? _value.all
                : all // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PronunciationImpl implements _Pronunciation {
  const _$PronunciationImpl({this.all = ""});

  factory _$PronunciationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PronunciationImplFromJson(json);

  @override
  @JsonKey()
  final String? all;

  @override
  String toString() {
    return 'Pronunciation(all: $all)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PronunciationImpl &&
            (identical(other.all, all) || other.all == all));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, all);

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PronunciationImplCopyWith<_$PronunciationImpl> get copyWith =>
      __$$PronunciationImplCopyWithImpl<_$PronunciationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PronunciationImplToJson(this);
  }
}

abstract class _Pronunciation implements Pronunciation {
  const factory _Pronunciation({final String? all}) = _$PronunciationImpl;

  factory _Pronunciation.fromJson(Map<String, dynamic> json) =
      _$PronunciationImpl.fromJson;

  @override
  String? get all;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PronunciationImplCopyWith<_$PronunciationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
