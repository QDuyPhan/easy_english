import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const Color boxColor = Color(0xFFDBF6FF);

  // POS badge colors (for vocabulary app)
  static const Map<String, Color> posBadgeColors = {
    'noun': Color(0xFF42A5F5), // Blue for nouns
    'verb': Color(0xFFE57373), // Red for verbs
    'adjective': Color(0xFF66BB6A), // Green for adjectives
    'adverb': Color(0xFFFFB300), // Yellow for adverbs
  };

  static const Color strongBlue = Color(0xFF005F99); // Dark Blue
  static const Color jungleGreen = Color(0xFF00796B); // Teal dark
  static const Color vividOrange = Color(0xFFFF6F00); // Bright but dark orange
  static const Color darkRose = Color(0xFF9C3F5C); // Deeper dusty rose
  static const Color indigo = Color(0xFF3F51B5); // Indigo
  static const Color mustard = Color(0xFFB28900); // Mustard deep
  static const Color forestGreen = Color(0xFF2E7D32); // Forest green
  static const Color burntCoral = Color(0xFFD1495B); // Coral strong
  static const Color steelBlue = Color(0xFF4682B4); // Steel blue
  static const Color denim = Color(0xFF3B5998); // Facebook-like blue
  static const Color clay = Color(0xFF8D6E63); // Brown-gray
  static const Color olive = Color(0xFF808000); // Olive green
  static const Color deepCoral = Color(0xFFE75454); // Deep coral
  static const Color teal = Color(0xFF00796B); // Reused deep teal
  static const Color amber = Color(0xFFFFA000); // Amber strong
  static const Color eggplant = Color(0xFF6A1B9A); // Muted purple
  static const Color pine = Color(0xFF2C6E49); // Dark green
  static const Color darkCantaloupe = Color(0xFFCC6B49); // Deep cantaloupe
  static List<Color> listColor = [
    strongBlue,
    jungleGreen,
    vividOrange,
    darkRose,
    indigo,
    mustard,
    forestGreen,
    burntCoral,
    steelBlue,
    denim,
    clay,
    olive,
    deepCoral,
    teal,
    amber,
    eggplant,
    pine,
    darkCantaloupe,
  ];

  // Light Theme
  static const Color lightPrimary = Color(0xFF2979FF);
  static const Color lightOnPrimary = Colors.white;
  static const Color lightPrimaryContainer = Color(0xFFE3F2FD);
  static const Color lightOnPrimaryContainer = Color(0xFF0D47A1);
  static const Color lightSecondary = Color(0xFFFFA000);
  static const Color lightOnSecondary = Color(0xFF212121);
  static const Color lightBackground = Colors.white;
  static const Color lightOnBackground = Color(0xFF212121);
  static const Color lightSurface = Color(0xFFFAFAFA);
  static const Color lightOnSurface = Color(0xFF212121);

  // Dark Theme
  static const Color darkPrimary = Color(0xFF82B1FF);
  static const Color darkOnPrimary = Colors.black;
  static const Color darkPrimaryContainer = Color(0xFF263238);
  static const Color darkOnPrimaryContainer = Color(0xFFE3F2FD);
  static const Color darkSecondary = Color(0xFFFFB74D);
  static const Color darkOnSecondary = Colors.black;
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkOnBackground = Colors.white;
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Colors.white;

  // Shared
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Colors.white;
}
