// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTheme,
    required TResult Function() toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTheme,
    TResult? Function()? toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTheme value) getTheme,
    required TResult Function(_ToggleTheme value) toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTheme value)? getTheme,
    TResult? Function(_ToggleTheme value)? toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTheme value)? getTheme,
    TResult Function(_ToggleTheme value)? toggleTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetThemeImplCopyWith<$Res> {
  factory _$$GetThemeImplCopyWith(
          _$GetThemeImpl value, $Res Function(_$GetThemeImpl) then) =
      __$$GetThemeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetThemeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$GetThemeImpl>
    implements _$$GetThemeImplCopyWith<$Res> {
  __$$GetThemeImplCopyWithImpl(
      _$GetThemeImpl _value, $Res Function(_$GetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetThemeImpl implements _GetTheme {
  const _$GetThemeImpl();

  @override
  String toString() {
    return 'ThemeEvent.getTheme()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetThemeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTheme,
    required TResult Function() toggleTheme,
  }) {
    return getTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTheme,
    TResult? Function()? toggleTheme,
  }) {
    return getTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) {
    if (getTheme != null) {
      return getTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTheme value) getTheme,
    required TResult Function(_ToggleTheme value) toggleTheme,
  }) {
    return getTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTheme value)? getTheme,
    TResult? Function(_ToggleTheme value)? toggleTheme,
  }) {
    return getTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTheme value)? getTheme,
    TResult Function(_ToggleTheme value)? toggleTheme,
    required TResult orElse(),
  }) {
    if (getTheme != null) {
      return getTheme(this);
    }
    return orElse();
  }
}

abstract class _GetTheme implements ThemeEvent {
  const factory _GetTheme() = _$GetThemeImpl;
}

/// @nodoc
abstract class _$$ToggleThemeImplCopyWith<$Res> {
  factory _$$ToggleThemeImplCopyWith(
          _$ToggleThemeImpl value, $Res Function(_$ToggleThemeImpl) then) =
      __$$ToggleThemeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleThemeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ToggleThemeImpl>
    implements _$$ToggleThemeImplCopyWith<$Res> {
  __$$ToggleThemeImplCopyWithImpl(
      _$ToggleThemeImpl _value, $Res Function(_$ToggleThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleThemeImpl implements _ToggleTheme {
  const _$ToggleThemeImpl();

  @override
  String toString() {
    return 'ThemeEvent.toggleTheme()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleThemeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTheme,
    required TResult Function() toggleTheme,
  }) {
    return toggleTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTheme,
    TResult? Function()? toggleTheme,
  }) {
    return toggleTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) {
    if (toggleTheme != null) {
      return toggleTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTheme value) getTheme,
    required TResult Function(_ToggleTheme value) toggleTheme,
  }) {
    return toggleTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTheme value)? getTheme,
    TResult? Function(_ToggleTheme value)? toggleTheme,
  }) {
    return toggleTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTheme value)? getTheme,
    TResult Function(_ToggleTheme value)? toggleTheme,
    required TResult orElse(),
  }) {
    if (toggleTheme != null) {
      return toggleTheme(this);
    }
    return orElse();
  }
}

abstract class _ToggleTheme implements ThemeEvent {
  const factory _ToggleTheme() = _$ToggleThemeImpl;
}

/// @nodoc
mixin _$ThemeState {
  ThemeEntity? get themeEntity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeEntity? themeEntity) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeEntity? themeEntity)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeEntity? themeEntity)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({ThemeEntity? themeEntity});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeEntity = freezed,
  }) {
    return _then(_value.copyWith(
      themeEntity: freezed == themeEntity
          ? _value.themeEntity
          : themeEntity // ignore: cast_nullable_to_non_nullable
              as ThemeEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeEntity? themeEntity});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeEntity = freezed,
  }) {
    return _then(_$InitialImpl(
      themeEntity: freezed == themeEntity
          ? _value.themeEntity
          : themeEntity // ignore: cast_nullable_to_non_nullable
              as ThemeEntity?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.themeEntity});

  @override
  final ThemeEntity? themeEntity;

  @override
  String toString() {
    return 'ThemeState.initial(themeEntity: $themeEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.themeEntity, themeEntity) ||
                other.themeEntity == themeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeEntity);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeEntity? themeEntity) initial,
  }) {
    return initial(themeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeEntity? themeEntity)? initial,
  }) {
    return initial?.call(themeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeEntity? themeEntity)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(themeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ThemeState {
  const factory _Initial({final ThemeEntity? themeEntity}) = _$InitialImpl;

  @override
  ThemeEntity? get themeEntity;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
