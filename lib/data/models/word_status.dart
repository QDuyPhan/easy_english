// import 'package:hive_flutter/hive_flutter.dart';
// part 'generated/word_status.g.dart';

// @HiveType(typeId: HiveTypes.wordStatus)
// enum WordStatus {
//   @HiveField(0)
//   unknown,
//   @HiveField(1)
//   mastered,
//   @HiveField(2)
//   star;
//
//   String get value {
//     switch (this) {
//       case WordStatus.unknown:
//         return 'Unknown';
//       case WordStatus.mastered:
//         return 'Mastered';
//       case WordStatus.star:
//         return 'Star';
//     }
//   }
// }

enum WordStatus {
  unknown,
  mastered,
  star;

  String get value {
    switch (this) {
      case WordStatus.unknown:
        return 'Unknown';
      case WordStatus.mastered:
        return 'Mastered';
      case WordStatus.star:
        return 'Star';
    }
  }
}
