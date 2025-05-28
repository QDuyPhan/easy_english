// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../settings_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingsSnapshot _$SettingsSnapshotFromJson(Map<String, dynamic> json) {
  return _SettingsSnapshot.fromJson(json);
}

/// @nodoc
mixin _$SettingsSnapshot {
  @HiveField(0)
  int get seek => throw _privateConstructorUsedError;
  @HiveField(1)
  int get themeMode => throw _privateConstructorUsedError;

  /// Serializes this SettingsSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsSnapshotCopyWith<SettingsSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsSnapshotCopyWith<$Res> {
  factory $SettingsSnapshotCopyWith(
          SettingsSnapshot value, $Res Function(SettingsSnapshot) then) =
      _$SettingsSnapshotCopyWithImpl<$Res, SettingsSnapshot>;
  @useResult
  $Res call({@HiveField(0) int seek, @HiveField(1) int themeMode});
}

/// @nodoc
class _$SettingsSnapshotCopyWithImpl<$Res, $Val extends SettingsSnapshot>
    implements $SettingsSnapshotCopyWith<$Res> {
  _$SettingsSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seek = null,
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      seek: null == seek
          ? _value.seek
          : seek // ignore: cast_nullable_to_non_nullable
              as int,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsSnapshotImplCopyWith<$Res>
    implements $SettingsSnapshotCopyWith<$Res> {
  factory _$$SettingsSnapshotImplCopyWith(_$SettingsSnapshotImpl value,
          $Res Function(_$SettingsSnapshotImpl) then) =
      __$$SettingsSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int seek, @HiveField(1) int themeMode});
}

/// @nodoc
class __$$SettingsSnapshotImplCopyWithImpl<$Res>
    extends _$SettingsSnapshotCopyWithImpl<$Res, _$SettingsSnapshotImpl>
    implements _$$SettingsSnapshotImplCopyWith<$Res> {
  __$$SettingsSnapshotImplCopyWithImpl(_$SettingsSnapshotImpl _value,
      $Res Function(_$SettingsSnapshotImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seek = null,
    Object? themeMode = null,
  }) {
    return _then(_$SettingsSnapshotImpl(
      seek: null == seek
          ? _value.seek
          : seek // ignore: cast_nullable_to_non_nullable
              as int,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsSnapshotImpl implements _SettingsSnapshot {
  const _$SettingsSnapshotImpl(
      {@HiveField(0) this.seek = 0X2196F3, @HiveField(1) this.themeMode = 0});

  factory _$SettingsSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsSnapshotImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final int seek;
  @override
  @JsonKey()
  @HiveField(1)
  final int themeMode;

  @override
  String toString() {
    return 'SettingsSnapshot(seek: $seek, themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsSnapshotImpl &&
            (identical(other.seek, seek) || other.seek == seek) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seek, themeMode);

  /// Create a copy of SettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsSnapshotImplCopyWith<_$SettingsSnapshotImpl> get copyWith =>
      __$$SettingsSnapshotImplCopyWithImpl<_$SettingsSnapshotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsSnapshotImplToJson(
      this,
    );
  }
}

abstract class _SettingsSnapshot implements SettingsSnapshot {
  const factory _SettingsSnapshot(
      {@HiveField(0) final int seek,
      @HiveField(1) final int themeMode}) = _$SettingsSnapshotImpl;

  factory _SettingsSnapshot.fromJson(Map<String, dynamic> json) =
      _$SettingsSnapshotImpl.fromJson;

  @override
  @HiveField(0)
  int get seek;
  @override
  @HiveField(1)
  int get themeMode;

  /// Create a copy of SettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsSnapshotImplCopyWith<_$SettingsSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
