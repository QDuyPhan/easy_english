enum WordStatusEntity {
  unknown,
  mastered,
  star;

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
