import 'domain/entities/word_entity.dart';
import 'domain/entities/word_status_entity.dart';

void main() {
  final word = WordEntity(
    word: "apple",
    pos: "noun",
    phonetic: "/ˈæp.əl/",
    phoneticText: "ap-uhl",
    phoneticAm: "/ˈæp.əl/",
    phoneticAmText: "ap-uhl",
    senses: [],
    status: WordStatusEntity.unknown,
    index: 1,
    userDefinition: "A fruit",
  );
  final updatedWord = word.copyWith(
    userDefinition: "A red fruit",
    status: WordStatusEntity.star,
  );
  print(updatedWord.userDefinition);
  print(updatedWord.status.value);
  print(word.userDefinition);
}
