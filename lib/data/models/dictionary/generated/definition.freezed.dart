// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String? get definition => throw _privateConstructorUsedError;
  List<dynamic>? get synonyms => throw _privateConstructorUsedError;
  List<dynamic>? get antonyms => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;

  /// Serializes this Definition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
    Definition value,
    $Res Function(Definition) then,
  ) = _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
    String? example,
  });
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
    Object? example = freezed,
  }) {
    return _then(
      _value.copyWith(
            definition:
                freezed == definition
                    ? _value.definition
                    : definition // ignore: cast_nullable_to_non_nullable
                        as String?,
            synonyms:
                freezed == synonyms
                    ? _value.synonyms
                    : synonyms // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
            antonyms:
                freezed == antonyms
                    ? _value.antonyms
                    : antonyms // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
            example:
                freezed == example
                    ? _value.example
                    : example // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(
    _$DefinitionImpl value,
    $Res Function(_$DefinitionImpl) then,
  ) = __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
    String? example,
  });
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(
    _$DefinitionImpl _value,
    $Res Function(_$DefinitionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
    Object? example = freezed,
  }) {
    return _then(
      _$DefinitionImpl(
        definition:
            freezed == definition
                ? _value.definition
                : definition // ignore: cast_nullable_to_non_nullable
                    as String?,
        synonyms:
            freezed == synonyms
                ? _value._synonyms
                : synonyms // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
        antonyms:
            freezed == antonyms
                ? _value._antonyms
                : antonyms // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
        example:
            freezed == example
                ? _value.example
                : example // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl({
    this.definition,
    final List<dynamic>? synonyms,
    final List<dynamic>? antonyms,
    this.example,
  }) : _synonyms = synonyms,
       _antonyms = antonyms;

  factory _$DefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefinitionImplFromJson(json);

  @override
  final String? definition;
  final List<dynamic>? _synonyms;
  @override
  List<dynamic>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _antonyms;
  @override
  List<dynamic>? get antonyms {
    final value = _antonyms;
    if (value == null) return null;
    if (_antonyms is EqualUnmodifiableListView) return _antonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? example;

  @override
  String toString() {
    return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other._antonyms, _antonyms) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    definition,
    const DeepCollectionEquality().hash(_synonyms),
    const DeepCollectionEquality().hash(_antonyms),
    example,
  );

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionImplToJson(this);
  }
}

abstract class _Definition implements Definition {
  const factory _Definition({
    final String? definition,
    final List<dynamic>? synonyms,
    final List<dynamic>? antonyms,
    final String? example,
  }) = _$DefinitionImpl;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$DefinitionImpl.fromJson;

  @override
  String? get definition;
  @override
  List<dynamic>? get synonyms;
  @override
  List<dynamic>? get antonyms;
  @override
  String? get example;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
