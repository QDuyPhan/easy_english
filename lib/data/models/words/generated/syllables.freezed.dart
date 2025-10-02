// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../syllables.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Syllables _$SyllablesFromJson(Map<String, dynamic> json) {
  return _Syllables.fromJson(json);
}

/// @nodoc
mixin _$Syllables {
  int? get count => throw _privateConstructorUsedError;
  List<String>? get list => throw _privateConstructorUsedError;

  /// Serializes this Syllables to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Syllables
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyllablesCopyWith<Syllables> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyllablesCopyWith<$Res> {
  factory $SyllablesCopyWith(Syllables value, $Res Function(Syllables) then) =
      _$SyllablesCopyWithImpl<$Res, Syllables>;
  @useResult
  $Res call({int? count, List<String>? list});
}

/// @nodoc
class _$SyllablesCopyWithImpl<$Res, $Val extends Syllables>
    implements $SyllablesCopyWith<$Res> {
  _$SyllablesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Syllables
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? count = freezed, Object? list = freezed}) {
    return _then(
      _value.copyWith(
            count:
                freezed == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int?,
            list:
                freezed == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SyllablesImplCopyWith<$Res>
    implements $SyllablesCopyWith<$Res> {
  factory _$$SyllablesImplCopyWith(
    _$SyllablesImpl value,
    $Res Function(_$SyllablesImpl) then,
  ) = __$$SyllablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<String>? list});
}

/// @nodoc
class __$$SyllablesImplCopyWithImpl<$Res>
    extends _$SyllablesCopyWithImpl<$Res, _$SyllablesImpl>
    implements _$$SyllablesImplCopyWith<$Res> {
  __$$SyllablesImplCopyWithImpl(
    _$SyllablesImpl _value,
    $Res Function(_$SyllablesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Syllables
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? count = freezed, Object? list = freezed}) {
    return _then(
      _$SyllablesImpl(
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
        list:
            freezed == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyllablesImpl implements _Syllables {
  const _$SyllablesImpl({this.count = 0, final List<String>? list = const []})
    : _list = list;

  factory _$SyllablesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyllablesImplFromJson(json);

  @override
  @JsonKey()
  final int? count;
  final List<String>? _list;
  @override
  @JsonKey()
  List<String>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Syllables(count: $count, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyllablesImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    count,
    const DeepCollectionEquality().hash(_list),
  );

  /// Create a copy of Syllables
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyllablesImplCopyWith<_$SyllablesImpl> get copyWith =>
      __$$SyllablesImplCopyWithImpl<_$SyllablesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyllablesImplToJson(this);
  }
}

abstract class _Syllables implements Syllables {
  const factory _Syllables({final int? count, final List<String>? list}) =
      _$SyllablesImpl;

  factory _Syllables.fromJson(Map<String, dynamic> json) =
      _$SyllablesImpl.fromJson;

  @override
  int? get count;
  @override
  List<String>? get list;

  /// Create a copy of Syllables
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyllablesImplCopyWith<_$SyllablesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
