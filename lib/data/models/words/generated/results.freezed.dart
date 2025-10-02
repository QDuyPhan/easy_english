// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return _Results.fromJson(json);
}

/// @nodoc
mixin _$Results {
  String? get definition => throw _privateConstructorUsedError;
  String? get partOfSpeech => throw _privateConstructorUsedError;
  List<String>? get synonyms => throw _privateConstructorUsedError;
  List<String>? get typeOf => throw _privateConstructorUsedError;
  List<String>? get hasTypes => throw _privateConstructorUsedError;
  List<String>? get derivation => throw _privateConstructorUsedError;
  List<String>? get examples => throw _privateConstructorUsedError;

  /// Serializes this Results to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultsCopyWith<Results> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsCopyWith<$Res> {
  factory $ResultsCopyWith(Results value, $Res Function(Results) then) =
      _$ResultsCopyWithImpl<$Res, Results>;
  @useResult
  $Res call({
    String? definition,
    String? partOfSpeech,
    List<String>? synonyms,
    List<String>? typeOf,
    List<String>? hasTypes,
    List<String>? derivation,
    List<String>? examples,
  });
}

/// @nodoc
class _$ResultsCopyWithImpl<$Res, $Val extends Results>
    implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? partOfSpeech = freezed,
    Object? synonyms = freezed,
    Object? typeOf = freezed,
    Object? hasTypes = freezed,
    Object? derivation = freezed,
    Object? examples = freezed,
  }) {
    return _then(
      _value.copyWith(
            definition:
                freezed == definition
                    ? _value.definition
                    : definition // ignore: cast_nullable_to_non_nullable
                        as String?,
            partOfSpeech:
                freezed == partOfSpeech
                    ? _value.partOfSpeech
                    : partOfSpeech // ignore: cast_nullable_to_non_nullable
                        as String?,
            synonyms:
                freezed == synonyms
                    ? _value.synonyms
                    : synonyms // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            typeOf:
                freezed == typeOf
                    ? _value.typeOf
                    : typeOf // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            hasTypes:
                freezed == hasTypes
                    ? _value.hasTypes
                    : hasTypes // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            derivation:
                freezed == derivation
                    ? _value.derivation
                    : derivation // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            examples:
                freezed == examples
                    ? _value.examples
                    : examples // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultsImplCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$$ResultsImplCopyWith(
    _$ResultsImpl value,
    $Res Function(_$ResultsImpl) then,
  ) = __$$ResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? definition,
    String? partOfSpeech,
    List<String>? synonyms,
    List<String>? typeOf,
    List<String>? hasTypes,
    List<String>? derivation,
    List<String>? examples,
  });
}

/// @nodoc
class __$$ResultsImplCopyWithImpl<$Res>
    extends _$ResultsCopyWithImpl<$Res, _$ResultsImpl>
    implements _$$ResultsImplCopyWith<$Res> {
  __$$ResultsImplCopyWithImpl(
    _$ResultsImpl _value,
    $Res Function(_$ResultsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? partOfSpeech = freezed,
    Object? synonyms = freezed,
    Object? typeOf = freezed,
    Object? hasTypes = freezed,
    Object? derivation = freezed,
    Object? examples = freezed,
  }) {
    return _then(
      _$ResultsImpl(
        definition:
            freezed == definition
                ? _value.definition
                : definition // ignore: cast_nullable_to_non_nullable
                    as String?,
        partOfSpeech:
            freezed == partOfSpeech
                ? _value.partOfSpeech
                : partOfSpeech // ignore: cast_nullable_to_non_nullable
                    as String?,
        synonyms:
            freezed == synonyms
                ? _value._synonyms
                : synonyms // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        typeOf:
            freezed == typeOf
                ? _value._typeOf
                : typeOf // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        hasTypes:
            freezed == hasTypes
                ? _value._hasTypes
                : hasTypes // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        derivation:
            freezed == derivation
                ? _value._derivation
                : derivation // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        examples:
            freezed == examples
                ? _value._examples
                : examples // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultsImpl implements _Results {
  const _$ResultsImpl({
    this.definition = "",
    this.partOfSpeech = "",
    final List<String>? synonyms = const [],
    final List<String>? typeOf = const [],
    final List<String>? hasTypes = const [],
    final List<String>? derivation = const [],
    final List<String>? examples = const [],
  }) : _synonyms = synonyms,
       _typeOf = typeOf,
       _hasTypes = hasTypes,
       _derivation = derivation,
       _examples = examples;

  factory _$ResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultsImplFromJson(json);

  @override
  @JsonKey()
  final String? definition;
  @override
  @JsonKey()
  final String? partOfSpeech;
  final List<String>? _synonyms;
  @override
  @JsonKey()
  List<String>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _typeOf;
  @override
  @JsonKey()
  List<String>? get typeOf {
    final value = _typeOf;
    if (value == null) return null;
    if (_typeOf is EqualUnmodifiableListView) return _typeOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _hasTypes;
  @override
  @JsonKey()
  List<String>? get hasTypes {
    final value = _hasTypes;
    if (value == null) return null;
    if (_hasTypes is EqualUnmodifiableListView) return _hasTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _derivation;
  @override
  @JsonKey()
  List<String>? get derivation {
    final value = _derivation;
    if (value == null) return null;
    if (_derivation is EqualUnmodifiableListView) return _derivation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _examples;
  @override
  @JsonKey()
  List<String>? get examples {
    final value = _examples;
    if (value == null) return null;
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Results(definition: $definition, partOfSpeech: $partOfSpeech, synonyms: $synonyms, typeOf: $typeOf, hasTypes: $hasTypes, derivation: $derivation, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other._typeOf, _typeOf) &&
            const DeepCollectionEquality().equals(other._hasTypes, _hasTypes) &&
            const DeepCollectionEquality().equals(
              other._derivation,
              _derivation,
            ) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    definition,
    partOfSpeech,
    const DeepCollectionEquality().hash(_synonyms),
    const DeepCollectionEquality().hash(_typeOf),
    const DeepCollectionEquality().hash(_hasTypes),
    const DeepCollectionEquality().hash(_derivation),
    const DeepCollectionEquality().hash(_examples),
  );

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsImplCopyWith<_$ResultsImpl> get copyWith =>
      __$$ResultsImplCopyWithImpl<_$ResultsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultsImplToJson(this);
  }
}

abstract class _Results implements Results {
  const factory _Results({
    final String? definition,
    final String? partOfSpeech,
    final List<String>? synonyms,
    final List<String>? typeOf,
    final List<String>? hasTypes,
    final List<String>? derivation,
    final List<String>? examples,
  }) = _$ResultsImpl;

  factory _Results.fromJson(Map<String, dynamic> json) = _$ResultsImpl.fromJson;

  @override
  String? get definition;
  @override
  String? get partOfSpeech;
  @override
  List<String>? get synonyms;
  @override
  List<String>? get typeOf;
  @override
  List<String>? get hasTypes;
  @override
  List<String>? get derivation;
  @override
  List<String>? get examples;

  /// Create a copy of Results
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultsImplCopyWith<_$ResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
