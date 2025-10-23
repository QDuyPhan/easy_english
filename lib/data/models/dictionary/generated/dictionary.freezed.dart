// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dictionary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Dictionary _$DictionaryFromJson(Map<String, dynamic> json) {
  return _Dictionary.fromJson(json);
}

/// @nodoc
mixin _$Dictionary {
  String? get word => throw _privateConstructorUsedError;
  String? get phonetic => throw _privateConstructorUsedError;
  List<Phonetic>? get phonetics => throw _privateConstructorUsedError;
  List<Meaning>? get meanings => throw _privateConstructorUsedError;
  License? get license => throw _privateConstructorUsedError;
  List<String>? get sourceUrls => throw _privateConstructorUsedError;

  /// Serializes this Dictionary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DictionaryCopyWith<Dictionary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryCopyWith<$Res> {
  factory $DictionaryCopyWith(
    Dictionary value,
    $Res Function(Dictionary) then,
  ) = _$DictionaryCopyWithImpl<$Res, Dictionary>;
  @useResult
  $Res call({
    String? word,
    String? phonetic,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<String>? sourceUrls,
  });

  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$DictionaryCopyWithImpl<$Res, $Val extends Dictionary>
    implements $DictionaryCopyWith<$Res> {
  _$DictionaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetic = freezed,
    Object? phonetics = freezed,
    Object? meanings = freezed,
    Object? license = freezed,
    Object? sourceUrls = freezed,
  }) {
    return _then(
      _value.copyWith(
            word:
                freezed == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String?,
            phonetic:
                freezed == phonetic
                    ? _value.phonetic
                    : phonetic // ignore: cast_nullable_to_non_nullable
                        as String?,
            phonetics:
                freezed == phonetics
                    ? _value.phonetics
                    : phonetics // ignore: cast_nullable_to_non_nullable
                        as List<Phonetic>?,
            meanings:
                freezed == meanings
                    ? _value.meanings
                    : meanings // ignore: cast_nullable_to_non_nullable
                        as List<Meaning>?,
            license:
                freezed == license
                    ? _value.license
                    : license // ignore: cast_nullable_to_non_nullable
                        as License?,
            sourceUrls:
                freezed == sourceUrls
                    ? _value.sourceUrls
                    : sourceUrls // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Dictionary
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
abstract class _$$DictionaryImplCopyWith<$Res>
    implements $DictionaryCopyWith<$Res> {
  factory _$$DictionaryImplCopyWith(
    _$DictionaryImpl value,
    $Res Function(_$DictionaryImpl) then,
  ) = __$$DictionaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? word,
    String? phonetic,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<String>? sourceUrls,
  });

  @override
  $LicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$DictionaryImplCopyWithImpl<$Res>
    extends _$DictionaryCopyWithImpl<$Res, _$DictionaryImpl>
    implements _$$DictionaryImplCopyWith<$Res> {
  __$$DictionaryImplCopyWithImpl(
    _$DictionaryImpl _value,
    $Res Function(_$DictionaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetic = freezed,
    Object? phonetics = freezed,
    Object? meanings = freezed,
    Object? license = freezed,
    Object? sourceUrls = freezed,
  }) {
    return _then(
      _$DictionaryImpl(
        word:
            freezed == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String?,
        phonetic:
            freezed == phonetic
                ? _value.phonetic
                : phonetic // ignore: cast_nullable_to_non_nullable
                    as String?,
        phonetics:
            freezed == phonetics
                ? _value._phonetics
                : phonetics // ignore: cast_nullable_to_non_nullable
                    as List<Phonetic>?,
        meanings:
            freezed == meanings
                ? _value._meanings
                : meanings // ignore: cast_nullable_to_non_nullable
                    as List<Meaning>?,
        license:
            freezed == license
                ? _value.license
                : license // ignore: cast_nullable_to_non_nullable
                    as License?,
        sourceUrls:
            freezed == sourceUrls
                ? _value._sourceUrls
                : sourceUrls // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DictionaryImpl implements _Dictionary {
  const _$DictionaryImpl({
    this.word,
    this.phonetic,
    final List<Phonetic>? phonetics,
    final List<Meaning>? meanings,
    this.license,
    final List<String>? sourceUrls,
  }) : _phonetics = phonetics,
       _meanings = meanings,
       _sourceUrls = sourceUrls;

  factory _$DictionaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DictionaryImplFromJson(json);

  @override
  final String? word;
  @override
  final String? phonetic;
  final List<Phonetic>? _phonetics;
  @override
  List<Phonetic>? get phonetics {
    final value = _phonetics;
    if (value == null) return null;
    if (_phonetics is EqualUnmodifiableListView) return _phonetics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Meaning>? _meanings;
  @override
  List<Meaning>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final License? license;
  final List<String>? _sourceUrls;
  @override
  List<String>? get sourceUrls {
    final value = _sourceUrls;
    if (value == null) return null;
    if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Dictionary(word: $word, phonetic: $phonetic, phonetics: $phonetics, meanings: $meanings, license: $license, sourceUrls: $sourceUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.phonetic, phonetic) ||
                other.phonetic == phonetic) &&
            const DeepCollectionEquality().equals(
              other._phonetics,
              _phonetics,
            ) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings) &&
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
    word,
    phonetic,
    const DeepCollectionEquality().hash(_phonetics),
    const DeepCollectionEquality().hash(_meanings),
    license,
    const DeepCollectionEquality().hash(_sourceUrls),
  );

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryImplCopyWith<_$DictionaryImpl> get copyWith =>
      __$$DictionaryImplCopyWithImpl<_$DictionaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DictionaryImplToJson(this);
  }
}

abstract class _Dictionary implements Dictionary {
  const factory _Dictionary({
    final String? word,
    final String? phonetic,
    final List<Phonetic>? phonetics,
    final List<Meaning>? meanings,
    final License? license,
    final List<String>? sourceUrls,
  }) = _$DictionaryImpl;

  factory _Dictionary.fromJson(Map<String, dynamic> json) =
      _$DictionaryImpl.fromJson;

  @override
  String? get word;
  @override
  String? get phonetic;
  @override
  List<Phonetic>? get phonetics;
  @override
  List<Meaning>? get meanings;
  @override
  License? get license;
  @override
  List<String>? get sourceUrls;

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DictionaryImplCopyWith<_$DictionaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
