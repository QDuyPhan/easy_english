// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../translate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TranslateEvent {
  String get word => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String word)? translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? translateWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TranslateWord value) translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TranslateWord value)? translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TranslateWord value)? translateWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TranslateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslateEventCopyWith<TranslateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslateEventCopyWith<$Res> {
  factory $TranslateEventCopyWith(
    TranslateEvent value,
    $Res Function(TranslateEvent) then,
  ) = _$TranslateEventCopyWithImpl<$Res, TranslateEvent>;
  @useResult
  $Res call({String word});
}

/// @nodoc
class _$TranslateEventCopyWithImpl<$Res, $Val extends TranslateEvent>
    implements $TranslateEventCopyWith<$Res> {
  _$TranslateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? word = null}) {
    return _then(
      _value.copyWith(
            word:
                null == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslateWordImplCopyWith<$Res>
    implements $TranslateEventCopyWith<$Res> {
  factory _$$TranslateWordImplCopyWith(
    _$TranslateWordImpl value,
    $Res Function(_$TranslateWordImpl) then,
  ) = __$$TranslateWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word});
}

/// @nodoc
class __$$TranslateWordImplCopyWithImpl<$Res>
    extends _$TranslateEventCopyWithImpl<$Res, _$TranslateWordImpl>
    implements _$$TranslateWordImplCopyWith<$Res> {
  __$$TranslateWordImplCopyWithImpl(
    _$TranslateWordImpl _value,
    $Res Function(_$TranslateWordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? word = null}) {
    return _then(
      _$TranslateWordImpl(
        null == word
            ? _value.word
            : word // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$TranslateWordImpl implements _TranslateWord {
  const _$TranslateWordImpl(this.word);

  @override
  final String word;

  @override
  String toString() {
    return 'TranslateEvent.translateWord(word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslateWordImpl &&
            (identical(other.word, word) || other.word == word));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word);

  /// Create a copy of TranslateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslateWordImplCopyWith<_$TranslateWordImpl> get copyWith =>
      __$$TranslateWordImplCopyWithImpl<_$TranslateWordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String word) translateWord,
  }) {
    return translateWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String word)? translateWord,
  }) {
    return translateWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String word)? translateWord,
    required TResult orElse(),
  }) {
    if (translateWord != null) {
      return translateWord(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TranslateWord value) translateWord,
  }) {
    return translateWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TranslateWord value)? translateWord,
  }) {
    return translateWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TranslateWord value)? translateWord,
    required TResult orElse(),
  }) {
    if (translateWord != null) {
      return translateWord(this);
    }
    return orElse();
  }
}

abstract class _TranslateWord implements TranslateEvent {
  const factory _TranslateWord(final String word) = _$TranslateWordImpl;

  @override
  String get word;

  /// Create a copy of TranslateEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslateWordImplCopyWith<_$TranslateWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TranslateState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<DictionaryEntity> get dictionaries => throw _privateConstructorUsedError;

  /// Create a copy of TranslateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslateStateCopyWith<TranslateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslateStateCopyWith<$Res> {
  factory $TranslateStateCopyWith(
    TranslateState value,
    $Res Function(TranslateState) then,
  ) = _$TranslateStateCopyWithImpl<$Res, TranslateState>;
  @useResult
  $Res call({
    bool isLoading,
    String error,
    String message,
    List<DictionaryEntity> dictionaries,
  });
}

/// @nodoc
class _$TranslateStateCopyWithImpl<$Res, $Val extends TranslateState>
    implements $TranslateStateCopyWith<$Res> {
  _$TranslateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
    Object? dictionaries = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            dictionaries:
                null == dictionaries
                    ? _value.dictionaries
                    : dictionaries // ignore: cast_nullable_to_non_nullable
                        as List<DictionaryEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslateStateImplCopyWith<$Res>
    implements $TranslateStateCopyWith<$Res> {
  factory _$$TranslateStateImplCopyWith(
    _$TranslateStateImpl value,
    $Res Function(_$TranslateStateImpl) then,
  ) = __$$TranslateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    String error,
    String message,
    List<DictionaryEntity> dictionaries,
  });
}

/// @nodoc
class __$$TranslateStateImplCopyWithImpl<$Res>
    extends _$TranslateStateCopyWithImpl<$Res, _$TranslateStateImpl>
    implements _$$TranslateStateImplCopyWith<$Res> {
  __$$TranslateStateImplCopyWithImpl(
    _$TranslateStateImpl _value,
    $Res Function(_$TranslateStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
    Object? dictionaries = null,
  }) {
    return _then(
      _$TranslateStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        dictionaries:
            null == dictionaries
                ? _value._dictionaries
                : dictionaries // ignore: cast_nullable_to_non_nullable
                    as List<DictionaryEntity>,
      ),
    );
  }
}

/// @nodoc

class _$TranslateStateImpl implements _TranslateState {
  const _$TranslateStateImpl({
    this.isLoading = false,
    this.error = '',
    this.message = '',
    final List<DictionaryEntity> dictionaries = const [],
  }) : _dictionaries = dictionaries;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String message;
  final List<DictionaryEntity> _dictionaries;
  @override
  @JsonKey()
  List<DictionaryEntity> get dictionaries {
    if (_dictionaries is EqualUnmodifiableListView) return _dictionaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dictionaries);
  }

  @override
  String toString() {
    return 'TranslateState(isLoading: $isLoading, error: $error, message: $message, dictionaries: $dictionaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslateStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._dictionaries,
              _dictionaries,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    error,
    message,
    const DeepCollectionEquality().hash(_dictionaries),
  );

  /// Create a copy of TranslateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslateStateImplCopyWith<_$TranslateStateImpl> get copyWith =>
      __$$TranslateStateImplCopyWithImpl<_$TranslateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TranslateState implements TranslateState {
  const factory _TranslateState({
    final bool isLoading,
    final String error,
    final String message,
    final List<DictionaryEntity> dictionaries,
  }) = _$TranslateStateImpl;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  String get message;
  @override
  List<DictionaryEntity> get dictionaries;

  /// Create a copy of TranslateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslateStateImplCopyWith<_$TranslateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
