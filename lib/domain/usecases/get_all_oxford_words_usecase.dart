import 'package:easy_english/domain/entities/word_entity.dart';
import 'package:easy_english/domain/repositories/oxford_words_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOxfordWordsUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;

  GetAllOxfordWordsUseCase(this._oxfordWordsRepository);

  List<WordEntity> execute() {
    return _oxfordWordsRepository.getAllOxfordWords();
  }
}
