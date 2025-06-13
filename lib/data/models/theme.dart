import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/theme_entity.dart';


class Theme {
  final ThemeType themeType;

  const Theme({this.themeType = ThemeType.light});
}
