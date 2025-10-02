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

/// @nodoc
mixin _$Dictionary {
  String get topic => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

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
  $Res call({String topic, List<String> category, String image});
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
    Object? topic = null,
    Object? category = null,
    Object? image = null,
  }) {
    return _then(
      _value.copyWith(
            topic:
                null == topic
                    ? _value.topic
                    : topic // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
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
  $Res call({String topic, List<String> category, String image});
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
    Object? topic = null,
    Object? category = null,
    Object? image = null,
  }) {
    return _then(
      _$DictionaryImpl(
        topic:
            null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value._category
                : category // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$DictionaryImpl implements _Dictionary {
  const _$DictionaryImpl({
    required this.topic,
    required final List<String> category,
    required this.image,
  }) : _category = category;

  @override
  final String topic;
  final List<String> _category;
  @override
  List<String> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  final String image;

  @override
  String toString() {
    return 'Dictionary(topic: $topic, category: $category, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    topic,
    const DeepCollectionEquality().hash(_category),
    image,
  );

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryImplCopyWith<_$DictionaryImpl> get copyWith =>
      __$$DictionaryImplCopyWithImpl<_$DictionaryImpl>(this, _$identity);
}

abstract class _Dictionary implements Dictionary {
  const factory _Dictionary({
    required final String topic,
    required final List<String> category,
    required final String image,
  }) = _$DictionaryImpl;

  @override
  String get topic;
  @override
  List<String> get category;
  @override
  String get image;

  /// Create a copy of Dictionary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DictionaryImplCopyWith<_$DictionaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
