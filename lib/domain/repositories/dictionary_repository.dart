import '../entities/dictionary_entity.dart';

abstract interface class DictionaryRepository {
  Future<List<DictionaryEntity>> getDictionary();
}
