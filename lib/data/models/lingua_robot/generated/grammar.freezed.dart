// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../grammar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Grammar _$GrammarFromJson(Map<String, dynamic> json) {
  return _Grammar.fromJson(json);
}

/// @nodoc
mixin _$Grammar {
  List<String> get number => throw _privateConstructorUsedError;
  List<String> get grammarCase => throw _privateConstructorUsedError;
  List<String> get person => throw _privateConstructorUsedError;
  List<String> get verbForm => throw _privateConstructorUsedError;
  List<String> get tense => throw _privateConstructorUsedError;
  List<String> get mood => throw _privateConstructorUsedError;

  /// Serializes this Grammar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Grammar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarCopyWith<Grammar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarCopyWith<$Res> {
  factory $GrammarCopyWith(Grammar value, $Res Function(Grammar) then) =
      _$GrammarCopyWithImpl<$Res, Grammar>;
  @useResult
  $Res call({
    List<String> number,
    List<String> grammarCase,
    List<String> person,
    List<String> verbForm,
    List<String> tense,
    List<String> mood,
  });
}

/// @nodoc
class _$GrammarCopyWithImpl<$Res, $Val extends Grammar>
    implements $GrammarCopyWith<$Res> {
  _$GrammarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Grammar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? grammarCase = null,
    Object? person = null,
    Object? verbForm = null,
    Object? tense = null,
    Object? mood = null,
  }) {
    return _then(
      _value.copyWith(
            number:
                null == number
                    ? _value.number
                    : number // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            grammarCase:
                null == grammarCase
                    ? _value.grammarCase
                    : grammarCase // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            person:
                null == person
                    ? _value.person
                    : person // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            verbForm:
                null == verbForm
                    ? _value.verbForm
                    : verbForm // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            tense:
                null == tense
                    ? _value.tense
                    : tense // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            mood:
                null == mood
                    ? _value.mood
                    : mood // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GrammarImplCopyWith<$Res> implements $GrammarCopyWith<$Res> {
  factory _$$GrammarImplCopyWith(
    _$GrammarImpl value,
    $Res Function(_$GrammarImpl) then,
  ) = __$$GrammarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> number,
    List<String> grammarCase,
    List<String> person,
    List<String> verbForm,
    List<String> tense,
    List<String> mood,
  });
}

/// @nodoc
class __$$GrammarImplCopyWithImpl<$Res>
    extends _$GrammarCopyWithImpl<$Res, _$GrammarImpl>
    implements _$$GrammarImplCopyWith<$Res> {
  __$$GrammarImplCopyWithImpl(
    _$GrammarImpl _value,
    $Res Function(_$GrammarImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Grammar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? grammarCase = null,
    Object? person = null,
    Object? verbForm = null,
    Object? tense = null,
    Object? mood = null,
  }) {
    return _then(
      _$GrammarImpl(
        number:
            null == number
                ? _value._number
                : number // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        grammarCase:
            null == grammarCase
                ? _value._grammarCase
                : grammarCase // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        person:
            null == person
                ? _value._person
                : person // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        verbForm:
            null == verbForm
                ? _value._verbForm
                : verbForm // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        tense:
            null == tense
                ? _value._tense
                : tense // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        mood:
            null == mood
                ? _value._mood
                : mood // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GrammarImpl implements _Grammar {
  const _$GrammarImpl({
    final List<String> number = const [],
    final List<String> grammarCase = const [],
    final List<String> person = const [],
    final List<String> verbForm = const [],
    final List<String> tense = const [],
    final List<String> mood = const [],
  }) : _number = number,
       _grammarCase = grammarCase,
       _person = person,
       _verbForm = verbForm,
       _tense = tense,
       _mood = mood;

  factory _$GrammarImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrammarImplFromJson(json);

  final List<String> _number;
  @override
  @JsonKey()
  List<String> get number {
    if (_number is EqualUnmodifiableListView) return _number;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_number);
  }

  final List<String> _grammarCase;
  @override
  @JsonKey()
  List<String> get grammarCase {
    if (_grammarCase is EqualUnmodifiableListView) return _grammarCase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grammarCase);
  }

  final List<String> _person;
  @override
  @JsonKey()
  List<String> get person {
    if (_person is EqualUnmodifiableListView) return _person;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_person);
  }

  final List<String> _verbForm;
  @override
  @JsonKey()
  List<String> get verbForm {
    if (_verbForm is EqualUnmodifiableListView) return _verbForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verbForm);
  }

  final List<String> _tense;
  @override
  @JsonKey()
  List<String> get tense {
    if (_tense is EqualUnmodifiableListView) return _tense;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tense);
  }

  final List<String> _mood;
  @override
  @JsonKey()
  List<String> get mood {
    if (_mood is EqualUnmodifiableListView) return _mood;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mood);
  }

  @override
  String toString() {
    return 'Grammar(number: $number, grammarCase: $grammarCase, person: $person, verbForm: $verbForm, tense: $tense, mood: $mood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarImpl &&
            const DeepCollectionEquality().equals(other._number, _number) &&
            const DeepCollectionEquality().equals(
              other._grammarCase,
              _grammarCase,
            ) &&
            const DeepCollectionEquality().equals(other._person, _person) &&
            const DeepCollectionEquality().equals(other._verbForm, _verbForm) &&
            const DeepCollectionEquality().equals(other._tense, _tense) &&
            const DeepCollectionEquality().equals(other._mood, _mood));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_number),
    const DeepCollectionEquality().hash(_grammarCase),
    const DeepCollectionEquality().hash(_person),
    const DeepCollectionEquality().hash(_verbForm),
    const DeepCollectionEquality().hash(_tense),
    const DeepCollectionEquality().hash(_mood),
  );

  /// Create a copy of Grammar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarImplCopyWith<_$GrammarImpl> get copyWith =>
      __$$GrammarImplCopyWithImpl<_$GrammarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrammarImplToJson(this);
  }
}

abstract class _Grammar implements Grammar {
  const factory _Grammar({
    final List<String> number,
    final List<String> grammarCase,
    final List<String> person,
    final List<String> verbForm,
    final List<String> tense,
    final List<String> mood,
  }) = _$GrammarImpl;

  factory _Grammar.fromJson(Map<String, dynamic> json) = _$GrammarImpl.fromJson;

  @override
  List<String> get number;
  @override
  List<String> get grammarCase;
  @override
  List<String> get person;
  @override
  List<String> get verbForm;
  @override
  List<String> get tense;
  @override
  List<String> get mood;

  /// Create a copy of Grammar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarImplCopyWith<_$GrammarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
