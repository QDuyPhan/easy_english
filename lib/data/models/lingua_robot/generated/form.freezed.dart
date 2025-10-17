// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Form _$FormFromJson(Map<String, dynamic> json) {
  return _Form.fromJson(json);
}

/// @nodoc
mixin _$Form {
  String get form => throw _privateConstructorUsedError;
  List<Grammar> get grammar => throw _privateConstructorUsedError;

  /// Serializes this Form to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Form
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormCopyWith<Form> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormCopyWith<$Res> {
  factory $FormCopyWith(Form value, $Res Function(Form) then) =
      _$FormCopyWithImpl<$Res, Form>;
  @useResult
  $Res call({String form, List<Grammar> grammar});
}

/// @nodoc
class _$FormCopyWithImpl<$Res, $Val extends Form>
    implements $FormCopyWith<$Res> {
  _$FormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Form
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? form = null, Object? grammar = null}) {
    return _then(
      _value.copyWith(
            form:
                null == form
                    ? _value.form
                    : form // ignore: cast_nullable_to_non_nullable
                        as String,
            grammar:
                null == grammar
                    ? _value.grammar
                    : grammar // ignore: cast_nullable_to_non_nullable
                        as List<Grammar>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormImplCopyWith<$Res> implements $FormCopyWith<$Res> {
  factory _$$FormImplCopyWith(
    _$FormImpl value,
    $Res Function(_$FormImpl) then,
  ) = __$$FormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String form, List<Grammar> grammar});
}

/// @nodoc
class __$$FormImplCopyWithImpl<$Res>
    extends _$FormCopyWithImpl<$Res, _$FormImpl>
    implements _$$FormImplCopyWith<$Res> {
  __$$FormImplCopyWithImpl(_$FormImpl _value, $Res Function(_$FormImpl) _then)
    : super(_value, _then);

  /// Create a copy of Form
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? form = null, Object? grammar = null}) {
    return _then(
      _$FormImpl(
        form:
            null == form
                ? _value.form
                : form // ignore: cast_nullable_to_non_nullable
                    as String,
        grammar:
            null == grammar
                ? _value._grammar
                : grammar // ignore: cast_nullable_to_non_nullable
                    as List<Grammar>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormImpl implements _Form {
  const _$FormImpl({this.form = '', final List<Grammar> grammar = const []})
    : _grammar = grammar;

  factory _$FormImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormImplFromJson(json);

  @override
  @JsonKey()
  final String form;
  final List<Grammar> _grammar;
  @override
  @JsonKey()
  List<Grammar> get grammar {
    if (_grammar is EqualUnmodifiableListView) return _grammar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grammar);
  }

  @override
  String toString() {
    return 'Form(form: $form, grammar: $grammar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormImpl &&
            (identical(other.form, form) || other.form == form) &&
            const DeepCollectionEquality().equals(other._grammar, _grammar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    form,
    const DeepCollectionEquality().hash(_grammar),
  );

  /// Create a copy of Form
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      __$$FormImplCopyWithImpl<_$FormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormImplToJson(this);
  }
}

abstract class _Form implements Form {
  const factory _Form({final String form, final List<Grammar> grammar}) =
      _$FormImpl;

  factory _Form.fromJson(Map<String, dynamic> json) = _$FormImpl.fromJson;

  @override
  String get form;
  @override
  List<Grammar> get grammar;

  /// Create a copy of Form
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormImplCopyWith<_$FormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
