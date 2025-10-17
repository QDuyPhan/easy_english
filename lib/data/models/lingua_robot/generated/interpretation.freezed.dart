// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../interpretation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Interpretation _$InterpretationFromJson(Map<String, dynamic> json) {
  return _Interpretation.fromJson(json);
}

/// @nodoc
mixin _$Interpretation {
  String get lemma => throw _privateConstructorUsedError;
  List<NormalizedLemma> get normalizedLemmas =>
      throw _privateConstructorUsedError;
  String get partOfSpeech => throw _privateConstructorUsedError;
  List<Grammar> get grammar => throw _privateConstructorUsedError;

  /// Serializes this Interpretation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Interpretation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterpretationCopyWith<Interpretation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterpretationCopyWith<$Res> {
  factory $InterpretationCopyWith(
    Interpretation value,
    $Res Function(Interpretation) then,
  ) = _$InterpretationCopyWithImpl<$Res, Interpretation>;
  @useResult
  $Res call({
    String lemma,
    List<NormalizedLemma> normalizedLemmas,
    String partOfSpeech,
    List<Grammar> grammar,
  });
}

/// @nodoc
class _$InterpretationCopyWithImpl<$Res, $Val extends Interpretation>
    implements $InterpretationCopyWith<$Res> {
  _$InterpretationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Interpretation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lemma = null,
    Object? normalizedLemmas = null,
    Object? partOfSpeech = null,
    Object? grammar = null,
  }) {
    return _then(
      _value.copyWith(
            lemma:
                null == lemma
                    ? _value.lemma
                    : lemma // ignore: cast_nullable_to_non_nullable
                        as String,
            normalizedLemmas:
                null == normalizedLemmas
                    ? _value.normalizedLemmas
                    : normalizedLemmas // ignore: cast_nullable_to_non_nullable
                        as List<NormalizedLemma>,
            partOfSpeech:
                null == partOfSpeech
                    ? _value.partOfSpeech
                    : partOfSpeech // ignore: cast_nullable_to_non_nullable
                        as String,
            grammar:
                null == grammar
                    ? _value.grammar
                    : grammar // ignore: cast_nullable_to_non_nullable
                        as List<Grammar>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InterpretationImplCopyWith<$Res>
    implements $InterpretationCopyWith<$Res> {
  factory _$$InterpretationImplCopyWith(
    _$InterpretationImpl value,
    $Res Function(_$InterpretationImpl) then,
  ) = __$$InterpretationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String lemma,
    List<NormalizedLemma> normalizedLemmas,
    String partOfSpeech,
    List<Grammar> grammar,
  });
}

/// @nodoc
class __$$InterpretationImplCopyWithImpl<$Res>
    extends _$InterpretationCopyWithImpl<$Res, _$InterpretationImpl>
    implements _$$InterpretationImplCopyWith<$Res> {
  __$$InterpretationImplCopyWithImpl(
    _$InterpretationImpl _value,
    $Res Function(_$InterpretationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Interpretation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lemma = null,
    Object? normalizedLemmas = null,
    Object? partOfSpeech = null,
    Object? grammar = null,
  }) {
    return _then(
      _$InterpretationImpl(
        lemma:
            null == lemma
                ? _value.lemma
                : lemma // ignore: cast_nullable_to_non_nullable
                    as String,
        normalizedLemmas:
            null == normalizedLemmas
                ? _value._normalizedLemmas
                : normalizedLemmas // ignore: cast_nullable_to_non_nullable
                    as List<NormalizedLemma>,
        partOfSpeech:
            null == partOfSpeech
                ? _value.partOfSpeech
                : partOfSpeech // ignore: cast_nullable_to_non_nullable
                    as String,
        grammar:
            null == grammar
                ? _value._grammar
                : grammar // ignore: cast_nullable_to_non_nullable
                    as List<Grammar>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InterpretationImpl implements _Interpretation {
  const _$InterpretationImpl({
    this.lemma = '',
    final List<NormalizedLemma> normalizedLemmas = const [],
    this.partOfSpeech = '',
    final List<Grammar> grammar = const [],
  }) : _normalizedLemmas = normalizedLemmas,
       _grammar = grammar;

  factory _$InterpretationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterpretationImplFromJson(json);

  @override
  @JsonKey()
  final String lemma;
  final List<NormalizedLemma> _normalizedLemmas;
  @override
  @JsonKey()
  List<NormalizedLemma> get normalizedLemmas {
    if (_normalizedLemmas is EqualUnmodifiableListView)
      return _normalizedLemmas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_normalizedLemmas);
  }

  @override
  @JsonKey()
  final String partOfSpeech;
  final List<Grammar> _grammar;
  @override
  @JsonKey()
  List<Grammar> get grammar {
    if (_grammar is EqualUnmodifiableListView) return _grammar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grammar);
  }

  @override
  String toString() {
    return 'Interpretation(lemma: $lemma, normalizedLemmas: $normalizedLemmas, partOfSpeech: $partOfSpeech, grammar: $grammar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterpretationImpl &&
            (identical(other.lemma, lemma) || other.lemma == lemma) &&
            const DeepCollectionEquality().equals(
              other._normalizedLemmas,
              _normalizedLemmas,
            ) &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            const DeepCollectionEquality().equals(other._grammar, _grammar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lemma,
    const DeepCollectionEquality().hash(_normalizedLemmas),
    partOfSpeech,
    const DeepCollectionEquality().hash(_grammar),
  );

  /// Create a copy of Interpretation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterpretationImplCopyWith<_$InterpretationImpl> get copyWith =>
      __$$InterpretationImplCopyWithImpl<_$InterpretationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InterpretationImplToJson(this);
  }
}

abstract class _Interpretation implements Interpretation {
  const factory _Interpretation({
    final String lemma,
    final List<NormalizedLemma> normalizedLemmas,
    final String partOfSpeech,
    final List<Grammar> grammar,
  }) = _$InterpretationImpl;

  factory _Interpretation.fromJson(Map<String, dynamic> json) =
      _$InterpretationImpl.fromJson;

  @override
  String get lemma;
  @override
  List<NormalizedLemma> get normalizedLemmas;
  @override
  String get partOfSpeech;
  @override
  List<Grammar> get grammar;

  /// Create a copy of Interpretation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterpretationImplCopyWith<_$InterpretationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
