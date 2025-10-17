// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../lexeme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Lexeme _$LexemeFromJson(Map<String, dynamic> json) {
  return _Lexeme.fromJson(json);
}

/// @nodoc
mixin _$Lexeme {
  String get lemma => throw _privateConstructorUsedError;
  String get partOfSpeech => throw _privateConstructorUsedError;
  List<Sense> get senses => throw _privateConstructorUsedError;
  List<Form> get forms => throw _privateConstructorUsedError;

  /// Serializes this Lexeme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lexeme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LexemeCopyWith<Lexeme> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LexemeCopyWith<$Res> {
  factory $LexemeCopyWith(Lexeme value, $Res Function(Lexeme) then) =
      _$LexemeCopyWithImpl<$Res, Lexeme>;
  @useResult
  $Res call({
    String lemma,
    String partOfSpeech,
    List<Sense> senses,
    List<Form> forms,
  });
}

/// @nodoc
class _$LexemeCopyWithImpl<$Res, $Val extends Lexeme>
    implements $LexemeCopyWith<$Res> {
  _$LexemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lexeme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lemma = null,
    Object? partOfSpeech = null,
    Object? senses = null,
    Object? forms = null,
  }) {
    return _then(
      _value.copyWith(
            lemma:
                null == lemma
                    ? _value.lemma
                    : lemma // ignore: cast_nullable_to_non_nullable
                        as String,
            partOfSpeech:
                null == partOfSpeech
                    ? _value.partOfSpeech
                    : partOfSpeech // ignore: cast_nullable_to_non_nullable
                        as String,
            senses:
                null == senses
                    ? _value.senses
                    : senses // ignore: cast_nullable_to_non_nullable
                        as List<Sense>,
            forms:
                null == forms
                    ? _value.forms
                    : forms // ignore: cast_nullable_to_non_nullable
                        as List<Form>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LexemeImplCopyWith<$Res> implements $LexemeCopyWith<$Res> {
  factory _$$LexemeImplCopyWith(
    _$LexemeImpl value,
    $Res Function(_$LexemeImpl) then,
  ) = __$$LexemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String lemma,
    String partOfSpeech,
    List<Sense> senses,
    List<Form> forms,
  });
}

/// @nodoc
class __$$LexemeImplCopyWithImpl<$Res>
    extends _$LexemeCopyWithImpl<$Res, _$LexemeImpl>
    implements _$$LexemeImplCopyWith<$Res> {
  __$$LexemeImplCopyWithImpl(
    _$LexemeImpl _value,
    $Res Function(_$LexemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Lexeme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lemma = null,
    Object? partOfSpeech = null,
    Object? senses = null,
    Object? forms = null,
  }) {
    return _then(
      _$LexemeImpl(
        lemma:
            null == lemma
                ? _value.lemma
                : lemma // ignore: cast_nullable_to_non_nullable
                    as String,
        partOfSpeech:
            null == partOfSpeech
                ? _value.partOfSpeech
                : partOfSpeech // ignore: cast_nullable_to_non_nullable
                    as String,
        senses:
            null == senses
                ? _value._senses
                : senses // ignore: cast_nullable_to_non_nullable
                    as List<Sense>,
        forms:
            null == forms
                ? _value._forms
                : forms // ignore: cast_nullable_to_non_nullable
                    as List<Form>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LexemeImpl implements _Lexeme {
  const _$LexemeImpl({
    this.lemma = '',
    this.partOfSpeech = '',
    final List<Sense> senses = const [],
    final List<Form> forms = const [],
  }) : _senses = senses,
       _forms = forms;

  factory _$LexemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LexemeImplFromJson(json);

  @override
  @JsonKey()
  final String lemma;
  @override
  @JsonKey()
  final String partOfSpeech;
  final List<Sense> _senses;
  @override
  @JsonKey()
  List<Sense> get senses {
    if (_senses is EqualUnmodifiableListView) return _senses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_senses);
  }

  final List<Form> _forms;
  @override
  @JsonKey()
  List<Form> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @override
  String toString() {
    return 'Lexeme(lemma: $lemma, partOfSpeech: $partOfSpeech, senses: $senses, forms: $forms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LexemeImpl &&
            (identical(other.lemma, lemma) || other.lemma == lemma) &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            const DeepCollectionEquality().equals(other._senses, _senses) &&
            const DeepCollectionEquality().equals(other._forms, _forms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lemma,
    partOfSpeech,
    const DeepCollectionEquality().hash(_senses),
    const DeepCollectionEquality().hash(_forms),
  );

  /// Create a copy of Lexeme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LexemeImplCopyWith<_$LexemeImpl> get copyWith =>
      __$$LexemeImplCopyWithImpl<_$LexemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LexemeImplToJson(this);
  }
}

abstract class _Lexeme implements Lexeme {
  const factory _Lexeme({
    final String lemma,
    final String partOfSpeech,
    final List<Sense> senses,
    final List<Form> forms,
  }) = _$LexemeImpl;

  factory _Lexeme.fromJson(Map<String, dynamic> json) = _$LexemeImpl.fromJson;

  @override
  String get lemma;
  @override
  String get partOfSpeech;
  @override
  List<Sense> get senses;
  @override
  List<Form> get forms;

  /// Create a copy of Lexeme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LexemeImplCopyWith<_$LexemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
