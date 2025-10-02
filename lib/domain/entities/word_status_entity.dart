enum WordStatusEntity {
  unknown,
  mastered,
  star;

  static WordStatusEntity fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'mastered':
        return WordStatusEntity.mastered;
      case 'star':
        return WordStatusEntity.star;
      default:
        return WordStatusEntity.unknown;
    }
  }

  String get value {
    switch (this) {
      case WordStatusEntity.unknown:
        return 'Unknown';
      case WordStatusEntity.mastered:
        return 'Mastered';
      case WordStatusEntity.star:
        return 'Star';
    }
  }
}
