// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dictionary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DictionaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDictionary,
    required TResult Function(String folder, String topic) getWords,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDictionary,
    TResult? Function(String folder, String topic)? getWords,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDictionary,
    TResult Function(String folder, String topic)? getWords,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDictionary value) getDictionary,
    required TResult Function(_GetWords value) getWords,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDictionary value)? getDictionary,
    TResult? Function(_GetWords value)? getWords,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDictionary value)? getDictionary,
    TResult Function(_GetWords value)? getWords,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryEventCopyWith<$Res> {
  factory $DictionaryEventCopyWith(
    DictionaryEvent value,
    $Res Function(DictionaryEvent) then,
  ) = _$DictionaryEventCopyWithImpl<$Res, DictionaryEvent>;
}

/// @nodoc
class _$DictionaryEventCopyWithImpl<$Res, $Val extends DictionaryEvent>
    implements $DictionaryEventCopyWith<$Res> {
  _$DictionaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetDictionaryImplCopyWith<$Res> {
  factory _$$GetDictionaryImplCopyWith(
    _$GetDictionaryImpl value,
    $Res Function(_$GetDictionaryImpl) then,
  ) = __$$GetDictionaryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDictionaryImplCopyWithImpl<$Res>
    extends _$DictionaryEventCopyWithImpl<$Res, _$GetDictionaryImpl>
    implements _$$GetDictionaryImplCopyWith<$Res> {
  __$$GetDictionaryImplCopyWithImpl(
    _$GetDictionaryImpl _value,
    $Res Function(_$GetDictionaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDictionaryImpl implements _GetDictionary {
  const _$GetDictionaryImpl();

  @override
  String toString() {
    return 'DictionaryEvent.getDictionary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDictionaryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDictionary,
    required TResult Function(String folder, String topic) getWords,
  }) {
    return getDictionary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDictionary,
    TResult? Function(String folder, String topic)? getWords,
  }) {
    return getDictionary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDictionary,
    TResult Function(String folder, String topic)? getWords,
    required TResult orElse(),
  }) {
    if (getDictionary != null) {
      return getDictionary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDictionary value) getDictionary,
    required TResult Function(_GetWords value) getWords,
  }) {
    return getDictionary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDictionary value)? getDictionary,
    TResult? Function(_GetWords value)? getWords,
  }) {
    return getDictionary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDictionary value)? getDictionary,
    TResult Function(_GetWords value)? getWords,
    required TResult orElse(),
  }) {
    if (getDictionary != null) {
      return getDictionary(this);
    }
    return orElse();
  }
}

abstract class _GetDictionary implements DictionaryEvent {
  const factory _GetDictionary() = _$GetDictionaryImpl;
}

/// @nodoc
abstract class _$$GetWordsImplCopyWith<$Res> {
  factory _$$GetWordsImplCopyWith(
    _$GetWordsImpl value,
    $Res Function(_$GetWordsImpl) then,
  ) = __$$GetWordsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String folder, String topic});
}

/// @nodoc
class __$$GetWordsImplCopyWithImpl<$Res>
    extends _$DictionaryEventCopyWithImpl<$Res, _$GetWordsImpl>
    implements _$$GetWordsImplCopyWith<$Res> {
  __$$GetWordsImplCopyWithImpl(
    _$GetWordsImpl _value,
    $Res Function(_$GetWordsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? folder = null, Object? topic = null}) {
    return _then(
      _$GetWordsImpl(
        folder:
            null == folder
                ? _value.folder
                : folder // ignore: cast_nullable_to_non_nullable
                    as String,
        topic:
            null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetWordsImpl implements _GetWords {
  const _$GetWordsImpl({required this.folder, required this.topic});

  @override
  final String folder;
  @override
  final String topic;

  @override
  String toString() {
    return 'DictionaryEvent.getWords(folder: $folder, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWordsImpl &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, folder, topic);

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWordsImplCopyWith<_$GetWordsImpl> get copyWith =>
      __$$GetWordsImplCopyWithImpl<_$GetWordsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDictionary,
    required TResult Function(String folder, String topic) getWords,
  }) {
    return getWords(folder, topic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDictionary,
    TResult? Function(String folder, String topic)? getWords,
  }) {
    return getWords?.call(folder, topic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDictionary,
    TResult Function(String folder, String topic)? getWords,
    required TResult orElse(),
  }) {
    if (getWords != null) {
      return getWords(folder, topic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDictionary value) getDictionary,
    required TResult Function(_GetWords value) getWords,
  }) {
    return getWords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDictionary value)? getDictionary,
    TResult? Function(_GetWords value)? getWords,
  }) {
    return getWords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDictionary value)? getDictionary,
    TResult Function(_GetWords value)? getWords,
    required TResult orElse(),
  }) {
    if (getWords != null) {
      return getWords(this);
    }
    return orElse();
  }
}

