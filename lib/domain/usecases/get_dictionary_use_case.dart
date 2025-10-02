import 'package:injectable/injectable.dart';

import '../entities/dictionary_entity.dart';
import '../repositories/dictionary_repository.dart';

@injectable
class GetDictionaryUseCase {
  final DictionaryRepository _dictionaryRepository;

  const GetDictionaryUseCase(this._dictionaryRepository);

  Future<List<DictionaryEntity>> execute() async {
    return await _dictionaryRepository.getDictionary();
  }
}
