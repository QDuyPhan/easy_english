enum ThemeType {
  light,
  dark;

  String get value => name;

  static ThemeType fromValue(String value) {
    return ThemeType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeType.light,
    );
  }
}
