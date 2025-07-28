import 'package:injectable/injectable.dart';

import '../repositories/oxford_words_repository.dart';

@injectable
class InitDataOxfordWordsUseCase {
  final OxfordWordsRepository _oxfordWordsRepository;

  const InitDataOxfordWordsUseCase(this._oxfordWordsRepository);

  Future<void> execute() async {
    await _oxfordWordsRepository.initData();
  }
}
