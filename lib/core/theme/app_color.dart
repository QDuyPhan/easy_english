import 'dart:ui';

class AppColor {
  const AppColor._();

  //Primary Color
  static const Color primary100 = Color(0xFF0074CE);
  static const Color primary80 = Color(0xFF0693F1);
  static const Color primary60 = Color(0xFF3DB2FF);
  static const Color primary40 = Color(0xFFB8E1FF);
  static const Color primary20 = Color(0xFFEFF8FF);

  //Secondary Color
  static const Color secondary100 = Color(0xFFFFC107);
  static const Color secondary80 = Color(0xFFFFD899);
  static const Color secondary60 = Color(0xFFFFE5BB);
  static const Color secondary40 = Color(0xFFFFF2DD);
  static const Color secondary20 = Color(0xFFFFF9EF);

  //Base Color
  static const Color black100 = Color(0xFF2C3131);
  static const Color black80 = Color(0xFF626262);
  static const Color black60 = Color(0xFFA9A9A9);
  static const Color black40 = Color(0xFFCACACA);
  static const Color black20 = Color(0xFFE9E9E9);
  static const Color black0 = Color(0xFFFFFFFF);

  //Accent Color
  static const Color success100 = Color(0xFF3F845F);
  static const Color success80 = Color(0xFF659D7F);
  static const Color success60 = Color(0xFF8CB59F);
  static const Color success40 = Color(0xFFB2CEBF);
  static const Color success20 = Color(0xFFD9E6DF);

  static const Color warning100 = Color(0xFFE4C65B);
  static const Color warning80 = Color(0xFFE9D17C);
  static const Color warning60 = Color(0xFFEFDD9D);
  static const Color warning40 = Color(0xFFF4E8BD);
  static const Color warning20 = Color(0xFFFAF4DE);

  static const Color error100 = Color(0xFFE25C5C);
  static const Color error80 = Color(0xFFE87D7D);
  static const Color error60 = Color(0xFFEE9D9D);
  static const Color error40 = Color(0xFFF3BEBE);
  static const Color error20 = Color(0xFFF9DEDE);

  static const Color info100 = Color(0xFF2685CA);
  static const Color info80 = Color(0xFF519DD5);
  static const Color info60 = Color(0xFF7DB6DF);
  static const Color info40 = Color(0xFFA8CEEA);
  static const Color info20 = Color(0xFFD4E7F4);

  static const Color boxColor = Color(0xFFDBF6FF);

  // POS badge colors (for vocabulary app)
  static const Map<String, Color> posBadgeColors = {
    'noun': Color(0xFF42A5F5), // Blue for nouns
    'verb': Color(0xFFE57373), // Red for verbs
    'adjective': Color(0xFF66BB6A), // Green for adjectives
    'adverb': Color(0xFFFFB300), // Yellow for adverbs
  };

  static const Color purple = Color(0xFFA439FF);
  static const Color lightGreen = Color(0xFFCEEBC7);
  static const Color lightBlue = Color(0xFFB2E5FF);
  static const Color lightViolet = Color(0xFFEFCCFE);
  static const Color lightPink = Color(0xFFFFD6E4);
  static const Color blackGray = Color(0xFF524D54);
  static const Color softCoral = Color(0xFFFFB5A7);
  static const Color babyBlue = Color(0xFFD0F4FF);
  static const Color mintGreen = Color(0xFFD3F8E2);
  static const Color palePeach = Color(0xFFFFD8BE);
  static const Color lavenderMist = Color(0xFFD7C4F0);
  static const Color skyGray = Color(0xFFC9D6DF);
  static const Color lemonCream = Color(0xFFFFF9B0);
  static const Color blushRose = Color(0xFFF7C1C0);
  static const Color softLilac = Color(0xFFE4D0F4);
  static const Color powderBlue = Color(0xFFC1D3FE);
  static const Color lightTeal = Color(0xFFB5F8F1);
  static const Color lightApricot = Color(0xFFFFD4B2);

  static const Color deepSkyBlue = Color(0xFF00BFFF);
  static const Color seaFoam = Color(0xFF93FFD8);
  static const Color pastelOrange = Color(0xFFFFB877);
  static const Color dustyRose = Color(0xFFE5989B);
  static const Color paleLavender = Color(0xFFE6E6FA);
  static const Color mellowYellow = Color(0xFFFFF3B0);
  static const Color freshMint = Color(0xFFBDFCC9);
  static const Color peachBlossom = Color(0xFFFFCAB0);
  static const Color glacierBlue = Color(0xFFA9D6E5);
  static const Color periwinkle = Color(0xFFB4C5E4);
  static const Color warmSand = Color(0xFFEED6C4);
  static const Color limeSorbet = Color(0xFFE5FCC2);
  static const Color coralMist = Color(0xFFFFB3AB);
  static const Color iceBlue = Color(0xFFDEF3F6);
  static const Color honeyGlow = Color(0xFFFFE8A1);
  static const Color mutedPlum = Color(0xFFBFA2DB);
  static const Color teaGreen = Color(0xFFD5F2E3);
  static const Color cantaloupe = Color(0xFFFFBC9A);

  static List<Color> listColor = [
    deepSkyBlue,
    seaFoam,
    pastelOrange,
    dustyRose,
    paleLavender,
    mellowYellow,
    freshMint,
    peachBlossom,
    glacierBlue,
    periwinkle,
    warmSand,
    limeSorbet,
    coralMist,
    iceBlue,
    honeyGlow,
    mutedPlum,
    teaGreen,
    cantaloupe,
  ];

  static const Color primaryLight = Color(0xFF007AFF);
  static const Color primaryDark = Color(0xFF007AFF);

  static const Color surfaceLight = Color(0xFFF8F8F8);
  static const Color surfaceDark = Color(0xFF262626);

  static const Color onSurfaceLight = Color(0xFFE6F2FF);
  static const Color onSurfaceDark = Color(0xFF00254D);

  static const Color secondaryLight = Color(0xFFD7D7D7);
  static const Color secondaryDark = Color(0xFF4C4C4C);
}