abstract class _GetWords implements DictionaryEvent {
  const factory _GetWords({
    required final String folder,
    required final String topic,
  }) = _$GetWordsImpl;

  String get folder;
  String get topic;

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetWordsImplCopyWith<_$GetWordsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DictionaryState {
  List<DictionaryEntity> get dictionary => throw _privateConstructorUsedError;
  List<WordEntity> get words => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DictionaryStateCopyWith<DictionaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryStateCopyWith<$Res> {
  factory $DictionaryStateCopyWith(
    DictionaryState value,
    $Res Function(DictionaryState) then,
  ) = _$DictionaryStateCopyWithImpl<$Res, DictionaryState>;
  @useResult
  $Res call({
    List<DictionaryEntity> dictionary,
    List<WordEntity> words,
    bool isLoading,
    String error,
    String message,
  });
}

/// @nodoc
class _$DictionaryStateCopyWithImpl<$Res, $Val extends DictionaryState>
    implements $DictionaryStateCopyWith<$Res> {
  _$DictionaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            dictionary:
                null == dictionary
                    ? _value.dictionary
                    : dictionary // ignore: cast_nullable_to_non_nullable
                        as List<DictionaryEntity>,
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
abstract class _$$DictionaryStateImplCopyWith<$Res>
    implements $DictionaryStateCopyWith<$Res> {
  factory _$$DictionaryStateImplCopyWith(
    _$DictionaryStateImpl value,
    $Res Function(_$DictionaryStateImpl) then,
  ) = __$$DictionaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DictionaryEntity> dictionary,
    List<WordEntity> words,
    bool isLoading,
    String error,
    String message,
  });
}

/// @nodoc
class __$$DictionaryStateImplCopyWithImpl<$Res>
    extends _$DictionaryStateCopyWithImpl<$Res, _$DictionaryStateImpl>
    implements _$$DictionaryStateImplCopyWith<$Res> {
  __$$DictionaryStateImplCopyWithImpl(
    _$DictionaryStateImpl _value,
    $Res Function(_$DictionaryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dictionary = null,
    Object? words = null,
    Object? isLoading = null,
    Object? error = null,
    Object? message = null,
  }) {
    return _then(
      _$DictionaryStateImpl(
        dictionary:
            null == dictionary
                ? _value._dictionary
                : dictionary // ignore: cast_nullable_to_non_nullable
                    as List<DictionaryEntity>,
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

class _$DictionaryStateImpl implements _DictionaryState {
  const _$DictionaryStateImpl({
    final List<DictionaryEntity> dictionary = const [],
    final List<WordEntity> words = const [],
    this.isLoading = false,
    this.error = '',
    this.message = '',
  }) : _dictionary = dictionary,
       _words = words;

  final List<DictionaryEntity> _dictionary;
  @override
  @JsonKey()
  List<DictionaryEntity> get dictionary {
    if (_dictionary is EqualUnmodifiableListView) return _dictionary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dictionary);
  }

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
    return 'DictionaryState(dictionary: $dictionary, words: $words, isLoading: $isLoading, error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryStateImpl &&
            const DeepCollectionEquality().equals(
              other._dictionary,
              _dictionary,
            ) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_dictionary),
    const DeepCollectionEquality().hash(_words),
    isLoading,
    error,
    message,
  );

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryStateImplCopyWith<_$DictionaryStateImpl> get copyWith =>
      __$$DictionaryStateImplCopyWithImpl<_$DictionaryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DictionaryState implements DictionaryState {
  const factory _DictionaryState({
    final List<DictionaryEntity> dictionary,
    final List<WordEntity> words,
    final bool isLoading,
    final String error,
    final String message,
  }) = _$DictionaryStateImpl;

  @override
  List<DictionaryEntity> get dictionary;
  @override
  List<WordEntity> get words;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  String get message;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DictionaryStateImplCopyWith<_$DictionaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
