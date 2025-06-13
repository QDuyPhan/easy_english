// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i3;

import '../../data/models/example.dart' as _i8;
import '../../data/models/sense.dart' as _i6;
import '../../data/models/theme.dart' as _i10;
import '../../data/models/word.dart' as _i4;
import '../../data/models/word_status.dart' as _i2;
import '../../domain/entities/example_entity.dart' as _i9;
import '../../domain/entities/sense_entity.dart' as _i7;
import '../../domain/entities/theme_entity.dart' as _i11;
import '../../domain/entities/word_entity.dart' as _i5;
import '../../domain/entities/word_status_entity.dart' as _i1;

/// {@template package:easy_english/core/mapper/app_mappr.dart}
/// Available mappings:
/// - `Word` → `WordEntity`.
/// - `WordEntity` → `Word`.
/// - `Sense` → `SenseEntity`.
/// - `SenseEntity` → `Sense`.
/// - `Example` → `ExampleEntity`.
/// - `ExampleEntity` → `Example`.
/// - `WordStatus` → `WordStatusEntity`.
/// - `WordStatusEntity` → `WordStatus`.
/// - `Theme` → `ThemeEntity`.
/// - `ThemeEntity` → `Theme`.
/// - `ThemeType` → `ThemeType`.
/// {@endtemplate}
class $AppMappr implements _i3.AutoMapprInterface {
  const $AppMappr();

  Type _typeOf<T>() => T;

