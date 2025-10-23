// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../words_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getListWord,
    required TResult Function(String word) translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getListWord,
    TResult? Function(String word)? translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getListWord,
    TResult Function(String word)? translateWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListWord value) getListWord,
    required TResult Function(_TranslateWord value) translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListWord value)? getListWord,
    TResult? Function(_TranslateWord value)? translateWord,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListWord value)? getListWord,
    TResult Function(_TranslateWord value)? translateWord,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsEventCopyWith<$Res> {
  factory $WordsEventCopyWith(
    WordsEvent value,
    $Res Function(WordsEvent) then,
  ) = _$WordsEventCopyWithImpl<$Res, WordsEvent>;
}

/// @nodoc
class _$WordsEventCopyWithImpl<$Res, $Val extends WordsEvent>
    implements $WordsEventCopyWith<$Res> {
  _$WordsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetListWordImplCopyWith<$Res> {
  factory _$$GetListWordImplCopyWith(
    _$GetListWordImpl value,
    $Res Function(_$GetListWordImpl) then,
  ) = __$$GetListWordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetListWordImplCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res, _$GetListWordImpl>
    implements _$$GetListWordImplCopyWith<$Res> {
  __$$GetListWordImplCopyWithImpl(
    _$GetListWordImpl _value,
    $Res Function(_$GetListWordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetListWordImpl implements _GetListWord {
  const _$GetListWordImpl();

  @override
  String toString() {
    return 'WordsEvent.getListWord()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetListWordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getListWord,
    required TResult Function(String word) translateWord,
  }) {
    return getListWord();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getListWord,
    TResult? Function(String word)? translateWord,
  }) {
    return getListWord?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getListWord,
    TResult Function(String word)? translateWord,
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
    required TResult Function(_GetListWord value) getListWord,
    required TResult Function(_TranslateWord value) translateWord,
  }) {
    return getListWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListWord value)? getListWord,
    TResult? Function(_TranslateWord value)? translateWord,
  }) {
    return getListWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListWord value)? getListWord,
    TResult Function(_TranslateWord value)? translateWord,
    required TResult orElse(),
  }) {
    if (getListWord != null) {
      return getListWord(this);
    }
    return orElse();
  }
}

abstract class _GetListWord implements WordsEvent {
  const factory _GetListWord() = _$GetListWordImpl;
}

/// @nodoc
abstract class _$$TranslateWordImplCopyWith<$Res> {
  factory _$$TranslateWordImplCopyWith(
    _$TranslateWordImpl value,
    $Res Function(_$TranslateWordImpl) then,
  ) = __$$TranslateWordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String word});
}

/// @nodoc
class __$$TranslateWordImplCopyWithImpl<$Res>
    extends _$WordsEventCopyWithImpl<$Res, _$TranslateWordImpl>
    implements _$$TranslateWordImplCopyWith<$Res> {
  __$$TranslateWordImplCopyWithImpl(
    _$TranslateWordImpl _value,
    $Res Function(_$TranslateWordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordsEvent
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
    return 'WordsEvent.translateWord(word: $word)';
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

  /// Create a copy of WordsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslateWordImplCopyWith<_$TranslateWordImpl> get copyWith =>
      __$$TranslateWordImplCopyWithImpl<_$TranslateWordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getListWord,
    required TResult Function(String word) translateWord,
  }) {
    return translateWord(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getListWord,
    TResult? Function(String word)? translateWord,
  }) {
    return translateWord?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getListWord,
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
    required TResult Function(_GetListWord value) getListWord,
    required TResult Function(_TranslateWord value) translateWord,
  }) {
    return translateWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListWord value)? getListWord,
    TResult? Function(_TranslateWord value)? translateWord,
  }) {
    return translateWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListWord value)? getListWord,
    TResult Function(_TranslateWord value)? translateWord,
    required TResult orElse(),
  }) {
    if (translateWord != null) {
      return translateWord(this);
    }
    return orElse();
  }
}

abstract class _TranslateWord implements WordsEvent {
  const factory _TranslateWord(final String word) = _$TranslateWordImpl;

  String get word;

  /// Create a copy of WordsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslateWordImplCopyWith<_$TranslateWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordsState {
  List<String> get words => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get word => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<DictionaryEntity> get dictionaries => throw _privateConstructorUsedError;

