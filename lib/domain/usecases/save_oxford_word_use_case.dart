import 'package:injectable/injectable.dart';

import '../entities/word_entity.dart';
import '../repositories/oxford_words_repository.dart';

@injectable
class SaveOxfordWordUseCase {
  final OxfordWordsRepository _repo;

  const SaveOxfordWordUseCase(this._repo);

  Future<void> execute(WordEntity word) async {
    await _repo.saveWord(word);
  }
}
