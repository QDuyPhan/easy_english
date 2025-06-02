import 'package:easy_english/domain/repositories/oxford_words_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InitDataUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;

  const InitDataUseCase(this._oxfordWordsRepository);

  Future<void> execute() async {
    await _oxfordWordsRepository.initData();
  }
}