  /// Create a copy of WordsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordsStateCopyWith<WordsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsStateCopyWith<$Res> {
  factory $WordsStateCopyWith(
    WordsState value,
    $Res Function(WordsState) then,
  ) = _$WordsStateCopyWithImpl<$Res, WordsState>;
  @useResult
  $Res call({
    List<String> words,
    bool isLoading,
    String error,
    String message,
    String? word,
    int pageSize,
    int page,
    List<DictionaryEntity> dictionaries,
  });
}

/// @nodoc
class _$WordsStateCopyWithImpl<$Res, $Val extends WordsState>
    implements $WordsStateCopyWith<$Res> {
  _$WordsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
    Object? word = freezed,
    Object? pageSize = null,
    Object? page = null,
    Object? dictionaries = null,
  }) {
    return _then(
      _value.copyWith(
            words:
                null == words
                    ? _value.words
                    : words // ignore: cast_nullable_to_non_nullable
                        as List<String>,
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
            word:
                freezed == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String?,
            pageSize:
                null == pageSize
                    ? _value.pageSize
                    : pageSize // ignore: cast_nullable_to_non_nullable
                        as int,
            page:
                null == page
                    ? _value.page
                    : page // ignore: cast_nullable_to_non_nullable
                        as int,
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
abstract class _$$WordsStateImplCopyWith<$Res>
    implements $WordsStateCopyWith<$Res> {
  factory _$$WordsStateImplCopyWith(
    _$WordsStateImpl value,
    $Res Function(_$WordsStateImpl) then,
  ) = __$$WordsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> words,
    bool isLoading,
    String error,
    String message,
    String? word,
    int pageSize,
    int page,
    List<DictionaryEntity> dictionaries,
  });
}

/// @nodoc
class __$$WordsStateImplCopyWithImpl<$Res>
    extends _$WordsStateCopyWithImpl<$Res, _$WordsStateImpl>
    implements _$$WordsStateImplCopyWith<$Res> {
  __$$WordsStateImplCopyWithImpl(
    _$WordsStateImpl _value,
    $Res Function(_$WordsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
    Object? word = freezed,
    Object? pageSize = null,
    Object? page = null,
    Object? dictionaries = null,
  }) {
    return _then(
      _$WordsStateImpl(
        words:
            null == words
                ? _value._words
                : words // ignore: cast_nullable_to_non_nullable
                    as List<String>,
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
        word:
            freezed == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String?,
        pageSize:
            null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as int,
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as int,
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

class _$WordsStateImpl implements _WordsState {
  const _$WordsStateImpl({
    final List<String> words = const [],
    this.isLoading = false,
    this.error = '',
    this.message = '',
    this.word = null,
    this.pageSize = 20,
    this.page = 1,
    final List<DictionaryEntity> dictionaries = const [],
  }) : _words = words,
       _dictionaries = dictionaries;

  final List<String> _words;
  @override
  @JsonKey()
  List<String> get words {
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
  @JsonKey()
  final String? word;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int page;
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
    return 'WordsState(words: $words, isLoading: $isLoading, error: $error, message: $message, word: $word, pageSize: $pageSize, page: $page, dictionaries: $dictionaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordsStateImpl &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(
              other._dictionaries,
              _dictionaries,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_words),
    isLoading,
    error,
    message,
    word,
    pageSize,
    page,
    const DeepCollectionEquality().hash(_dictionaries),
  );

  /// Create a copy of WordsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordsStateImplCopyWith<_$WordsStateImpl> get copyWith =>
      __$$WordsStateImplCopyWithImpl<_$WordsStateImpl>(this, _$identity);
}

abstract class _WordsState implements WordsState {
  const factory _WordsState({
    final List<String> words,
    final bool isLoading,
    final String error,
    final String message,
    final String? word,
    final int pageSize,
    final int page,
    final List<DictionaryEntity> dictionaries,
  }) = _$WordsStateImpl;

  @override
  List<String> get words;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  String get message;
  @override
  String? get word;
  @override
  int get pageSize;
  @override
  int get page;
  @override
  List<DictionaryEntity> get dictionaries;

  /// Create a copy of WordsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordsStateImplCopyWith<_$WordsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
