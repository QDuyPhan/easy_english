// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dictionary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DictionaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDictionary,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDictionary,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDictionary,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDictionary value) getDictionary,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDictionary value)? getDictionary,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDictionary value)? getDictionary,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryEventCopyWith<$Res> {
  factory $DictionaryEventCopyWith(
    DictionaryEvent value,
    $Res Function(DictionaryEvent) then,
  ) = _$DictionaryEventCopyWithImpl<$Res, DictionaryEvent>;
}

/// @nodoc
class _$DictionaryEventCopyWithImpl<$Res, $Val extends DictionaryEvent>
    implements $DictionaryEventCopyWith<$Res> {
  _$DictionaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetDictionaryImplCopyWith<$Res> {
  factory _$$GetDictionaryImplCopyWith(
    _$GetDictionaryImpl value,
    $Res Function(_$GetDictionaryImpl) then,
  ) = __$$GetDictionaryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDictionaryImplCopyWithImpl<$Res>
    extends _$DictionaryEventCopyWithImpl<$Res, _$GetDictionaryImpl>
    implements _$$GetDictionaryImplCopyWith<$Res> {
  __$$GetDictionaryImplCopyWithImpl(
    _$GetDictionaryImpl _value,
    $Res Function(_$GetDictionaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DictionaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDictionaryImpl implements _GetDictionary {
  const _$GetDictionaryImpl();

  @override
  String toString() {
    return 'DictionaryEvent.getDictionary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDictionaryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDictionary,
  }) {
    return getDictionary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDictionary,
  }) {
    return getDictionary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDictionary,
    required TResult orElse(),
  }) {
    if (getDictionary != null) {
      return getDictionary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDictionary value) getDictionary,
  }) {
    return getDictionary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDictionary value)? getDictionary,
  }) {
    return getDictionary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDictionary value)? getDictionary,
    required TResult orElse(),
  }) {
    if (getDictionary != null) {
      return getDictionary(this);
    }
    return orElse();
  }
}

abstract class _GetDictionary implements DictionaryEvent {
  const factory _GetDictionary() = _$GetDictionaryImpl;
}

/// @nodoc
mixin _$DictionaryState {
  List<DictionaryEntity> get dictionary => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DictionaryEntity> dictionary) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DictionaryEntity> dictionary)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DictionaryEntity> dictionary)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryState value) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryState value)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryState value)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DictionaryStateCopyWith<DictionaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryStateCopyWith<$Res> {
  factory $DictionaryStateCopyWith(
    DictionaryState value,
    $Res Function(DictionaryState) then,
  ) = _$DictionaryStateCopyWithImpl<$Res, DictionaryState>;
  @useResult
  $Res call({List<DictionaryEntity> dictionary});
}

/// @nodoc
class _$DictionaryStateCopyWithImpl<$Res, $Val extends DictionaryState>
    implements $DictionaryStateCopyWith<$Res> {
  _$DictionaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dictionary = null}) {
    return _then(
      _value.copyWith(
            dictionary:
                null == dictionary
                    ? _value.dictionary
                    : dictionary // ignore: cast_nullable_to_non_nullable
                        as List<DictionaryEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DictionaryStateImplCopyWith<$Res>
    implements $DictionaryStateCopyWith<$Res> {
  factory _$$DictionaryStateImplCopyWith(
    _$DictionaryStateImpl value,
    $Res Function(_$DictionaryStateImpl) then,
  ) = __$$DictionaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DictionaryEntity> dictionary});
}

/// @nodoc
class __$$DictionaryStateImplCopyWithImpl<$Res>
    extends _$DictionaryStateCopyWithImpl<$Res, _$DictionaryStateImpl>
    implements _$$DictionaryStateImplCopyWith<$Res> {
  __$$DictionaryStateImplCopyWithImpl(
    _$DictionaryStateImpl _value,
    $Res Function(_$DictionaryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dictionary = null}) {
    return _then(
      _$DictionaryStateImpl(
        dictionary:
            null == dictionary
                ? _value._dictionary
                : dictionary // ignore: cast_nullable_to_non_nullable
                    as List<DictionaryEntity>,
      ),
    );
  }
}

/// @nodoc

class _$DictionaryStateImpl implements _DictionaryState {
  const _$DictionaryStateImpl({
    final List<DictionaryEntity> dictionary = const [],
  }) : _dictionary = dictionary;

  final List<DictionaryEntity> _dictionary;
  @override
  @JsonKey()
  List<DictionaryEntity> get dictionary {
    if (_dictionary is EqualUnmodifiableListView) return _dictionary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dictionary);
  }

  @override
  String toString() {
    return 'DictionaryState.initial(dictionary: $dictionary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DictionaryStateImpl &&
            const DeepCollectionEquality().equals(
              other._dictionary,
              _dictionary,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_dictionary),
  );

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DictionaryStateImplCopyWith<_$DictionaryStateImpl> get copyWith =>
      __$$DictionaryStateImplCopyWithImpl<_$DictionaryStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DictionaryEntity> dictionary) initial,
  }) {
    return initial(dictionary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DictionaryEntity> dictionary)? initial,
  }) {
    return initial?.call(dictionary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DictionaryEntity> dictionary)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(dictionary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DictionaryState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DictionaryState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DictionaryState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DictionaryState implements DictionaryState {
  const factory _DictionaryState({final List<DictionaryEntity> dictionary}) =
      _$DictionaryStateImpl;

  @override
  List<DictionaryEntity> get dictionary;

  /// Create a copy of DictionaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DictionaryStateImplCopyWith<_$DictionaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
