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
  Audio? get audio => throw _privateConstructorUsedError;
  List<Transcription> get transcriptions => throw _privateConstructorUsedError;
  Context? get context => throw _privateConstructorUsedError;

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
  $Res call({
    Audio? audio,
    List<Transcription> transcriptions,
    Context? context,
  });

  $AudioCopyWith<$Res>? get audio;
  $ContextCopyWith<$Res>? get context;
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
  $Res call({
    Object? audio = freezed,
    Object? transcriptions = null,
    Object? context = freezed,
  }) {
    return _then(
      _value.copyWith(
            audio:
                freezed == audio
                    ? _value.audio
                    : audio // ignore: cast_nullable_to_non_nullable
                        as Audio?,
            transcriptions:
                null == transcriptions
                    ? _value.transcriptions
                    : transcriptions // ignore: cast_nullable_to_non_nullable
                        as List<Transcription>,
            context:
                freezed == context
                    ? _value.context
                    : context // ignore: cast_nullable_to_non_nullable
                        as Context?,
          )
          as $Val,
    );
  }

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AudioCopyWith<$Res>? get audio {
    if (_value.audio == null) {
      return null;
    }

    return $AudioCopyWith<$Res>(_value.audio!, (value) {
      return _then(_value.copyWith(audio: value) as $Val);
    });
  }

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextCopyWith<$Res>? get context {
    if (_value.context == null) {
      return null;
    }

    return $ContextCopyWith<$Res>(_value.context!, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
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
  $Res call({
    Audio? audio,
    List<Transcription> transcriptions,
    Context? context,
  });

  @override
  $AudioCopyWith<$Res>? get audio;
  @override
  $ContextCopyWith<$Res>? get context;
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
  $Res call({
    Object? audio = freezed,
    Object? transcriptions = null,
    Object? context = freezed,
  }) {
    return _then(
      _$PronunciationImpl(
        audio:
            freezed == audio
                ? _value.audio
                : audio // ignore: cast_nullable_to_non_nullable
                    as Audio?,
        transcriptions:
            null == transcriptions
                ? _value._transcriptions
                : transcriptions // ignore: cast_nullable_to_non_nullable
                    as List<Transcription>,
        context:
            freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                    as Context?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PronunciationImpl implements _Pronunciation {
  const _$PronunciationImpl({
    this.audio,
    final List<Transcription> transcriptions = const [],
    this.context,
  }) : _transcriptions = transcriptions;

  factory _$PronunciationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PronunciationImplFromJson(json);

  @override
  final Audio? audio;
  final List<Transcription> _transcriptions;
  @override
  @JsonKey()
  List<Transcription> get transcriptions {
    if (_transcriptions is EqualUnmodifiableListView) return _transcriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transcriptions);
  }

  @override
  final Context? context;

  @override
  String toString() {
    return 'Pronunciation(audio: $audio, transcriptions: $transcriptions, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PronunciationImpl &&
            (identical(other.audio, audio) || other.audio == audio) &&
            const DeepCollectionEquality().equals(
              other._transcriptions,
              _transcriptions,
            ) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    audio,
    const DeepCollectionEquality().hash(_transcriptions),
    context,
  );

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
  const factory _Pronunciation({
    final Audio? audio,
    final List<Transcription> transcriptions,
    final Context? context,
  }) = _$PronunciationImpl;

  factory _Pronunciation.fromJson(Map<String, dynamic> json) =
      _$PronunciationImpl.fromJson;

  @override
  Audio? get audio;
  @override
  List<Transcription> get transcriptions;
  @override
  Context? get context;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PronunciationImplCopyWith<_$PronunciationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
