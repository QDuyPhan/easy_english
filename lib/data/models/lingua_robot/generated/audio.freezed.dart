// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return _Audio.fromJson(json);
}

/// @nodoc
mixin _$Audio {
  String get url =>
      throw _privateConstructorUsedError; // @Default(null) License license,
  String get sourceUrl => throw _privateConstructorUsedError;

  /// Serializes this Audio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioCopyWith<Audio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCopyWith<$Res> {
  factory $AudioCopyWith(Audio value, $Res Function(Audio) then) =
      _$AudioCopyWithImpl<$Res, Audio>;
  @useResult
  $Res call({String url, String sourceUrl});
}

/// @nodoc
class _$AudioCopyWithImpl<$Res, $Val extends Audio>
    implements $AudioCopyWith<$Res> {
  _$AudioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? sourceUrl = null}) {
    return _then(
      _value.copyWith(
            url:
                null == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String,
            sourceUrl:
                null == sourceUrl
                    ? _value.sourceUrl
                    : sourceUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AudioImplCopyWith<$Res> implements $AudioCopyWith<$Res> {
  factory _$$AudioImplCopyWith(
    _$AudioImpl value,
    $Res Function(_$AudioImpl) then,
  ) = __$$AudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String sourceUrl});
}

/// @nodoc
class __$$AudioImplCopyWithImpl<$Res>
    extends _$AudioCopyWithImpl<$Res, _$AudioImpl>
    implements _$$AudioImplCopyWith<$Res> {
  __$$AudioImplCopyWithImpl(
    _$AudioImpl _value,
    $Res Function(_$AudioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? sourceUrl = null}) {
    return _then(
      _$AudioImpl(
        url:
            null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String,
        sourceUrl:
            null == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioImpl implements _Audio {
  const _$AudioImpl({this.url = '', this.sourceUrl = ''});

  factory _$AudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioImplFromJson(json);

  @override
  @JsonKey()
  final String url;
  // @Default(null) License license,
  @override
  @JsonKey()
  final String sourceUrl;

  @override
  String toString() {
    return 'Audio(url: $url, sourceUrl: $sourceUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, sourceUrl);

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      __$$AudioImplCopyWithImpl<_$AudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioImplToJson(this);
  }
}

abstract class _Audio implements Audio {
  const factory _Audio({final String url, final String sourceUrl}) =
      _$AudioImpl;

  factory _Audio.fromJson(Map<String, dynamic> json) = _$AudioImpl.fromJson;

  @override
  String get url; // @Default(null) License license,
  @override
  String get sourceUrl;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
