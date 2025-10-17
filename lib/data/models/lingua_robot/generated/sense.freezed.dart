// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../sense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Sense _$SenseFromJson(Map<String, dynamic> json) {
  return _Sense.fromJson(json);
}

/// @nodoc
mixin _$Sense {
  String get definition => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;

  /// Serializes this Sense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SenseCopyWith<Sense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenseCopyWith<$Res> {
  factory $SenseCopyWith(Sense value, $Res Function(Sense) then) =
      _$SenseCopyWithImpl<$Res, Sense>;
  @useResult
  $Res call({String definition, List<String> labels});
}

/// @nodoc
class _$SenseCopyWithImpl<$Res, $Val extends Sense>
    implements $SenseCopyWith<$Res> {
  _$SenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? definition = null, Object? labels = null}) {
    return _then(
      _value.copyWith(
            definition:
                null == definition
                    ? _value.definition
                    : definition // ignore: cast_nullable_to_non_nullable
                        as String,
            labels:
                null == labels
                    ? _value.labels
                    : labels // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SenseImplCopyWith<$Res> implements $SenseCopyWith<$Res> {
  factory _$$SenseImplCopyWith(
    _$SenseImpl value,
    $Res Function(_$SenseImpl) then,
  ) = __$$SenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String definition, List<String> labels});
}

/// @nodoc
class __$$SenseImplCopyWithImpl<$Res>
    extends _$SenseCopyWithImpl<$Res, _$SenseImpl>
    implements _$$SenseImplCopyWith<$Res> {
  __$$SenseImplCopyWithImpl(
    _$SenseImpl _value,
    $Res Function(_$SenseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Sense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? definition = null, Object? labels = null}) {
    return _then(
      _$SenseImpl(
        definition:
            null == definition
                ? _value.definition
                : definition // ignore: cast_nullable_to_non_nullable
                    as String,
        labels:
            null == labels
                ? _value._labels
                : labels // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SenseImpl implements _Sense {
  const _$SenseImpl({
    this.definition = '',
    final List<String> labels = const [],
  }) : _labels = labels;

  factory _$SenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SenseImplFromJson(json);

  @override
  @JsonKey()
  final String definition;
  final List<String> _labels;
  @override
  @JsonKey()
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  String toString() {
    return 'Sense(definition: $definition, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenseImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    definition,
    const DeepCollectionEquality().hash(_labels),
  );

  /// Create a copy of Sense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SenseImplCopyWith<_$SenseImpl> get copyWith =>
      __$$SenseImplCopyWithImpl<_$SenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SenseImplToJson(this);
  }
}

abstract class _Sense implements Sense {
  const factory _Sense({final String definition, final List<String> labels}) =
      _$SenseImpl;

  factory _Sense.fromJson(Map<String, dynamic> json) = _$SenseImpl.fromJson;

  @override
  String get definition;
  @override
  List<String> get labels;

  /// Create a copy of Sense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SenseImplCopyWith<_$SenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
