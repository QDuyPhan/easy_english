// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../transcription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Transcription _$TranscriptionFromJson(Map<String, dynamic> json) {
  return _Transcription.fromJson(json);
}

/// @nodoc
mixin _$Transcription {
  String get transcription => throw _privateConstructorUsedError;
  String get notation => throw _privateConstructorUsedError;

  /// Serializes this Transcription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transcription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptionCopyWith<Transcription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptionCopyWith<$Res> {
  factory $TranscriptionCopyWith(
    Transcription value,
    $Res Function(Transcription) then,
  ) = _$TranscriptionCopyWithImpl<$Res, Transcription>;
  @useResult
  $Res call({String transcription, String notation});
}

/// @nodoc
class _$TranscriptionCopyWithImpl<$Res, $Val extends Transcription>
    implements $TranscriptionCopyWith<$Res> {
  _$TranscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transcription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transcription = null, Object? notation = null}) {
    return _then(
      _value.copyWith(
            transcription:
                null == transcription
                    ? _value.transcription
                    : transcription // ignore: cast_nullable_to_non_nullable
                        as String,
            notation:
                null == notation
                    ? _value.notation
                    : notation // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranscriptionImplCopyWith<$Res>
    implements $TranscriptionCopyWith<$Res> {
  factory _$$TranscriptionImplCopyWith(
    _$TranscriptionImpl value,
    $Res Function(_$TranscriptionImpl) then,
  ) = __$$TranscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String transcription, String notation});
}

/// @nodoc
class __$$TranscriptionImplCopyWithImpl<$Res>
    extends _$TranscriptionCopyWithImpl<$Res, _$TranscriptionImpl>
    implements _$$TranscriptionImplCopyWith<$Res> {
  __$$TranscriptionImplCopyWithImpl(
    _$TranscriptionImpl _value,
    $Res Function(_$TranscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Transcription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transcription = null, Object? notation = null}) {
    return _then(
      _$TranscriptionImpl(
        transcription:
            null == transcription
                ? _value.transcription
                : transcription // ignore: cast_nullable_to_non_nullable
                    as String,
        notation:
            null == notation
                ? _value.notation
                : notation // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptionImpl implements _Transcription {
  const _$TranscriptionImpl({this.transcription = '', this.notation = ''});

  factory _$TranscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptionImplFromJson(json);

  @override
  @JsonKey()
  final String transcription;
  @override
  @JsonKey()
  final String notation;

  @override
  String toString() {
    return 'Transcription(transcription: $transcription, notation: $notation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptionImpl &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.notation, notation) ||
                other.notation == notation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transcription, notation);

  /// Create a copy of Transcription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptionImplCopyWith<_$TranscriptionImpl> get copyWith =>
      __$$TranscriptionImplCopyWithImpl<_$TranscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptionImplToJson(this);
  }
}

abstract class _Transcription implements Transcription {
  const factory _Transcription({
    final String transcription,
    final String notation,
  }) = _$TranscriptionImpl;

  factory _Transcription.fromJson(Map<String, dynamic> json) =
      _$TranscriptionImpl.fromJson;

  @override
  String get transcription;
  @override
  String get notation;

  /// Create a copy of Transcription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptionImplCopyWith<_$TranscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
