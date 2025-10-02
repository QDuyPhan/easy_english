// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  String? get word => throw _privateConstructorUsedError;
  List<Results>? get results => throw _privateConstructorUsedError;
  Syllables? get syllables => throw _privateConstructorUsedError;
  Pronunciation? get pronunciation => throw _privateConstructorUsedError;
  double? get frequency => throw _privateConstructorUsedError;

  /// Serializes this Word to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call({
    String? word,
    List<Results>? results,
    Syllables? syllables,
    Pronunciation? pronunciation,
    double? frequency,
  });

  $SyllablesCopyWith<$Res>? get syllables;
  $PronunciationCopyWith<$Res>? get pronunciation;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? results = freezed,
    Object? syllables = freezed,
    Object? pronunciation = freezed,
    Object? frequency = freezed,
  }) {
    return _then(
      _value.copyWith(
            word:
                freezed == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String?,
            results:
                freezed == results
                    ? _value.results
                    : results // ignore: cast_nullable_to_non_nullable
                        as List<Results>?,
            syllables:
                freezed == syllables
                    ? _value.syllables
                    : syllables // ignore: cast_nullable_to_non_nullable
                        as Syllables?,
            pronunciation:
                freezed == pronunciation
                    ? _value.pronunciation
                    : pronunciation // ignore: cast_nullable_to_non_nullable
                        as Pronunciation?,
            frequency:
                freezed == frequency
                    ? _value.frequency
                    : frequency // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyllablesCopyWith<$Res>? get syllables {
    if (_value.syllables == null) {
      return null;
    }

    return $SyllablesCopyWith<$Res>(_value.syllables!, (value) {
      return _then(_value.copyWith(syllables: value) as $Val);
    });
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PronunciationCopyWith<$Res>? get pronunciation {
    if (_value.pronunciation == null) {
      return null;
    }

    return $PronunciationCopyWith<$Res>(_value.pronunciation!, (value) {
      return _then(_value.copyWith(pronunciation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordImplCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$WordImplCopyWith(
    _$WordImpl value,
    $Res Function(_$WordImpl) then,
  ) = __$$WordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? word,
    List<Results>? results,
    Syllables? syllables,
    Pronunciation? pronunciation,
    double? frequency,
  });

  @override
  $SyllablesCopyWith<$Res>? get syllables;
  @override
  $PronunciationCopyWith<$Res>? get pronunciation;
}

/// @nodoc
class __$$WordImplCopyWithImpl<$Res>
    extends _$WordCopyWithImpl<$Res, _$WordImpl>
    implements _$$WordImplCopyWith<$Res> {
  __$$WordImplCopyWithImpl(_$WordImpl _value, $Res Function(_$WordImpl) _then)
    : super(_value, _then);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? results = freezed,
    Object? syllables = freezed,
    Object? pronunciation = freezed,
    Object? frequency = freezed,
  }) {
    return _then(
      _$WordImpl(
        word:
            freezed == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String?,
        results:
            freezed == results
                ? _value._results
                : results // ignore: cast_nullable_to_non_nullable
                    as List<Results>?,
        syllables:
            freezed == syllables
                ? _value.syllables
                : syllables // ignore: cast_nullable_to_non_nullable
                    as Syllables?,
        pronunciation:
            freezed == pronunciation
                ? _value.pronunciation
                : pronunciation // ignore: cast_nullable_to_non_nullable
                    as Pronunciation?,
        frequency:
            freezed == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WordImpl implements _Word {
  const _$WordImpl({
    this.word = "",
    final List<Results>? results = const [],
    this.syllables,
    this.pronunciation,
    this.frequency = 0.0,
  }) : _results = results;

  factory _$WordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordImplFromJson(json);

  @override
  @JsonKey()
  final String? word;
  final List<Results>? _results;
  @override
  @JsonKey()
  List<Results>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Syllables? syllables;
  @override
  final Pronunciation? pronunciation;
  @override
  @JsonKey()
  final double? frequency;

  @override
  String toString() {
    return 'Word(word: $word, results: $results, syllables: $syllables, pronunciation: $pronunciation, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordImpl &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.syllables, syllables) ||
                other.syllables == syllables) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    word,
    const DeepCollectionEquality().hash(_results),
    syllables,
    pronunciation,
    frequency,
  );

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      __$$WordImplCopyWithImpl<_$WordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordImplToJson(this);
  }
}

abstract class _Word implements Word {
  const factory _Word({
    final String? word,
    final List<Results>? results,
    final Syllables? syllables,
    final Pronunciation? pronunciation,
    final double? frequency,
  }) = _$WordImpl;

  factory _Word.fromJson(Map<String, dynamic> json) = _$WordImpl.fromJson;

  @override
  String? get word;
  @override
  List<Results>? get results;
  @override
  Syllables? get syllables;
  @override
  Pronunciation? get pronunciation;
  @override
  double? get frequency;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
