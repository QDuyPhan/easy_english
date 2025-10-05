// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../vocabulary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VocabularyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getListWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getListWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getListWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllOxfordWords value) getListWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllOxfordWords value)? getListWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllOxfordWords value)? getListWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyEventCopyWith<$Res> {
  factory $VocabularyEventCopyWith(
    VocabularyEvent value,
    $Res Function(VocabularyEvent) then,
  ) = _$VocabularyEventCopyWithImpl<$Res, VocabularyEvent>;
}

/// @nodoc
class _$VocabularyEventCopyWithImpl<$Res, $Val extends VocabularyEvent>
    implements $VocabularyEventCopyWith<$Res> {
  _$VocabularyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllOxfordWordsImplCopyWith<$Res> {
  factory _$$GetAllOxfordWordsImplCopyWith(
    _$GetAllOxfordWordsImpl value,
    $Res Function(_$GetAllOxfordWordsImpl) then,
  ) = __$$GetAllOxfordWordsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllOxfordWordsImplCopyWithImpl<$Res>
    extends _$VocabularyEventCopyWithImpl<$Res, _$GetAllOxfordWordsImpl>
    implements _$$GetAllOxfordWordsImplCopyWith<$Res> {
  __$$GetAllOxfordWordsImplCopyWithImpl(
    _$GetAllOxfordWordsImpl _value,
    $Res Function(_$GetAllOxfordWordsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllOxfordWordsImpl implements _GetAllOxfordWords {
  const _$GetAllOxfordWordsImpl();

  @override
  String toString() {
    return 'VocabularyEvent.getListWord()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllOxfordWordsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getListWord,
  }) {
    return getListWord();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getListWord,
  }) {
    return getListWord?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getListWord,
    required TResult orElse(),
  }) {
    if (getListWord != null) {
      return getListWord();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllOxfordWords value) getListWord,
  }) {
    return getListWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllOxfordWords value)? getListWord,
  }) {
    return getListWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllOxfordWords value)? getListWord,
    required TResult orElse(),
  }) {
    if (getListWord != null) {
      return getListWord(this);
    }
    return orElse();
  }
}

abstract class _GetAllOxfordWords implements VocabularyEvent {
  const factory _GetAllOxfordWords() = _$GetAllOxfordWordsImpl;
}

/// @nodoc
mixin _$VocabularyState {
  List<WordEntity> get words => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyStateCopyWith<VocabularyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyStateCopyWith<$Res> {
  factory $VocabularyStateCopyWith(
    VocabularyState value,
    $Res Function(VocabularyState) then,
  ) = _$VocabularyStateCopyWithImpl<$Res, VocabularyState>;
  @useResult
  $Res call({
    List<WordEntity> words,
    bool isLoading,
    String error,
    String message,
  });
}

/// @nodoc
class _$VocabularyStateCopyWithImpl<$Res, $Val extends VocabularyState>
    implements $VocabularyStateCopyWith<$Res> {
  _$VocabularyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            words:
                null == words
                    ? _value.words
                    : words // ignore: cast_nullable_to_non_nullable
                        as List<WordEntity>,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VocabularyStateImplCopyWith<$Res>
    implements $VocabularyStateCopyWith<$Res> {
  factory _$$VocabularyStateImplCopyWith(
    _$VocabularyStateImpl value,
    $Res Function(_$VocabularyStateImpl) then,
  ) = __$$VocabularyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<WordEntity> words,
    bool isLoading,
    String error,
    String message,
  });
}

/// @nodoc
class __$$VocabularyStateImplCopyWithImpl<$Res>
    extends _$VocabularyStateCopyWithImpl<$Res, _$VocabularyStateImpl>
    implements _$$VocabularyStateImplCopyWith<$Res> {
  __$$VocabularyStateImplCopyWithImpl(
    _$VocabularyStateImpl _value,
    $Res Function(_$VocabularyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VocabularyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
  }) {
    return _then(
      _$VocabularyStateImpl(
        words:
            null == words
                ? _value._words
                : words // ignore: cast_nullable_to_non_nullable
                    as List<WordEntity>,
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
      ),
    );
  }
}

/// @nodoc

class _$VocabularyStateImpl implements _VocabularyState {
  const _$VocabularyStateImpl({
    final List<WordEntity> words = const [],
    this.isLoading = false,
    this.error = '',
    this.message = '',
  }) : _words = words;

  final List<WordEntity> _words;
  @override
  @JsonKey()
  List<WordEntity> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'VocabularyState(words: $words, isLoading: $isLoading, error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyStateImpl &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_words),
    isLoading,
    error,
    message,
  );

  /// Create a copy of VocabularyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyStateImplCopyWith<_$VocabularyStateImpl> get copyWith =>
      __$$VocabularyStateImplCopyWithImpl<_$VocabularyStateImpl>(
        this,
        _$identity,
      );
}

abstract class _VocabularyState implements VocabularyState {
  const factory _VocabularyState({
    final List<WordEntity> words,
    final bool isLoading,
    final String error,
    final String message,
  }) = _$VocabularyStateImpl;

  @override
  List<WordEntity> get words;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  String get message;

  /// Create a copy of VocabularyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyStateImplCopyWith<_$VocabularyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
