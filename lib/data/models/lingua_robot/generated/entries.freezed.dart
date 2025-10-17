// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../entries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Entries _$EntriesFromJson(Map<String, dynamic> json) {
  return _Entries.fromJson(json);
}

/// @nodoc
mixin _$Entries {
  List<Entry> get entry => throw _privateConstructorUsedError;

  /// Serializes this Entries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Entries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntriesCopyWith<Entries> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntriesCopyWith<$Res> {
  factory $EntriesCopyWith(Entries value, $Res Function(Entries) then) =
      _$EntriesCopyWithImpl<$Res, Entries>;
  @useResult
  $Res call({List<Entry> entry});
}

/// @nodoc
class _$EntriesCopyWithImpl<$Res, $Val extends Entries>
    implements $EntriesCopyWith<$Res> {
  _$EntriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Entries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _value.copyWith(
            entry:
                null == entry
                    ? _value.entry
                    : entry // ignore: cast_nullable_to_non_nullable
                        as List<Entry>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EntriesImplCopyWith<$Res> implements $EntriesCopyWith<$Res> {
  factory _$$EntriesImplCopyWith(
    _$EntriesImpl value,
    $Res Function(_$EntriesImpl) then,
  ) = __$$EntriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Entry> entry});
}

/// @nodoc
class __$$EntriesImplCopyWithImpl<$Res>
    extends _$EntriesCopyWithImpl<$Res, _$EntriesImpl>
    implements _$$EntriesImplCopyWith<$Res> {
  __$$EntriesImplCopyWithImpl(
    _$EntriesImpl _value,
    $Res Function(_$EntriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Entries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entry = null}) {
    return _then(
      _$EntriesImpl(
        entry:
            null == entry
                ? _value._entry
                : entry // ignore: cast_nullable_to_non_nullable
                    as List<Entry>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EntriesImpl implements _Entries {
  const _$EntriesImpl({final List<Entry> entry = const []}) : _entry = entry;

  factory _$EntriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntriesImplFromJson(json);

  final List<Entry> _entry;
  @override
  @JsonKey()
  List<Entry> get entry {
    if (_entry is EqualUnmodifiableListView) return _entry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entry);
  }

  @override
  String toString() {
    return 'Entries(entry: $entry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntriesImpl &&
            const DeepCollectionEquality().equals(other._entry, _entry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entry));

  /// Create a copy of Entries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntriesImplCopyWith<_$EntriesImpl> get copyWith =>
      __$$EntriesImplCopyWithImpl<_$EntriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntriesImplToJson(this);
  }
}

abstract class _Entries implements Entries {
  const factory _Entries({final List<Entry> entry}) = _$EntriesImpl;

  factory _Entries.fromJson(Map<String, dynamic> json) = _$EntriesImpl.fromJson;

  @override
  List<Entry> get entry;

  /// Create a copy of Entries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntriesImplCopyWith<_$EntriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
