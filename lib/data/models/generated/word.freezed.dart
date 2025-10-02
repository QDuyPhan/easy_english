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
  String get word => throw _privateConstructorUsedError;
  String get pos => throw _privateConstructorUsedError;
  String get phonetic => throw _privateConstructorUsedError;
  String get phonetic_text => throw _privateConstructorUsedError;
  String get phonetic_am => throw _privateConstructorUsedError;
  String get phonetic_am_text => throw _privateConstructorUsedError;
  List<Sense> get senses => throw _privateConstructorUsedError;
  WordStatus get status => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

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
    String word,
    String pos,
    String phonetic,
    String phonetic_text,
    String phonetic_am,
    String phonetic_am_text,
    List<Sense> senses,
    WordStatus status,
    String id,
  });
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
    Object? word = null,
    Object? pos = null,
    Object? phonetic = null,
    Object? phonetic_text = null,
    Object? phonetic_am = null,
    Object? phonetic_am_text = null,
    Object? senses = null,
    Object? status = null,
    Object? id = null,
  }) {
    return _then(
      _value.copyWith(
            word:
                null == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String,
            pos:
                null == pos
                    ? _value.pos
                    : pos // ignore: cast_nullable_to_non_nullable
                        as String,
            phonetic:
                null == phonetic
                    ? _value.phonetic
                    : phonetic // ignore: cast_nullable_to_non_nullable
                        as String,
            phonetic_text:
                null == phonetic_text
                    ? _value.phonetic_text
                    : phonetic_text // ignore: cast_nullable_to_non_nullable
                        as String,
            phonetic_am:
                null == phonetic_am
                    ? _value.phonetic_am
                    : phonetic_am // ignore: cast_nullable_to_non_nullable
                        as String,
            phonetic_am_text:
                null == phonetic_am_text
                    ? _value.phonetic_am_text
                    : phonetic_am_text // ignore: cast_nullable_to_non_nullable
                        as String,
            senses:
                null == senses
                    ? _value.senses
                    : senses // ignore: cast_nullable_to_non_nullable
                        as List<Sense>,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as WordStatus,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
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
    String word,
    String pos,
    String phonetic,
    String phonetic_text,
    String phonetic_am,
    String phonetic_am_text,
    List<Sense> senses,
    WordStatus status,
    String id,
  });
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
    Object? word = null,
    Object? pos = null,
    Object? phonetic = null,
    Object? phonetic_text = null,
    Object? phonetic_am = null,
    Object? phonetic_am_text = null,
    Object? senses = null,
    Object? status = null,
    Object? id = null,
  }) {
    return _then(
      _$WordImpl(
        word:
            null == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String,
        pos:
            null == pos
                ? _value.pos
                : pos // ignore: cast_nullable_to_non_nullable
                    as String,
        phonetic:
            null == phonetic
                ? _value.phonetic
                : phonetic // ignore: cast_nullable_to_non_nullable
                    as String,
        phonetic_text:
            null == phonetic_text
                ? _value.phonetic_text
                : phonetic_text // ignore: cast_nullable_to_non_nullable
                    as String,
        phonetic_am:
            null == phonetic_am
                ? _value.phonetic_am
                : phonetic_am // ignore: cast_nullable_to_non_nullable
                    as String,
        phonetic_am_text:
            null == phonetic_am_text
                ? _value.phonetic_am_text
                : phonetic_am_text // ignore: cast_nullable_to_non_nullable
                    as String,
        senses:
            null == senses
                ? _value._senses
                : senses // ignore: cast_nullable_to_non_nullable
                    as List<Sense>,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as WordStatus,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WordImpl implements _Word {
  const _$WordImpl({
    this.word = "",
    this.pos = "",
    this.phonetic = "",
    this.phonetic_text = "",
    this.phonetic_am = "",
    this.phonetic_am_text = "",
    final List<Sense> senses = const [],
    this.status = WordStatus.unknown,
    this.id = "",
  }) : _senses = senses;

  factory _$WordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordImplFromJson(json);

  @override
  @JsonKey()
  final String word;
  @override
  @JsonKey()
  final String pos;
  @override
  @JsonKey()
  final String phonetic;
  @override
  @JsonKey()
  final String phonetic_text;
  @override
  @JsonKey()
  final String phonetic_am;
  @override
  @JsonKey()
  final String phonetic_am_text;
  final List<Sense> _senses;
  @override
  @JsonKey()
  List<Sense> get senses {
    if (_senses is EqualUnmodifiableListView) return _senses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_senses);
  }

  @override
  @JsonKey()
  final WordStatus status;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'Word(word: $word, pos: $pos, phonetic: $phonetic, phonetic_text: $phonetic_text, phonetic_am: $phonetic_am, phonetic_am_text: $phonetic_am_text, senses: $senses, status: $status, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.pos, pos) || other.pos == pos) &&
            (identical(other.phonetic, phonetic) ||
                other.phonetic == phonetic) &&
            (identical(other.phonetic_text, phonetic_text) ||
                other.phonetic_text == phonetic_text) &&
            (identical(other.phonetic_am, phonetic_am) ||
                other.phonetic_am == phonetic_am) &&
            (identical(other.phonetic_am_text, phonetic_am_text) ||
                other.phonetic_am_text == phonetic_am_text) &&
            const DeepCollectionEquality().equals(other._senses, _senses) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    word,
    pos,
    phonetic,
    phonetic_text,
    phonetic_am,
    phonetic_am_text,
    const DeepCollectionEquality().hash(_senses),
    status,
    id,
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
    final String word,
    final String pos,
    final String phonetic,
    final String phonetic_text,
    final String phonetic_am,
    final String phonetic_am_text,
    final List<Sense> senses,
    final WordStatus status,
    final String id,
  }) = _$WordImpl;

  factory _Word.fromJson(Map<String, dynamic> json) = _$WordImpl.fromJson;

  @override
  String get word;
  @override
  String get pos;
  @override
  String get phonetic;
  @override
  String get phonetic_text;
  @override
  String get phonetic_am;
  @override
  String get phonetic_am_text;
  @override
  List<Sense> get senses;
  @override
  WordStatus get status;
  @override
  String get id;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