  List<_i3.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i4.Word>() ||
            sourceTypeOf == _typeOf<_i4.Word?>()) &&
        (targetTypeOf == _typeOf<_i5.WordEntity>() ||
            targetTypeOf == _typeOf<_i5.WordEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.WordEntity>() ||
            sourceTypeOf == _typeOf<_i5.WordEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.Word>() ||
            targetTypeOf == _typeOf<_i4.Word?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.Sense>() ||
            sourceTypeOf == _typeOf<_i6.Sense?>()) &&
        (targetTypeOf == _typeOf<_i7.SenseEntity>() ||
            targetTypeOf == _typeOf<_i7.SenseEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i7.SenseEntity>() ||
            sourceTypeOf == _typeOf<_i7.SenseEntity?>()) &&
        (targetTypeOf == _typeOf<_i6.Sense>() ||
            targetTypeOf == _typeOf<_i6.Sense?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i8.Example>() ||
            sourceTypeOf == _typeOf<_i8.Example?>()) &&
        (targetTypeOf == _typeOf<_i9.ExampleEntity>() ||
            targetTypeOf == _typeOf<_i9.ExampleEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i9.ExampleEntity>() ||
            sourceTypeOf == _typeOf<_i9.ExampleEntity?>()) &&
        (targetTypeOf == _typeOf<_i8.Example>() ||
            targetTypeOf == _typeOf<_i8.Example?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.WordStatus>() ||
            sourceTypeOf == _typeOf<_i2.WordStatus?>()) &&
        (targetTypeOf == _typeOf<_i1.WordStatusEntity>() ||
            targetTypeOf == _typeOf<_i1.WordStatusEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i1.WordStatusEntity>() ||
            sourceTypeOf == _typeOf<_i1.WordStatusEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.WordStatus>() ||
            targetTypeOf == _typeOf<_i2.WordStatus?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.Theme>() ||
            sourceTypeOf == _typeOf<_i10.Theme?>()) &&
        (targetTypeOf == _typeOf<_i11.ThemeEntity>() ||
            targetTypeOf == _typeOf<_i11.ThemeEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i11.ThemeEntity>() ||
            sourceTypeOf == _typeOf<_i11.ThemeEntity?>()) &&
        (targetTypeOf == _typeOf<_i10.Theme>() ||
            targetTypeOf == _typeOf<_i10.Theme?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i11.ThemeType>() ||
            sourceTypeOf == _typeOf<_i11.ThemeType?>()) &&
        (targetTypeOf == _typeOf<_i11.ThemeType>() ||
            targetTypeOf == _typeOf<_i11.ThemeType?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i4.Word>() ||
            sourceTypeOf == _typeOf<_i4.Word?>()) &&
        (targetTypeOf == _typeOf<_i5.WordEntity>() ||
            targetTypeOf == _typeOf<_i5.WordEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$Word_To__i5$WordEntity((model as _i4.Word?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.WordEntity>() ||
            sourceTypeOf == _typeOf<_i5.WordEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.Word>() ||
            targetTypeOf == _typeOf<_i4.Word?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$WordEntity_To__i4$Word((model as _i5.WordEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.Sense>() ||
            sourceTypeOf == _typeOf<_i6.Sense?>()) &&
        (targetTypeOf == _typeOf<_i7.SenseEntity>() ||
            targetTypeOf == _typeOf<_i7.SenseEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$Sense_To__i7$SenseEntity((model as _i6.Sense?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i7.SenseEntity>() ||
            sourceTypeOf == _typeOf<_i7.SenseEntity?>()) &&
        (targetTypeOf == _typeOf<_i6.Sense>() ||
            targetTypeOf == _typeOf<_i6.Sense?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i7$SenseEntity_To__i6$Sense((model as _i7.SenseEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i8.Example>() ||
            sourceTypeOf == _typeOf<_i8.Example?>()) &&
        (targetTypeOf == _typeOf<_i9.ExampleEntity>() ||
            targetTypeOf == _typeOf<_i9.ExampleEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i8$Example_To__i9$ExampleEntity((model as _i8.Example?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i9.ExampleEntity>() ||
            sourceTypeOf == _typeOf<_i9.ExampleEntity?>()) &&
        (targetTypeOf == _typeOf<_i8.Example>() ||
            targetTypeOf == _typeOf<_i8.Example?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i9$ExampleEntity_To__i8$Example(
          (model as _i9.ExampleEntity?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.WordStatus>() ||
            sourceTypeOf == _typeOf<_i2.WordStatus?>()) &&
        (targetTypeOf == _typeOf<_i1.WordStatusEntity>() ||
            targetTypeOf == _typeOf<_i1.WordStatusEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$WordStatus_To__i1$WordStatusEntity(
          (model as _i2.WordStatus?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i1.WordStatusEntity>() ||
            sourceTypeOf == _typeOf<_i1.WordStatusEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.WordStatus>() ||
            targetTypeOf == _typeOf<_i2.WordStatus?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i1$WordStatusEntity_To__i2$WordStatus(
          (model as _i1.WordStatusEntity?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.Theme>() ||
            sourceTypeOf == _typeOf<_i10.Theme?>()) &&
        (targetTypeOf == _typeOf<_i11.ThemeEntity>() ||
            targetTypeOf == _typeOf<_i11.ThemeEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$Theme_To__i11$ThemeEntity((model as _i10.Theme?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i11.ThemeEntity>() ||
            sourceTypeOf == _typeOf<_i11.ThemeEntity?>()) &&
        (targetTypeOf == _typeOf<_i10.Theme>() ||
            targetTypeOf == _typeOf<_i10.Theme?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i11$ThemeEntity_To__i10$Theme((model as _i11.ThemeEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i11.ThemeType>() ||
            sourceTypeOf == _typeOf<_i11.ThemeType?>()) &&
        (targetTypeOf == _typeOf<_i11.ThemeType>() ||
            targetTypeOf == _typeOf<_i11.ThemeType?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i11$ThemeType_To__i11$ThemeType((model as _i11.ThemeType?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:easy_english/core/mapper/app_mappr.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i5.WordEntity _map__i4$Word_To__i5$WordEntity(_i4.Word? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Word → WordEntity failed because Word was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Word, WordEntity> to handle null values during mapping.');
    }
    return _i5.WordEntity(
      word: model.word,
      pos: model.pos,
      phonetic: model.phonetic,
      phoneticText: model.phoneticText,
      phoneticAm: model.phoneticAm,
      phoneticAmText: model.phoneticAmText,
      senses: model.senses
          .map<_i7.SenseEntity>(
              (value) => _map__i6$Sense_To__i7$SenseEntity(value))
          .toList(),
      status: _map__i2$WordStatus_To__i1$WordStatusEntity(model.status),
      index: model.index,
      userDefinition: model.userDefinition,
    );
  }

  _i4.Word _map__i5$WordEntity_To__i4$Word(_i5.WordEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping WordEntity → Word failed because WordEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<WordEntity, Word> to handle null values during mapping.');
    }
    return _i4.Word(
      word: model.word,
      pos: model.pos,
      phonetic: model.phonetic,
      phoneticText: model.phoneticText,
      phoneticAm: model.phoneticAm,
      phoneticAmText: model.phoneticAmText,
      senses: model.senses
          .map<_i6.Sense>((value) => _map__i7$SenseEntity_To__i6$Sense(value))
          .toList(),
      status: _map__i1$WordStatusEntity_To__i2$WordStatus(model.status),
      index: model.index,
      userDefinition: model.userDefinition,
    );
  }

  _i7.SenseEntity _map__i6$Sense_To__i7$SenseEntity(_i6.Sense? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Sense → SenseEntity failed because Sense was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Sense, SenseEntity> to handle null values during mapping.');
    }
    return _i7.SenseEntity(
      definition: model.definition,
      examples: model.examples
          .map<_i9.ExampleEntity>(
              (value) => _map__i8$Example_To__i9$ExampleEntity(value))
          .toList(),
    );
  }

  _i6.Sense _map__i7$SenseEntity_To__i6$Sense(_i7.SenseEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping SenseEntity → Sense failed because SenseEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<SenseEntity, Sense> to handle null values during mapping.');
    }
    return _i6.Sense(
      definition: model.definition,
      examples: model.examples
          .map<_i8.Example>(
              (value) => _map__i9$ExampleEntity_To__i8$Example(value))
          .toList(),
    );
  }

  _i9.ExampleEntity _map__i8$Example_To__i9$ExampleEntity(_i8.Example? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Example → ExampleEntity failed because Example was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Example, ExampleEntity> to handle null values during mapping.');
    }
    return _i9.ExampleEntity(
      cf: model.cf,
      x: model.x,
    );
  }

  _i8.Example _map__i9$ExampleEntity_To__i8$Example(_i9.ExampleEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ExampleEntity → Example failed because ExampleEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ExampleEntity, Example> to handle null values during mapping.');
    }
    return _i8.Example(
      cf: model.cf,
      x: model.x,
    );
  }

  _i1.WordStatusEntity _map__i2$WordStatus_To__i1$WordStatusEntity(
      _i2.WordStatus? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping WordStatus → WordStatusEntity failed because WordStatus was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<WordStatus, WordStatusEntity> to handle null values during mapping.');
    }
    return _i1.WordStatusEntity.values.firstWhere((x) => x.name == model.name);
  }

  _i2.WordStatus _map__i1$WordStatusEntity_To__i2$WordStatus(
      _i1.WordStatusEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping WordStatusEntity → WordStatus failed because WordStatusEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<WordStatusEntity, WordStatus> to handle null values during mapping.');
    }
    return _i2.WordStatus.values.firstWhere((x) => x.name == model.name);
  }

  _i11.ThemeEntity _map__i10$Theme_To__i11$ThemeEntity(_i10.Theme? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Theme → ThemeEntity failed because Theme was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Theme, ThemeEntity> to handle null values during mapping.');
    }
    return _i11.ThemeEntity(themeType: model.themeType);
  }

  _i10.Theme _map__i11$ThemeEntity_To__i10$Theme(_i11.ThemeEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ThemeEntity → Theme failed because ThemeEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ThemeEntity, Theme> to handle null values during mapping.');
    }
    return _i10.Theme(themeType: model.themeType);
  }

  _i11.ThemeType _map__i11$ThemeType_To__i11$ThemeType(_i11.ThemeType? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ThemeType → ThemeType failed because ThemeType was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ThemeType, ThemeType> to handle null values during mapping.');
    }
    return _i11.ThemeType.values.firstWhere((x) => x.name == model.name);
  }
}
