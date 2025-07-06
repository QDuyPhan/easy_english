// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../topics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopicsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String folder, String topic) getAllTopics,
    required TResult Function(WordEntity word, WordStatusEntity wordStatus)
        saveWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String folder, String topic)? getAllTopics,
    TResult? Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String folder, String topic)? getAllTopics,
    TResult Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllTopics value) getAllTopics,
    required TResult Function(_SaveWord value) saveWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllTopics value)? getAllTopics,
    TResult? Function(_SaveWord value)? saveWord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllTopics value)? getAllTopics,
    TResult Function(_SaveWord value)? saveWord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicsEventCopyWith<$Res> {
  factory $TopicsEventCopyWith(
          TopicsEvent value, $Res Function(TopicsEvent) then) =
      _$TopicsEventCopyWithImpl<$Res, TopicsEvent>;
}

/// @nodoc
class _$TopicsEventCopyWithImpl<$Res, $Val extends TopicsEvent>
    implements $TopicsEventCopyWith<$Res> {
  _$TopicsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllTopicsImplCopyWith<$Res> {
  factory _$$GetAllTopicsImplCopyWith(
          _$GetAllTopicsImpl value, $Res Function(_$GetAllTopicsImpl) then) =
      __$$GetAllTopicsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String folder, String topic});
}

/// @nodoc
class __$$GetAllTopicsImplCopyWithImpl<$Res>
    extends _$TopicsEventCopyWithImpl<$Res, _$GetAllTopicsImpl>
    implements _$$GetAllTopicsImplCopyWith<$Res> {
  __$$GetAllTopicsImplCopyWithImpl(
      _$GetAllTopicsImpl _value, $Res Function(_$GetAllTopicsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folder = null,
    Object? topic = null,
  }) {
    return _then(_$GetAllTopicsImpl(
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllTopicsImpl implements _GetAllTopics {
  const _$GetAllTopicsImpl({required this.folder, required this.topic});

  @override
  final String folder;
  @override
  final String topic;

  @override
  String toString() {
    return 'TopicsEvent.getAllTopics(folder: $folder, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllTopicsImpl &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, folder, topic);

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllTopicsImplCopyWith<_$GetAllTopicsImpl> get copyWith =>
      __$$GetAllTopicsImplCopyWithImpl<_$GetAllTopicsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String folder, String topic) getAllTopics,
    required TResult Function(WordEntity word, WordStatusEntity wordStatus)
        saveWord,
  }) {
    return getAllTopics(folder, topic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String folder, String topic)? getAllTopics,
    TResult? Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
  }) {
    return getAllTopics?.call(folder, topic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String folder, String topic)? getAllTopics,
    TResult Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
    required TResult orElse(),
  }) {
    if (getAllTopics != null) {
      return getAllTopics(folder, topic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllTopics value) getAllTopics,
    required TResult Function(_SaveWord value) saveWord,
  }) {
    return getAllTopics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllTopics value)? getAllTopics,
    TResult? Function(_SaveWord value)? saveWord,
  }) {
    return getAllTopics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllTopics value)? getAllTopics,
    TResult Function(_SaveWord value)? saveWord,
    required TResult orElse(),
  }) {
    if (getAllTopics != null) {
      return getAllTopics(this);
    }
    return orElse();
  }
}

abstract class _GetAllTopics implements TopicsEvent {
  const factory _GetAllTopics(
      {required final String folder,
      required final String topic}) = _$GetAllTopicsImpl;

  String get folder;
  String get topic;

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllTopicsImplCopyWith<_$GetAllTopicsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveWordImplCopyWith<$Res> {
  factory _$$SaveWordImplCopyWith(
          _$SaveWordImpl value, $Res Function(_$SaveWordImpl) then) =
      __$$SaveWordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WordEntity word, WordStatusEntity wordStatus});
}

