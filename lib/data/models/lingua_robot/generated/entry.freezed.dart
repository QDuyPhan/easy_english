// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  String get entry => throw _privateConstructorUsedError;
  List<Pronunciation> get pronunciations => throw _privateConstructorUsedError;
  List<Interpretation> get interpretations =>
      throw _privateConstructorUsedError;
  List<Lexeme> get lexemes => throw _privateConstructorUsedError;
  License? get license => throw _privateConstructorUsedError;
  List<String> get sourceUrls => throw _privateConstructorUsedError;

  /// Serializes this Entry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call({
    String entry,
    List<Pronunciation> pronunciations,
    List<Interpretation> interpretations,
    List<Lexeme> lexemes,
    License? license,
    List<String> sourceUrls,
  });

  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
    Object? pronunciations = null,
    Object? interpretations = null,
    Object? lexemes = null,
    Object? license = freezed,
    Object? sourceUrls = null,
  }) {
    return _then(
      _value.copyWith(
            entry:
                null == entry
                    ? _value.entry
                    : entry // ignore: cast_nullable_to_non_nullable
                        as String,
            pronunciations:
                null == pronunciations
                    ? _value.pronunciations
                    : pronunciations // ignore: cast_nullable_to_non_nullable
                        as List<Pronunciation>,
            interpretations:
                null == interpretations
                    ? _value.interpretations
                    : interpretations // ignore: cast_nullable_to_non_nullable
                        as List<Interpretation>,
            lexemes:
                null == lexemes
                    ? _value.lexemes
                    : lexemes // ignore: cast_nullable_to_non_nullable
                        as List<Lexeme>,
            license:
                freezed == license
                    ? _value.license
                    : license // ignore: cast_nullable_to_non_nullable
                        as License?,
            sourceUrls:
                null == sourceUrls
                    ? _value.sourceUrls
                    : sourceUrls // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LicenseCopyWith<$Res>? get license {
    if (_value.license == null) {
      return null;
    }

    return $LicenseCopyWith<$Res>(_value.license!, (value) {
      return _then(_value.copyWith(license: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntryImplCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$EntryImplCopyWith(
    _$EntryImpl value,
    $Res Function(_$EntryImpl) then,
  ) = __$$EntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String entry,
    List<Pronunciation> pronunciations,
    List<Interpretation> interpretations,
    List<Lexeme> lexemes,
    License? license,
    List<String> sourceUrls,
  });

  @override
  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$EntryImplCopyWithImpl<$Res>
    extends _$EntryCopyWithImpl<$Res, _$EntryImpl>
    implements _$$EntryImplCopyWith<$Res> {
  __$$EntryImplCopyWithImpl(
    _$EntryImpl _value,
    $Res Function(_$EntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
    Object? pronunciations = null,
    Object? interpretations = null,
    Object? lexemes = null,
    Object? license = freezed,
    Object? sourceUrls = null,
  }) {
    return _then(
      _$EntryImpl(
        entry:
            null == entry
                ? _value.entry
                : entry // ignore: cast_nullable_to_non_nullable
                    as String,
        pronunciations:
            null == pronunciations
                ? _value._pronunciations
                : pronunciations // ignore: cast_nullable_to_non_nullable
                    as List<Pronunciation>,
        interpretations:
            null == interpretations
                ? _value._interpretations
                : interpretations // ignore: cast_nullable_to_non_nullable
                    as List<Interpretation>,
        lexemes:
            null == lexemes
                ? _value._lexemes
                : lexemes // ignore: cast_nullable_to_non_nullable
                    as List<Lexeme>,
        license:
            freezed == license
                ? _value.license
                : license // ignore: cast_nullable_to_non_nullable
                    as License?,
        sourceUrls:
            null == sourceUrls
                ? _value._sourceUrls
                : sourceUrls // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EntryImpl implements _Entry {
  const _$EntryImpl({
    this.entry = '',
    final List<Pronunciation> pronunciations = const [],
    final List<Interpretation> interpretations = const [],
    final List<Lexeme> lexemes = const [],
    this.license,
    final List<String> sourceUrls = const [],
  }) : _pronunciations = pronunciations,
       _interpretations = interpretations,
       _lexemes = lexemes,
       _sourceUrls = sourceUrls;

  factory _$EntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryImplFromJson(json);

  @override
  @JsonKey()
  final String entry;
  final List<Pronunciation> _pronunciations;
  @override
  @JsonKey()
  List<Pronunciation> get pronunciations {
    if (_pronunciations is EqualUnmodifiableListView) return _pronunciations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pronunciations);
  }

  final List<Interpretation> _interpretations;
  @override
  @JsonKey()
  List<Interpretation> get interpretations {
    if (_interpretations is EqualUnmodifiableListView) return _interpretations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interpretations);
  }

  final List<Lexeme> _lexemes;
  @override
  @JsonKey()
  List<Lexeme> get lexemes {
    if (_lexemes is EqualUnmodifiableListView) return _lexemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lexemes);
  }

  @override
  final License? license;
  final List<String> _sourceUrls;
  @override
  @JsonKey()
  List<String> get sourceUrls {
    if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sourceUrls);
  }

  @override
  String toString() {
    return 'Entry(entry: $entry, pronunciations: $pronunciations, interpretations: $interpretations, lexemes: $lexemes, license: $license, sourceUrls: $sourceUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryImpl &&
            (identical(other.entry, entry) || other.entry == entry) &&
            const DeepCollectionEquality().equals(
              other._pronunciations,
              _pronunciations,
            ) &&
            const DeepCollectionEquality().equals(
              other._interpretations,
              _interpretations,
            ) &&
            const DeepCollectionEquality().equals(other._lexemes, _lexemes) &&
            (identical(other.license, license) || other.license == license) &&
            const DeepCollectionEquality().equals(
              other._sourceUrls,
              _sourceUrls,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entry,
    const DeepCollectionEquality().hash(_pronunciations),
    const DeepCollectionEquality().hash(_interpretations),
    const DeepCollectionEquality().hash(_lexemes),
    license,
    const DeepCollectionEquality().hash(_sourceUrls),
  );

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      __$$EntryImplCopyWithImpl<_$EntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryImplToJson(this);
  }
}

abstract class _Entry implements Entry {
  const factory _Entry({
    final String entry,
    final List<Pronunciation> pronunciations,
    final List<Interpretation> interpretations,
    final List<Lexeme> lexemes,
    final License? license,
    final List<String> sourceUrls,
  }) = _$EntryImpl;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$EntryImpl.fromJson;

  @override
  String get entry;
  @override
  List<Pronunciation> get pronunciations;
  @override
  List<Interpretation> get interpretations;
  @override
  List<Lexeme> get lexemes;
  @override
  License? get license;
  @override
  List<String> get sourceUrls;

  /// Create a copy of Entry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
