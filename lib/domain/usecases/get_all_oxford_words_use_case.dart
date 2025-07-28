import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/oxford_words_repository.dart';

@injectable
class GetAllOxfordWordsUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;

  const GetAllOxfordWordsUseCase(this._oxfordWordsRepository);

  List<WordEntity> execute() {
    return _oxfordWordsRepository.getAllOxfordWords();
  }
}