/// @nodoc
class __$$SaveWordImplCopyWithImpl<$Res>
    extends _$TopicsEventCopyWithImpl<$Res, _$SaveWordImpl>
    implements _$$SaveWordImplCopyWith<$Res> {
  __$$SaveWordImplCopyWithImpl(
      _$SaveWordImpl _value, $Res Function(_$SaveWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? wordStatus = null,
  }) {
    return _then(_$SaveWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as WordEntity,
      wordStatus: null == wordStatus
          ? _value.wordStatus
          : wordStatus // ignore: cast_nullable_to_non_nullable
              as WordStatusEntity,
    ));
  }
}

/// @nodoc

class _$SaveWordImpl implements _SaveWord {
  const _$SaveWordImpl({required this.word, required this.wordStatus});

  @override
  final WordEntity word;
  @override
  final WordStatusEntity wordStatus;

  @override
  String toString() {
    return 'TopicsEvent.saveWord(word: $word, wordStatus: $wordStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.wordStatus, wordStatus) ||
                other.wordStatus == wordStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, wordStatus);

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveWordImplCopyWith<_$SaveWordImpl> get copyWith =>
      __$$SaveWordImplCopyWithImpl<_$SaveWordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String folder, String topic) getAllTopics,
    required TResult Function(WordEntity word, WordStatusEntity wordStatus)
        saveWord,
  }) {
    return saveWord(word, wordStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String folder, String topic)? getAllTopics,
    TResult? Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
  }) {
    return saveWord?.call(word, wordStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String folder, String topic)? getAllTopics,
    TResult Function(WordEntity word, WordStatusEntity wordStatus)? saveWord,
    required TResult orElse(),
  }) {
    if (saveWord != null) {
      return saveWord(word, wordStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllTopics value) getAllTopics,
    required TResult Function(_SaveWord value) saveWord,
  }) {
    return saveWord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllTopics value)? getAllTopics,
    TResult? Function(_SaveWord value)? saveWord,
  }) {
    return saveWord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllTopics value)? getAllTopics,
    TResult Function(_SaveWord value)? saveWord,
    required TResult orElse(),
  }) {
    if (saveWord != null) {
      return saveWord(this);
    }
    return orElse();
  }
}

abstract class _SaveWord implements TopicsEvent {
  const factory _SaveWord(
      {required final WordEntity word,
      required final WordStatusEntity wordStatus}) = _$SaveWordImpl;

  WordEntity get word;
  WordStatusEntity get wordStatus;

  /// Create a copy of TopicsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveWordImplCopyWith<_$SaveWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TopicsState {
  List<WordEntity> get words => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WordEntity> words) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<WordEntity> words)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WordEntity> words)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TopicsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicsStateCopyWith<TopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicsStateCopyWith<$Res> {
  factory $TopicsStateCopyWith(
          TopicsState value, $Res Function(TopicsState) then) =
      _$TopicsStateCopyWithImpl<$Res, TopicsState>;
  @useResult
  $Res call({List<WordEntity> words});
}

/// @nodoc
class _$TopicsStateCopyWithImpl<$Res, $Val extends TopicsState>
    implements $TopicsStateCopyWith<$Res> {
  _$TopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<WordEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TopicsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WordEntity> words});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TopicsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? words = null,
  }) {
    return _then(_$InitialImpl(
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<WordEntity>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({final List<WordEntity> words = const []})
      : _words = words;

  final List<WordEntity> _words;
  @override
  @JsonKey()
  List<WordEntity> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'TopicsState.initial(words: $words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_words));

  /// Create a copy of TopicsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WordEntity> words) initial,
  }) {
    return initial(words);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<WordEntity> words)? initial,
  }) {
    return initial?.call(words);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WordEntity> words)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(words);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TopicsState {
  const factory _Initial({final List<WordEntity> words}) = _$InitialImpl;

  @override
  List<WordEntity> get words;

  /// Create a copy of TopicsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
