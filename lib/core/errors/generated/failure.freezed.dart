// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(GeneralFailure value) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(GeneralFailure value)? general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
  }) {
    return _then(_$ServerFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl(
      {this.message = 'Server error occurred', this.statusCode});

  @override
  @JsonKey()
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'Failure.server(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) general,
  }) {
    return server(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? general,
  }) {
    return server?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? general,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(GeneralFailure value)? general,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure({final String message, final int? statusCode}) =
      _$ServerFailureImpl;

  @override
  String get message;
  int? get statusCode;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({this.message = 'No internet connection'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) general,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? general,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? general,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(GeneralFailure value)? general,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure({final String message}) = _$NetworkFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(_$NotFoundFailureImpl value,
          $Res Function(_$NotFoundFailureImpl) then) =
      __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
      _$NotFoundFailureImpl _value, $Res Function(_$NotFoundFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundFailureImpl implements NotFoundFailure {
  const _$NotFoundFailureImpl({this.message = 'Data not found'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) general,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? general,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? general,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(GeneralFailure value)? general,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure implements Failure {
  const factory NotFoundFailure({final String message}) = _$NotFoundFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneralFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$GeneralFailureImplCopyWith(_$GeneralFailureImpl value,
          $Res Function(_$GeneralFailureImpl) then) =
      __$$GeneralFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeneralFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GeneralFailureImpl>
    implements _$$GeneralFailureImplCopyWith<$Res> {
  __$$GeneralFailureImplCopyWithImpl(
      _$GeneralFailureImpl _value, $Res Function(_$GeneralFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GeneralFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneralFailureImpl implements GeneralFailure {
  const _$GeneralFailureImpl({this.message = 'An unexpected error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.general(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      __$$GeneralFailureImplCopyWithImpl<_$GeneralFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) general,
  }) {
    return general(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? general,
  }) {
    return general?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(GeneralFailure value)? general,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class GeneralFailure implements Failure {
  const factory GeneralFailure({final String message}) = _$GeneralFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
